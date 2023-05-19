-- 1. Zadatak 
-- U frizerskom salonu radi više djelatnica. Jedna djelatnica na dan radi 
-- s više korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga.

drop database if exists zadatak01;
create database zadatak01;
use zadatak01;

create table frizerski_salon (
	id_frizerski_salon int not null primary key auto_increment,	
	adresa varchar (50),
	broj_telefona varchar(50)
);

create table djelatnik (
	id_djelatnik int  not null primary key auto_increment,
	id_frizerski_salon int not null,
	id_osoba int not null,
	iban varchar(21)	
);

create table klijent (
	id_klijent int not null primary key auto_increment,
	id_djelatnik int not null,
	id_osoba int not null,
	id_usluga int not null	
);

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50)
);

create table usluga (
	id_usluga int not null primary key auto_increment,	
	vrsta_usluge varchar(50),
	cijena decimal(13,2),
	nacin_placanja varchar(50),
	datum_izdavanja_usluge date 
);

alter table djelatnik add foreign key (id_frizerski_salon)
references frizerski_salon(id_frizerski_salon);

alter table djelatnik add foreign key (id_osoba)
references osoba(id_osoba);

alter table klijent add foreign key (id_djelatnik)
references djelatnik(id_djelatnik);

alter table klijent add foreign key (id_osoba)
references osoba(id_osoba);

alter table klijent add foreign key (id_usluga)
references usluga(id_usluga);