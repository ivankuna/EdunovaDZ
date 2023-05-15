-- 3. Zadatak 
-- U udruzi radi više osoba. Jedna osoba se brine za jednog ili više štićenika udruge. 
-- Štićenici udruge su životinje. Svaki štićenik se nalazi u jednom prostoru.
 
drop database if exists zadatak03;
create database zadatak03;
use zadatak03;

create table udruga (
	id_udruga int  not null primary key auto_increment,
	adresa varchar (50) not null,
	broj_telefona varchar(50) not null
);

create table osoba (
	id_osoba int  not null primary key auto_increment,
	id_udruga int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11) not null,
	iban varchar(21) not null,
	email varchar(50) not null
);

create table sticenik (
	id_sticenik int not null primary key auto_increment,
	id_osoba int not null,
	id_zivotinja int not null,
	id_prostor int not null	
);

create table zivotinja (
	id_zivotinja int not null primary key auto_increment,
	ime varchar(50),
	pasmina varchar(50),
	datum_dolaska datetime not null,
	datum_odlaska datetime,
	datum_rodjenja date
);

create table prostor (
	id_prostor int not null primary key auto_increment,	
	broj_prostora int not null
);

alter table osoba add foreign key (id_udruga)
references udruga(id_udruga);

alter table sticenik add foreign key (id_osoba)
references osoba(id_osoba);

alter table sticenik add foreign key (id_zivotinja)
references zivotinja(id_zivotinja);

alter table sticenik add foreign key (id_prostor)
references prostor(id_prostor);

