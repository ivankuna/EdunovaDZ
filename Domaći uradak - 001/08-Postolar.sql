-- 8. Zadatak 
-- Postolar popravlja obuću. Jedan korisnik može postolaru donijeti više komada obuće na popravak dok jedan  
-- komad obuće može biti više puta na popravku. Postolar ima šegrta koji sudjeluje u određenim popravcima obuće.

drop database if exists zadatak08;
create database zadatak08;
use zadatak08;

create table postolar (
	id_postolar int not null primary key auto_increment, 
	id_osoba int not null,
	iban varchar(21)
);

create table obuca (
	id_obuca int not null primary key auto_increment, 
	id_korisnik int not null
);

create table popravak (
	id_popravak int not null primary key auto_increment, 
	id_postolar int not null,
	id_segrt int,
	id_obuca int not null
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

alter table postolar add foreign key (id_osoba)
references osoba(id_osoba);

alter table obuca add foreign key (id_korisnik)
references korisnik(id_korisnik);

alter table popravak add foreign key (id_postolar)
references postolar(id_postolar);

alter table popravak add foreign key (id_segrt)
references segrt(id_segrt);

alter table popravak add foreign key (id_obuca)
references obuca(id_obuca);

alter table korisnik add foreign key (id_osoba)
references osoba(id_osoba);

alter table segrt add foreign key (id_osoba)
references osoba(id_osoba);





 