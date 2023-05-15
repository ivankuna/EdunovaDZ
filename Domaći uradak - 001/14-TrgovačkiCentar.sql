-- 14. Zadatak 
-- U jednom trgovačkom centru postoji više trgovina. U svakoj trgovini radi više osoba. Jedna  
-- osoba može raditi u više trgovina. Svaka trgovina ima jednog šefa koji je ujedno i osoba.

drop database if exists zadatak14;
create database zadatak14;
use zadatak14;

create table trgovacki_centar (
	id_trgovacki_centar int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50)
);
create table trgovina (
	id_trgovina int not null primary key auto_increment, 
	id_trgovacki_centar int not null,
	naziv varchar(50),
	broj_telefona varchar(50)
);
create table osoba (
	id_osoba int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	id_sef int
);

create table trgovina_osoba (
	id_trgovina_osoba int not null primary key auto_increment,
	id_trgovina int not null,
	id_osoba int not null
);

alter table osoba add foreign key (id_sef)
references osoba(id_osoba);

alter table trgovina add foreign key (id_trgovacki_centar)
references trgovacki_centar(id_trgovacki_centar);

alter table trgovina_osoba add foreign key (id_trgovina)
references trgovina(id_trgovina);

alter table trgovina_osoba add foreign key (id_osoba)
references osoba(id_osoba);

 