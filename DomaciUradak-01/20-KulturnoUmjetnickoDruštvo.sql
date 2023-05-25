-- 20. Zadatak 
-- KUD nastupa u zemlji i inozemstvu. Na jedan nastup ide više članova KUD-a dok jedan   
-- član može nastupati na više nastupa. Svaki nastup se odvija u jednom mjestu.

drop database if exists zadatak20;
create database zadatak20;
use zadatak20;

create table kud (
	id_kud int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment, 
	id_nastup int not null,
	naziv_mjesta varchar(50),
	postanski_broj varchar(5)
);

create table clan (
	id_clan int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50)
);

create table nastup (
	id_nastup int not null primary key auto_increment, 
	id_kud int not null,
	datum_nastupa date,
	vrijeme_nastupa time
);

create table clan_nastup (
	clan_nastup int not null primary key auto_increment, 
	id_clan int not null,
	id_nastup int not null	
);

alter table mjesto add foreign key (id_nastup)
references nastup(id_nastup);

alter table nastup add foreign key (id_kud)
references kud(id_kud);

alter table clan_nastup add foreign key (id_clan)
references clan(id_clan);

alter table clan_nastup add foreign key (id_nastup)
references nastup(id_nastup);