-- 2. Zadatak 
-- U salonu za uljepšavanje radi više djelatnica. Jedna djelatnica na dan radi 
-- s više korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga.
 
drop database if exists zadatak02;
create database zadatak02;
use zadatak02;

create table salon_za_uljepsavanje (
	id_salon_za_uljepsavanje int  not null primary key auto_increment, 
	adresa varchar (50) not null,
	broj_telefona varchar(50) not null
);

create table djelatnik (
	id_djelatnik int  not null primary key auto_increment,
	id_salon_za_uljepsavanje int not null,
	id_osoba int not null,
	iban varchar(21) not null
);

create table klijent (
	id_klijent int not null primary key auto_increment,
	id_djelatnik int not null,
	id_usluga int not null,
	id_osoba int not null		
);

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11) not null,
	email varchar(50) not null
);

create table usluga (
	id_usluga int not null primary key auto_increment,	
	id_vrsta_usluge int not null,
	nacin_placanja varchar(50) not null,
	datum_izdavanja_usluge date not null
);

create table vrsta_usluge (
	id_vrsta_usluge int not null primary key auto_increment,	
	naziv_vrste_usluge varchar(50) not null,
	cijena decimal(13,2)	
);

alter table djelatnik add foreign key (id_salon_za_uljepsavanje)
references salon_za_uljepsavanje(id_salon_za_uljepsavanje);

alter table djelatnik add foreign key (id_osoba)
references osoba(id_osoba);

alter table klijent add foreign key (id_djelatnik)
references djelatnik(id_djelatnik);

alter table klijent add foreign key (id_usluga)
references usluga(id_usluga);

alter table klijent add foreign key (id_osoba)
references osoba(id_osoba);

alter table usluga add foreign key (id_vrsta_usluge)
references vrsta_usluge(id_vrsta_usluge);
