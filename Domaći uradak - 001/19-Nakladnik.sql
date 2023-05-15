-- 19. Zadatak 
-- Nakladnik izdaje djela. Jedan nakladnik može izdati više djela dok jedno djelo može izdati više   
-- nakladnika. Nakladnik se nalazi u jednom mjestu dok jedno mjesto može imati više nakladnika.

drop database if exists zadatak19;
create database zadatak19;
use zadatak19;

create table nakladnik (
	id_nakladnik int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	oib varchar(11),
	broj_telefona varchar(50)
);

create table djelo (
	id_djelo int not null primary key auto_increment, 
	naziv_djela varchar(50),
	autor_djela varchar(50),
	godina_izdanja int,
	broj_izdanja int,
	uvez varchar(50)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment, 
	naziv_mjesta varchar(50),
	poštanski_broj varchar(5),
	naziv_zupanije varchar(50)
);

create table nakladnik_djelo (
	id_nakladnik_djelo int not null primary key auto_increment, 
	id_nakladnik int not null,
	id_djelo int not null
);

create table nakladnik_mjesto (
	nakladnik_mjesto int not null primary key auto_increment, 
	id_nakladnik int not null,
	id_mjesto int not null
);


alter table nakladnik_djelo add foreign key (id_nakladnik)
references nakladnik(id_nakladnik);

alter table nakladnik_djelo add foreign key (id_djelo)
references djelo(id_djelo);

alter table nakladnik_mjesto add foreign key (id_nakladnik)
references nakladnik(id_nakladnik);

alter table nakladnik_mjesto add foreign key (id_mjesto)
references mjesto(id_mjesto);