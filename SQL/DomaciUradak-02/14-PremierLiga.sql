drop database if exists premier_liga;
create database premier_liga;
use premier_liga;

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `lozinka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_korisnik`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `mjesto` (
  `id_mjesto` int(11) NOT NULL AUTO_INCREMENT,
  `ime_mjesta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mjesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `trener` (
  `id_trener` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  PRIMARY KEY (`id_trener`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `nogometni_klub` (
  `id_nogometni_klub` int(11) NOT NULL AUTO_INCREMENT,
  `id_trener` int(11) NOT NULL,
  `mjesto_na_ljestvici` int(11) DEFAULT NULL,
  `naziv_nogometnog_kluba` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nogometni_klub`),
  KEY `id_trener` (`id_trener`),
  CONSTRAINT `nogometni_klub_ibfk_1` FOREIGN KEY (`id_trener`) REFERENCES `trener` (`id_trener`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `stadion` (
  `id_stadion` int(11) NOT NULL AUTO_INCREMENT,
  `id_mjesto` int(11) NOT NULL,
  `naziv_stadiona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_stadion`),
  KEY `id_mjesto` (`id_mjesto`),
  CONSTRAINT `stadion_ibfk_1` FOREIGN KEY (`id_mjesto`) REFERENCES `mjesto` (`id_mjesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `utakmica` (
  `id_utakmica` int(11) NOT NULL AUTO_INCREMENT,
  `id_stadion` int(11) NOT NULL,
  `datum_utakmice` date DEFAULT NULL,
  `domaca_ekipa` int(11) NOT NULL,
  `gostujuca_ekipa` int(11) NOT NULL,
  PRIMARY KEY (`id_utakmica`),
  KEY `id_stadion` (`id_stadion`),
  KEY `domaca_ekipa` (`domaca_ekipa`),
  KEY `gostujuca_ekipa` (`gostujuca_ekipa`),
  CONSTRAINT `utakmica_ibfk_1` FOREIGN KEY (`id_stadion`) REFERENCES `stadion` (`id_stadion`),
  CONSTRAINT `utakmica_ibfk_2` FOREIGN KEY (`domaca_ekipa`) REFERENCES `nogometni_klub` (`id_nogometni_klub`),
  CONSTRAINT `utakmica_ibfk_3` FOREIGN KEY (`gostujuca_ekipa`) REFERENCES `nogometni_klub` (`id_nogometni_klub`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `igrac` (
  `id_igrac` int(11) NOT NULL AUTO_INCREMENT,
  `id_nogometni_klub` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `pozicija` varchar(50) NOT NULL,
  `broj_dresa` int(11) NOT NULL,
  PRIMARY KEY (`id_igrac`),
  KEY `id_nogometni_klub` (`id_nogometni_klub`),
  CONSTRAINT `igrac_ibfk_1` FOREIGN KEY (`id_nogometni_klub`) REFERENCES `nogometni_klub` (`id_nogometni_klub`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `oklada` (
  `id_oklada` int(11) NOT NULL AUTO_INCREMENT,
  `id_korisnik` int(11) NOT NULL,
  `id_utakmica` int(11) NOT NULL,
  `id_nogometni_klub` int(11) NOT NULL,
  `iznos_uloga` decimal(12,2) DEFAULT NULL,
  `tip_oklade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_oklada`),
  KEY `id_korisnik` (`id_korisnik`),
  KEY `id_utakmica` (`id_utakmica`),
  KEY `id_nogometni_klub` (`id_nogometni_klub`),
  CONSTRAINT `oklada_ibfk_1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`),
  CONSTRAINT `oklada_ibfk_2` FOREIGN KEY (`id_utakmica`) REFERENCES `utakmica` (`id_utakmica`),
  CONSTRAINT `oklada_ibfk_3` FOREIGN KEY (`id_nogometni_klub`) REFERENCES `nogometni_klub` (`id_nogometni_klub`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ulaznica` (
  `id_ulaznica` int(11) NOT NULL AUTO_INCREMENT,
  `id_utakmica` int(11) NOT NULL,
  `cijena` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_ulaznica`),
  KEY `id_utakmica` (`id_utakmica`),
  CONSTRAINT `ulaznica_ibfk_1` FOREIGN KEY (`id_utakmica`) REFERENCES `utakmica` (`id_utakmica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `rezervacija` (
  `id_rezervacija` int(11) NOT NULL AUTO_INCREMENT,
  `id_korisnik` int(11) NOT NULL,
  `id_ulaznica` int(11) NOT NULL,
  `cijena_rezervacije` decimal(12,2) DEFAULT NULL,
  `status_rezervacije` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_rezervacija`),
  KEY `id_korisnik` (`id_korisnik`),
  KEY `id_ulaznica` (`id_ulaznica`),
  CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`),
  CONSTRAINT `rezervacija_ibfk_2` FOREIGN KEY (`id_ulaznica`) REFERENCES `ulaznica` (`id_ulaznica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;