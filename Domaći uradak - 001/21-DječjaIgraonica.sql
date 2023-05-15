-- 21. Zadatak 
-- U dječjoj igraonici djeca se igraju u skupinama. Jedno dijete se može igrati u više   
-- skupina a jedna skupina se sastoji od više djece. Svaku skupinu vodi jedna teta.

drop database if exists zadatak21;
create database zadatak21;
use zadatak21;

create table djecja_igraonica (
	id_djecja_igraonica int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table skupina (
	id_skupina int not null primary key auto_increment, 
	id_djecja_igraonica int not null,
	id_teta int not null,
	max_broj_djece int,
	dobna_grupa_skupine varchar(50)
);

create table dijete (
	id_dijete int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table skupina_dijete (
	id_skupina_dijete int not null primary key auto_increment, 
	id_skupina int not null,
	id_dijete int not null
);

create table teta (
	id_teta int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	iban varchar(21),
	oib varchar(11)
);

alter table skupina add foreign key (id_djecja_igraonica)
references djecja_igraonica(id_djecja_igraonica);

alter table skupina add foreign key (id_teta)
references teta(id_teta);

alter table skupina_dijete add foreign key (id_skupina)
references skupina(id_skupina);

alter table skupina_dijete add foreign key (id_dijete)
references dijete(id_dijete);