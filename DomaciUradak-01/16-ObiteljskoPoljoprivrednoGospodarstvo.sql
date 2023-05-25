-- 16. Zadatak 
-- OPG proizvodi proizvode od sirovina koje sami uzgoje. Jedan proizvod se može sastojati od više sirovina. Jedna   
-- sirovina se može nalaziti u više proizvoda. Jedan djelatnik OPG-a je odgovoran za jedan ili više proizvoda.

drop database if exists zadatak16;
create database zadatak16;
use zadatak16;

create table opg (
	id_opg int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table proizvod (
	id_proizvod int not null primary key auto_increment, 
	id_opg int not null,
	id_djelatnik int not null,
	naziv_proizvoda varchar(50),
	cijena decimal(12,2)
);

create table sirovina (
	id_sirovina int not null primary key auto_increment, 
	naziv_sirovine varchar(50),
	godina_usijeva date
);

create table proizvod_sirovina (
	id_proizvod_sirovina int not null primary key auto_increment, 
	id_proizvod int not null,
	id_sirovina int not null
);

create table djelatnik (
	id_djelatnik int not null primary key auto_increment, 
	id_opg int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21)
);

alter table proizvod add foreign key (id_opg)
references opg(id_opg);

alter table proizvod add foreign key (id_djelatnik)
references djelatnik(id_djelatnik);

alter table djelatnik add foreign key (id_opg)
references opg(id_opg);

alter table proizvod_sirovina add foreign key (id_proizvod)
references proizvod(id_proizvod);

alter table proizvod_sirovina add foreign key (id_sirovina)
references sirovina(id_sirovina);


