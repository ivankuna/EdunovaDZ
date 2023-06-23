-- 18. Zadatak 
-- Jedan odvjetnik brani više klijenata. Jednog klijenta može braniti više puta. U obranama mu pomažu   
-- suradnici. Na jednoj obrani može biti više suradnika a jedan suradnik može sudjelovati na više obrana.

drop database if exists zadatak18;
create database zadatak18;
use zadatak18;

create table odvjetnik (
	id_odvjetnik int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21),
	broj_telefona varchar(50)
);

create table klijent (
	id_klijent int not null primary key auto_increment, 
	id_odvjetnik int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	broj_telefona varchar(50)
);

create table suradnik (
	id_suradnik int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21),
	broj_telefona varchar(50)
);

create table obrana (
	id_obrana int not null primary key auto_increment, 
	id_klijent int not null,
	cijena varchar(50),
	razdoblje_od date,
	razdoblje_do date
);

create table obrana_suradnik (
	id_obrana_suradnik int not null primary key auto_increment, 
	id_obrana int not null,
	id_suradnik int not null
);

alter table klijent add foreign key (id_odvjetnik)
references odvjetnik(id_odvjetnik);

alter table obrana add foreign key (id_klijent)
references klijent(id_klijent);

alter table obrana_suradnik add foreign key (id_obrana)
references obrana(id_obrana);

alter table obrana_suradnik add foreign key (id_suradnik)
references suradnik(id_suradnik);
