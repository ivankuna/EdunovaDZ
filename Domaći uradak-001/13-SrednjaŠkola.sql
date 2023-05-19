-- 13. Zadatak 
-- Jedna srednja škola ima više razreda. Jedan razred pohađa više učenika. U jednom  
-- razredu predaje više profesora. Jedan profesor može predavati u više razreda.

drop database if exists zadatak13;
create database zadatak13;
use zadatak13;

create table skola (
	id_skola int primary key auto_increment, 
	naziv varchar(50) not null,
	adresa varchar(50) not null,
	broj_telefona varchar(50) not null
);

create table razred (
	id_razred int primary key auto_increment, 
	id_skola int not null,
	oznaka_razreda varchar(2) not null,
	max_bruj_ucenika int not null
);

create table ucenik (
	id_ucenik int primary key auto_increment, 
	id_razred int not null,
	id_osoba int not null
);


create table profesor (
	id_profesor int primary key auto_increment, 
	id_osoba int not null,
	oib varchar(11),
	iban varchar(21)
);

create table profesor_razred (
	id_profesor_razred int primary key auto_increment, 
	id_profesor int not null,
	id_razred int not null
);

create table osoba (
	id_osoba int primary key auto_increment, 
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib varchar(11) not null
);


alter table razred add foreign key (id_skola)
references skola(id_skola);

alter table ucenik add foreign key (id_razred)
references razred(id_razred);

alter table ucenik add foreign key (id_osoba)
references osoba(id_osoba);

alter table profesor add foreign key (id_osoba)
references osoba(id_osoba);

alter table profesor_razred add foreign key (id_profesor)
references profesor(id_profesor);

alter table profesor_razred add foreign key (id_razred)
references razred(id_razred);



