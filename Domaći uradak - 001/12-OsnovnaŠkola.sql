-- 12. Zadatak 
-- U osnovnoj školi postoje dječje radionice. Na jednoj radionici sudjeluje više djece.  
-- Jedno dijete može sudjelovati na više radionica. Radionicu vodi jedna učiteljica.

drop database if exists zadatak12;
create database zadatak12;
use zadatak12;

create table skola (
	id_skola int primary key auto_increment, 
	naziv varchar(50) not null,
	adresa varchar(50) not null,
	broj_telefona varchar(50) not null
);

create table radionica (
	id_radionica int primary key auto_increment,  
	id_skola int not null,
	id_ucitelj int not null,
	naziv_radionice varchar(50) not null,
	ucionica int not null,
	max_broj_djece int not null,
	trajanje int not null
);

create table dijete (
	id_dijete int primary key auto_increment, 
	id_osoba int not null,
	razred varchar(2)
);

create table ucitelj (
	id_ucitelj int primary key auto_increment, 
	id_osoba int not null,
	iban varchar(21) not null,
	email varchar(50) not null
);

create table osoba (
	id_osoba int primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(50)	
);

create table prijava  (
  id_prijava int primary key auto_increment,
  id_dijete int,
  id_radionica int
);


alter table radionica add foreign key (id_skola)
references skola(id_skola);


alter table radionica add foreign key (id_ucitelj)
references ucitelj(id_ucitelj);


alter table dijete add foreign key (id_osoba)
references osoba(id_osoba);

alter table ucitelj add foreign key (id_osoba)
references osoba(id_osoba);

alter table prijava add foreign key (id_dijete)
references dijete(id_dijete);

alter table prijava add foreign key (id_radionica)
references radionica(id_radionica);
