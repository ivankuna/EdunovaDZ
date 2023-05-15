-- 7. Zadatak 
-- Taksi tvrtka ima više vozila. Jedno vozilo vozi jedan vozač. U jednoj vožnji vozač može  
-- prevesti više putnika. Jedan putnik se naravno može tijekom vremena imati više vožnji.

drop database if exists zadatak07;
create database zadatak07;
use zadatak07;

create table taksi_tvrtka (
	id_taksi_tvrtka int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table vozilo (
	id_vozilo int not null primary key auto_increment, 
	id_vozac int not null,
	id_taksi_tvrtka int not null,
	registracija varchar(50) not null,
	godina_proizvodnje date not null
	
);

create table vozac (
	id_vozac int not null primary key auto_increment,
	id_osoba int not null,
	iban varchar(21)
);

create table voznja (
	id_voznja int not null auto_increment primary key,
	id_vozilo int not null,
	predjeni_km decimal(12,2),
	cijena decimal(12,2)
);

create table putnik (
	id_putnik int not null auto_increment primary key,
	id_osoba int not null	
);

create table osoba (
	id_osoba int not null auto_increment primary key,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50)
);

create table voznja_putnik (
	id_voznja_putnik int not null auto_increment primary key,
	id_voznja int not null,
	id_putnik int not null
);

alter table vozilo add constraint uc_vozac UNIQUE (id_vozac);

alter table vozilo add foreign key (id_taksi_tvrtka)
references taksi_tvrtka(id_taksi_tvrtka);

alter table vozac add foreign key (id_osoba)
references osoba(id_osoba);

alter table voznja add foreign key (id_vozilo)
references vozilo(id_vozilo);

alter table putnik add foreign key (id_osoba)
references osoba(id_osoba);

alter table voznja_putnik add foreign key (id_voznja)
references voznja(id_voznja);

alter table voznja_putnik add foreign key (id_putnik)
references putnik(id_putnik);

alter table vozilo add foreign key (id_vozac)
references vozac(id_vozac);

 