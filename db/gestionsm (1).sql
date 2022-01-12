-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 12 jan. 2022 à 10:46
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionsm`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `assistant`
--

CREATE TABLE `assistant` (
  `id_assistant` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `service_medical_id_service_medical` int(11) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id_consultation` int(11) NOT NULL,
  `date_consultation` datetime(6) NOT NULL,
  `diagnostic` varchar(255) DEFAULT NULL,
  `traitement` varchar(255) DEFAULT NULL,
  `dossier_medical_id_dossier_medical` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id_consultation`, `date_consultation`, `diagnostic`, `traitement`, `dossier_medical_id_dossier_medical`) VALUES
(1, '2022-01-03 16:19:54.000000', 'mal de tête', 'efferralgan', 1),
(2, '2022-01-12 16:19:54.000000', 'mal au dos', 'ca1000c', 2),
(3, '2022-01-03 16:19:54.000000', 'mal de tête', 'efferralgan', 1),
(4, '2022-01-12 16:19:54.000000', 'mal au dos', 'ca1000c', 1),
(5, '2022-01-05 15:56:52.108000', 'ttttt', 'ddddd', 1),
(6, '2022-01-05 15:57:23.650000', 'ttttt dernier', 'ddddd dernier', 1),
(7, '2022-01-05 17:26:49.838000', 'rhume', 'fervex', 2),
(8, '2022-01-12 09:13:31.428000', 'mal de tete', 'prendre CAC100', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `date_contact` datetime(6) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demanderv`
--

