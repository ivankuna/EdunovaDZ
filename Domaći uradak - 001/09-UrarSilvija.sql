-- 9. Zadatak 
-- Urar popravlja satove. Jedan korisnik može uraru donijeti više satova na popravak dok jedan sat  
-- može biti više puta na popravku. Urar ima šegrta koji sudjeluje u određenim popravcima satova.

drop database if exists zadatak09;
create database zadatak09;
use zadatak09;

create table urar (
	id_urar int not null primary key auto_increment, 
	id_osoba int not null,
	iban varchar(21)
);

create table sat (
	id_sat int not null primary key auto_increment, 
	id_korisnik int not null
);

create table popravak (
	id_popravak int not null primary key auto_increment, 
	id_urar int not null,
	id_segrt int not null,
	id_sat int not null
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_osoba int not null
);

create table segrt (
	id_segrt int not null primary key auto_increment,
	id_osoba int not null,
	iban varchar(21)
);

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	eimail varchar(50)
);

alter table urar add foreign key (id_osoba)
references osoba(id_osoba);

alter table sat add foreign key (id_korisnik)
references korisnik(id_korisnik);

alter table popravak add foreign key (id_urar)
references urar(id_urar);

alter table popravak add foreign key (id_segrt)
references segrt(id_segrt);

alter table popravak add foreign key (id_sat)
references sat(id_sat);

alter table korisnik add foreign key (id_osoba)
references osoba(id_osoba);

alter table segrt add foreign key (id_osoba)
references osoba(id_osoba);





 