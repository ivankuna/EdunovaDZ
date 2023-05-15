-- 10. Zadatak 
-- Doktor liječi pacijente. Jednog pacijenta može liječiti više puta.  
-- U liječenju pacijenta doktoru pomažu medicinske sestre.

drop database if exists zadatak10;
create database zadatak10;
use zadatak10;

create table doktor (
	id_doktor int not null primary key auto_increment, 
	id_osoba int not null,
	iban varchar(21)
);

create table pacijent (
	id_pacijent int not null primary key auto_increment, 
	id_osoba int not null
);

create table lijecenje (
	id_lijecenje int not null primary key auto_increment,
	id_doktor int not null,
	id_pacijent int not null,
	iban varchar(21)
);

create table medicinska_sestra (
	id_medicinska_sestra int not null primary key auto_increment,
	id_osoba int not null,
	id_lijecenje int not null,
	iban varchar(21)
);

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50)
);

alter table doktor add foreign key (id_osoba)
references osoba(id_osoba);

alter table pacijent add foreign key (id_osoba)
references osoba(id_osoba);

alter table lijecenje add foreign key (id_doktor)
references doktor(id_doktor);

alter table lijecenje add foreign key (id_pacijent)
references pacijent(id_pacijent);

alter table medicinska_sestra add foreign key (id_osoba)
references osoba(id_osoba);

alter table medicinska_sestra add foreign key (id_lijecenje)
references lijecenje(id_lijecenje);