CREATE TABLE `demanderv` (
  `id` int(11) NOT NULL,
  `date_demande` datetime(6) NOT NULL,
  `medecin_id_medecin` int(11) DEFAULT NULL,
  `patient_id_patient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `demanderv`
--

INSERT INTO `demanderv` (`id`, `date_demande`, `medecin_id_medecin`, `patient_id_patient`) VALUES
(6, '2022-01-05 17:28:28.552000', 3, 2),
(7, '2022-01-06 00:47:15.247000', 3, 2),
(10, '2022-01-07 11:57:52.496000', 3, 2),
(14, '2022-01-07 12:16:57.187000', 1, 2),
(15, '2022-01-07 12:17:15.499000', 1, 2),
(16, '2022-01-09 22:18:35.689000', 1, 2),
(17, '2022-01-12 09:10:52.306000', 3, 2),
(18, '2022-01-12 09:11:36.483000', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `dossier_medical`
--

CREATE TABLE `dossier_medical` (
  `id_dossier_medical` int(11) NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  `medecin_id_medecin` int(11) NOT NULL,
  `patient_id_patient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dossier_medical`
--

INSERT INTO `dossier_medical` (`id_dossier_medical`, `date_creation`, `medecin_id_medecin`, `patient_id_patient`) VALUES
(1, '2022-01-19 16:19:27.000000', 3, 2),
(2, '2022-01-27 16:19:27.000000', 3, 1),
(7, '2022-01-07 22:20:38.007000', 1, 6),
(8, '2022-01-09 22:24:50.001000', 3, 7);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id_medecin` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `initial` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `num_licence` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `specialisation` varchar(255) DEFAULT NULL,
  `taille` int(11) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `service_medical_id_service_medical` int(11) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id_medecin`, `adresse`, `age`, `created_at`, `genre`, `initial`, `nom`, `num_licence`, `prenom`, `specialisation`, `taille`, `tel`, `service_medical_id_service_medical`, `user_iduser`) VALUES
(1, 'keur massar', 32, '2021-03-02', 'masculin', 'M SALL', 'sall', 'N123323232', 'ousmane', 'cardialogue', 133, '7759908977', 1, 2),
(3, 'dakka', 45, '2021-03-03', 'Masculin', 'Dr Diagne', 'Modou', '121313133', 'Diagne', 'Ophtalmologue', 166, '776909988', 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `memos`
--

CREATE TABLE `memos` (
  `id_memos` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `medecin_id_medecin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `memos`
--

INSERT INTO `memos` (`id_memos`, `created_at`, `message`, `titre`, `medecin_id_medecin`) VALUES
(3, '2022-01-11', 'Bonjour est le terme de salutation que l\'on utilise durant la journée, c\'est une formule de politesse que l\'on adresse à quelqu\'un.', 'Bonjour', 1),
(4, '2022-01-12', 'nouveau ', 'msg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id_notification` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `medecin_id_medecin` int(11) DEFAULT NULL,
  `patient_id_patient` int(11) DEFAULT NULL,
  `rendez_vous_id_rendez_vous` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id_patient` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `statut_social` varchar(255) DEFAULT NULL,
  `taille` int(11) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id_patient`, `adresse`, `age`, `created_at`, `genre`, `nom`, `prenom`, `profession`, `statut_social`, `taille`, `tel`, `user_iduser`) VALUES
(1, 'adresse', 12, '2021-03-03', 'feminin', 'nom de nom', 'prenom d', 'etidiant', 'social ', 123, '778009898', 1),
(2, 'DAKAR', 59, '2021-04-03', 'Féminin', 'khouma', 'assane', 'etudiant', 'celibataire', 157, '789009888', 3),
(6, 'keur massar', 21, '2022-01-04', 'Féminin', 'sall', 'amina', 'student', 'Célibataire', 170, '770090000', 8),
(7, 'teuguedj', 23, '2022-01-04', 'Masculin', 'khouma 2', 'ousseynou', 'etudiante', 'Célibataire', 123, '709000909', 9);

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `id_rendez_vous` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `date_rv` date DEFAULT NULL,
  `heure` varchar(255) DEFAULT NULL,
  `medecin_id_medecin` int(11) DEFAULT NULL,
  `patient_id_patient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rendezvous`
--

INSERT INTO `rendezvous` (`id_rendez_vous`, `created_at`, `date_rv`, `heure`, `medecin_id_medecin`, `patient_id_patient`) VALUES
(8, '2022-01-03', '2022-01-04', '20:00', 3, 1),
(9, '2022-01-03', '2022-01-04', '20:00', 3, 1),
(11, '2022-01-03', '2022-01-04', '20:00', 3, 2),
(12, '2022-01-03', '2022-01-04', '20:00', 3, 2),
(13, '2022-01-03', '2022-01-31', '20:00', 3, 2),
(14, '2022-01-03', '2022-01-31', '01:00', 3, 2),
(15, '2022-01-04', '2022-01-28', '12:50', 3, 2),
(16, '2022-01-05', '2022-01-05', '10:05', 3, 2),
(17, '2022-01-07', '2022-01-08', '10:00', 3, 2),
(18, '2022-01-12', '2022-01-13', '10:00', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `service_medical`
--

CREATE TABLE `service_medical` (
  `id_service_medical` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `service_medical`
--

INSERT INTO `service_medical` (`id_service_medical`, `created_at`, `nom`) VALUES
(1, '2021-03-02', 'Keur ya Sokhna '),
(2, '2021-04-04', 'khouma');

-- --------------------------------------------------------

--
-- Structure de la table `user_model`
--

CREATE TABLE `user_model` (
  `iduser` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_model`
--

INSERT INTO `user_model` (`iduser`, `created_at`, `email`, `password`, `role`) VALUES
(1, '2021-03-10 00:00:00.000000', 'testp@test.com', '$2a$10$hfwcYMRHckJPkiKdFIuHuevFfahm6cQKZBSr74HTwifnu52F9YJz6', 'patient'),
(2, '2021-03-03 00:00:00.000000', 'testm@test.com', '$2a$10$hfwcYMRHckJPkiKdFIuHuevFfahm6cQKZBSr74HTwifnu52F9YJz6', 'medecin'),
(3, '2021-04-03 00:00:00.000000', 'patient@test.com', '$2a$10$c37MADwr1AuhVvj8BHiiJOweFFnjsCo7X9lEtLGhRczA8c37I0bfa', 'patient'),
(4, '2021-04-04 17:15:15.000000', 'medecin@test.com', '$2a$10$c37MADwr1AuhVvj8BHiiJOweFFnjsCo7X9lEtLGhRczA8c37I0bfa', 'medecin'),
(5, '2021-04-04 21:06:00.000000', 'admin@admin.com', '$2a$10$c37MADwr1AuhVvj8BHiiJOweFFnjsCo7X9lEtLGhRczA8c37I0bfa', 'admin'),
(8, '2022-01-04 00:00:00.000000', 'amina@test.com', '$2a$10$87lXR0bxWocwYo.1ztfrm.wXhSDiLjlkpAlpgDzmG./5oWkQH5Ixi', 'patient'),
(9, '2022-01-04 00:00:00.000000', 'ousseynou@test.com', '$2a$10$C.hjUKVT03y2tmsB8FBT8.WmRMZFm82WzxNeHiEMNsWdqedEwVPwK', 'patient');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `FKe5q2ruxkw1q4jbn68kwm2m020` (`user_iduser`);

--
-- Index pour la table `assistant`
--
ALTER TABLE `assistant`
  ADD PRIMARY KEY (`id_assistant`),
  ADD KEY `FK96t5tud2m3djwsj26oqvdy9qd` (`service_medical_id_service_medical`),
  ADD KEY `FK5opsvrifbhlfaovmb4pn0ddhr` (`user_iduser`);

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id_consultation`),
  ADD KEY `FKs3kv1t69106ykpwyopemn3g7p` (`dossier_medical_id_dossier_medical`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demanderv`
--
ALTER TABLE `demanderv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoyfku9fc8t38qs0a4uay0tmj8` (`medecin_id_medecin`),
  ADD KEY `FK7cjfgl6ltj0ki5ratw4kh6ugf` (`patient_id_patient`);

--
-- Index pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD PRIMARY KEY (`id_dossier_medical`),
  ADD KEY `FKk3yp1djo2qlltds38i6488nsn` (`medecin_id_medecin`),
  ADD KEY `FK39t4r3spibuk70swvkjb3done` (`patient_id_patient`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id_medecin`),
  ADD KEY `FKkf5xjmuwqjfcvc5c1c2tp7ltc` (`service_medical_id_service_medical`),
  ADD KEY `FK7j3npxd4e9vwh28m3jk4me1d` (`user_iduser`);

--
-- Index pour la table `memos`
--
ALTER TABLE `memos`
  ADD PRIMARY KEY (`id_memos`),
  ADD KEY `FK6njspb6p6gef7dm4k14moimsg` (`medecin_id_medecin`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `FKfdscnnuod9850a8i6r9vpdm34` (`medecin_id_medecin`),
  ADD KEY `FKkxkufg9vjh084nq7wmekx80bh` (`patient_id_patient`),
  ADD KEY `FKt2b6srs84hxokh5nufva4lw6a` (`rendez_vous_id_rendez_vous`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`),
  ADD KEY `FKfoh0t2n9m5gy9sqd22h7g8lvr` (`user_iduser`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`id_rendez_vous`),
  ADD KEY `FKbr85fur2fqp7axt9q42np034i` (`medecin_id_medecin`),
  ADD KEY `FKrun15b47i4ilndu6g3ru85baw` (`patient_id_patient`);

--
-- Index pour la table `service_medical`
--
ALTER TABLE `service_medical`
  ADD PRIMARY KEY (`id_service_medical`);

--
-- Index pour la table `user_model`
--
ALTER TABLE `user_model`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assistant`
--
ALTER TABLE `assistant`
  MODIFY `id_assistant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id_consultation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demanderv`
--
ALTER TABLE `demanderv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  MODIFY `id_dossier_medical` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id_medecin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `memos`
--
ALTER TABLE `memos`
  MODIFY `id_memos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notification` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id_patient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `id_rendez_vous` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `service_medical`
--
ALTER TABLE `service_medical`
  MODIFY `id_service_medical` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_model`
--
ALTER TABLE `user_model`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FKe5q2ruxkw1q4jbn68kwm2m020` FOREIGN KEY (`user_iduser`) REFERENCES `user_model` (`iduser`);

--
-- Contraintes pour la table `assistant`
--
ALTER TABLE `assistant`
  ADD CONSTRAINT `FK5opsvrifbhlfaovmb4pn0ddhr` FOREIGN KEY (`user_iduser`) REFERENCES `user_model` (`iduser`),
  ADD CONSTRAINT `FK96t5tud2m3djwsj26oqvdy9qd` FOREIGN KEY (`service_medical_id_service_medical`) REFERENCES `service_medical` (`id_service_medical`);

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FKs3kv1t69106ykpwyopemn3g7p` FOREIGN KEY (`dossier_medical_id_dossier_medical`) REFERENCES `dossier_medical` (`id_dossier_medical`);

--
-- Contraintes pour la table `demanderv`
--
ALTER TABLE `demanderv`
  ADD CONSTRAINT `FK7cjfgl6ltj0ki5ratw4kh6ugf` FOREIGN KEY (`patient_id_patient`) REFERENCES `patient` (`id_patient`),
  ADD CONSTRAINT `FKoyfku9fc8t38qs0a4uay0tmj8` FOREIGN KEY (`medecin_id_medecin`) REFERENCES `medecin` (`id_medecin`);

--
-- Contraintes pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD CONSTRAINT `FK39t4r3spibuk70swvkjb3done` FOREIGN KEY (`patient_id_patient`) REFERENCES `patient` (`id_patient`),
  ADD CONSTRAINT `FKk3yp1djo2qlltds38i6488nsn` FOREIGN KEY (`medecin_id_medecin`) REFERENCES `medecin` (`id_medecin`);

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `FK7j3npxd4e9vwh28m3jk4me1d` FOREIGN KEY (`user_iduser`) REFERENCES `user_model` (`iduser`),
  ADD CONSTRAINT `FKkf5xjmuwqjfcvc5c1c2tp7ltc` FOREIGN KEY (`service_medical_id_service_medical`) REFERENCES `service_medical` (`id_service_medical`);

--
-- Contraintes pour la table `memos`
--
ALTER TABLE `memos`
  ADD CONSTRAINT `FK6njspb6p6gef7dm4k14moimsg` FOREIGN KEY (`medecin_id_medecin`) REFERENCES `medecin` (`id_medecin`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKfdscnnuod9850a8i6r9vpdm34` FOREIGN KEY (`medecin_id_medecin`) REFERENCES `medecin` (`id_medecin`),
  ADD CONSTRAINT `FKkxkufg9vjh084nq7wmekx80bh` FOREIGN KEY (`patient_id_patient`) REFERENCES `patient` (`id_patient`),
  ADD CONSTRAINT `FKt2b6srs84hxokh5nufva4lw6a` FOREIGN KEY (`rendez_vous_id_rendez_vous`) REFERENCES `rendezvous` (`id_rendez_vous`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FKfoh0t2n9m5gy9sqd22h7g8lvr` FOREIGN KEY (`user_iduser`) REFERENCES `user_model` (`iduser`);

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `FKbr85fur2fqp7axt9q42np034i` FOREIGN KEY (`medecin_id_medecin`) REFERENCES `medecin` (`id_medecin`),
  ADD CONSTRAINT `FKrun15b47i4ilndu6g3ru85baw` FOREIGN KEY (`patient_id_patient`) REFERENCES `patient` (`id_patient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
