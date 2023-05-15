-- 22. Zadatak 
-- Klub čitatelja se sastoji od članova koji čitaju knjige. Jedan čitatelj može čitati više knjiga, dok jednu knjigu kroz duže vremensko razdoblje   
-- može čitati više čitatelja. Svaka knjiga ima jednog i samo jednog vlasnika dok jedan vlasnik može imati više knjiga. Vlasnik je ujedno i čitatelj.

drop database if exists zadatak22;
create database zadatak22;
use zadatak22;

create table klub_citatelja (
	id_klub_citatelja int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table citatelj (
	id_citatelj int not null primary key auto_increment, 
	id_klub_citatelja int not null,
	id_vlasnik int,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table knjiga (
	id_knjiga int not null primary key auto_increment, 
	id_vlasnik int not null,
	naziv_knjige varchar(50),
	autor_knjige varchar(50)
);

create table citatelj_knjiga (
	id_citatelj_knjiga int not null primary key auto_increment, 
	id_citatelj int not null,
	id_knjiga int not null	
);

alter table citatelj add foreign key (id_klub_citatelja)
references klub_citatelja(id_klub_citatelja);

alter table citatelj add foreign key (id_vlasnik)
references citatelj(id_citatelj);

alter table knjiga add foreign key (id_vlasnik)
references citatelj(id_vlasnik);

alter table citatelj_knjiga add foreign key (id_citatelj)
references citatelj(id_citatelj);

alter table citatelj_knjiga add foreign key (id_knjiga)
references knjiga(id_knjiga);