drop database if exists booking_visit_baranja;
create database booking_visit_baranja;
use booking_visit_baranja;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	email varchar(50),
	oib varchar(11)	
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	naziv_mjesta varchar(50)
);

create table turisticka_agencija (
	id_turisticka_agencija int not null primary key auto_increment,
	naziv_turisticke_agencije varchar(50),
	sjediste int not null,
	email varchar(50),
	telefon varchar(50),
	foreign key (sjediste) references mjesto (id_mjesto)
);

create table vlasnik (
	id_vlasnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	email varchar(50),
	oib varchar(11)	
);

create table objekt (
	id_objekt int not null primary key auto_increment,
	id_mjesto int not null,
	id_vlasnik int not null,
	adresa varchar(50),
	foreign key (id_mjesto) references mjesto (id_mjesto),
	foreign key (id_vlasnik) references vlasnik (id_vlasnik)
);

create table uplata (
	id_uplata int not null primary key auto_increment,
	id_korisnik int not null,
	id_vlasnik int not null,
	id_turisticka_agencija int not null,
	ukupan_iznos_uplate decimal(12,2),
	udio_agencije decimal(12,2),
	udio_vlasnika decimal(12,2),
	datum_uplate date,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_vlasnik) references vlasnik (id_vlasnik),
	foreign key (id_turisticka_agencija) references turisticka_agencija (id_turisticka_agencija)
);



