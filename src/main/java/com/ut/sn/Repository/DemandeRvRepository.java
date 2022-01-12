package com.ut.sn.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ut.sn.Modeles.DemandeRV;
import com.ut.sn.Modeles.Medecin;
import com.ut.sn.Modeles.Patient;



@Repository
public interface DemandeRvRepository extends JpaRepository<DemandeRV, Integer> {

	Optional<DemandeRV> findById(Integer id );

	List<DemandeRV> findAllByPatient(Patient patient);
	
	List<DemandeRV> findAllBymedecin(Medecin medecin);
}
