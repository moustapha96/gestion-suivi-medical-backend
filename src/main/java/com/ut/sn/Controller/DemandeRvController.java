package com.ut.sn.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ut.sn.Modeles.DemandeRV;
import com.ut.sn.Modeles.Medecin;
import com.ut.sn.Modeles.Patient;
import com.ut.sn.Repository.DemandeRvRepository;
import com.ut.sn.Repository.MedecinRepository;
import com.ut.sn.Repository.PatientRepository;
import com.ut.sn.exception.ResourceNotFoundException;
@CrossOrigin(origins= "http://localhost:9000")
@RestController
@RequestMapping("/api")
public class DemandeRvController {

	@Autowired
	DemandeRvRepository repository;
	@Autowired PatientRepository repoPatient;
	@Autowired MedecinRepository repoMedecin;
	
	@GetMapping("/demandeRVs")
	public List<DemandeRV> getAllDemandeRV() {
		System.out.println("Get all DemandeRVs...");

		List<DemandeRV> DemandeRVs = new ArrayList<>();
		repository.findAll().forEach(DemandeRVs::add);

		return DemandeRVs;
	}

	@PostMapping("/demandeRVs")
	public Map<String, Boolean> ajouterDemandeRV(@RequestBody DemandeRV pd) {
		DemandeRV newPr = repository.save(pd);
		List<DemandeRV> all = repository.findAll();
		int nbr = 0;
		for (DemandeRV demandeRV : all) {
			if (demandeRV.getMedecin() == pd.getMedecin() && demandeRV.getPatient() == pd.getPatient() ) {
				nbr++;
			}
		}
		Map<String, Boolean> response = new HashMap<>();
		if ( nbr >= 3 ) {
			response.put("DemandeRV non envoyé, nbre max de demande ateint", Boolean.FALSE);
		}
		response.put("DemandeRV envoyé", Boolean.TRUE);
		
		return response;
		
	}

	@GetMapping("/demandeRVs/{id}")
	public ResponseEntity<DemandeRV> getDemandeRVById(@PathVariable(value = "id") Integer Id) throws ResourceNotFoundException {
		DemandeRV DemandeRV = repository.findById(Id)
				.orElseThrow(() -> new ResourceNotFoundException("DemandeRV non trouvé  :: " + Id));
		return ResponseEntity.ok().body(DemandeRV);
	}

	@GetMapping("/demandeRVs/patient/{id}")
	public List<DemandeRV> getAllDemandeRVPatient(@PathVariable(value = "id") Integer Id) {
		System.out.println("Get all DemandeRVs...");
		Patient patient = new Patient();
		
		Optional<Patient> pa = repoPatient.findByIdPatient(Id);
		if(pa.isPresent()){
			 patient = pa.get();
		}
		List<DemandeRV> DemandeRVs = new ArrayList<>();
		repository.findAllByPatient(patient).forEach(DemandeRVs::add);
		
		return DemandeRVs;
	}
	
	@GetMapping("/demandeRVs/medecin/{id}")
	public List<DemandeRV> getAllDemandeRVMedecin(@PathVariable(value = "id") Integer Id) {
		System.out.println("Get all DemandeRVs...");
		Medecin medecin = new Medecin();
		
		Optional<Medecin> me = repoMedecin.findByIdMedecin(Id);
		if(me.isPresent()){
			 medecin = me.get();
		}
		List<DemandeRV> DemandeRVs = new ArrayList<>();
		repository.findAllBymedecin(medecin).forEach(DemandeRVs::add);
		
		return DemandeRVs;
	}

	@DeleteMapping("/demandeRVs/{id}")
	public Map<String, Boolean> deleteDemandeRV(@PathVariable(value = "id") Integer DemandeRVId)
			throws ResourceNotFoundException {
		DemandeRV demandeRV = repository.findById(DemandeRVId)
				.orElseThrow(() -> new ResourceNotFoundException("DemandeRV non trouvé :: " + DemandeRVId));
		repository.delete(demandeRV);

		Map<String, Boolean> response = new HashMap<>();
		response.put("DemandeRV supprimé", Boolean.TRUE);
		return response;
	}
	

	@DeleteMapping("/demandeRVs/delete")
	public ResponseEntity<String> deleteAllDemandeRVs() {
		System.out.println("Delete All DemandeRVs...");
		repository.deleteAll();
		return new ResponseEntity<>("tout les DemandeRVs ont été supprimer de la base ", HttpStatus.OK);
	}

	@PutMapping("/demandeRVs/{id}")
	public ResponseEntity<DemandeRV> updateDemandeRV(@PathVariable("id") Integer id, @RequestBody DemandeRV DemandeRV) {
		System.out.println("Update Article with ID = " + id + "...");
		Optional<DemandeRV> demandeRVInfo = repository.findById(id);
		if (demandeRVInfo.isPresent()) {
			
			DemandeRV demandeRV = demandeRVInfo.get();
			DemandeRV.setDate_demande(demandeRV.getDate_demande());
			DemandeRV.setPatient(demandeRV.getPatient());
			DemandeRV.setMedecin(demandeRV.getMedecin());
			
			return new ResponseEntity<>(repository.save(DemandeRV), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
