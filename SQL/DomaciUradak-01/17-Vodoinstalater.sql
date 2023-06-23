-- 17. Zadatak 
-- Vodoinstalater popravlja kvarove na vodovodnim instalacijama. Tijekom jednog popravka može popraviti   
-- više kvarova a jedan kvar se može popravljati više puta. Na određenim popravcima mu pomaže njegov šegrt.

drop database if exists zadatak17;
create database zadatak17;
use zadatak17;

create table vodoinstalater (
	id_vodoinstalater int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21),
	broj_telefona varchar(50)
);

create table popravak (
	id_popravak int not null primary key auto_increment, 
	id_vodoinstalater int not null,
	id_segrt int,
	vrsta_popravka varchar(50),
	cijena decimal(12,2)
);

create table kvar (
	id_kvar int not null primary key auto_increment, 
	vrsta_kvara varchar(50),
	datum_prijave_kvara date
);

create table popravak_kvar (
	id_popravak_kvar int not null primary key auto_increment, 
	id_popravak int not null,
	id_kvar int not null
);

create table segrt (
	id_segrt int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21),
	broj_telefona varchar(50)
);

alter table popravak add foreign key (id_vodoinstalater)
references vodoinstalater(id_vodoinstalater);

alter table popravak add foreign key (id_segrt)
references segrt(id_segrt);

alter table popravak_kvar add foreign key (id_popravak)
references popravak(id_popravak);

alter table popravak_kvar add foreign key (id_kvar)
references kvar(id_kvar);