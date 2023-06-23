drop database if exists pannonian_challenge;
create database pannonian_challenge;
use pannonian_challenge;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table prijava (
	id_prijava int not null primary key auto_increment,
	id_korisnik int not null,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50),
	foreign key (id_korisnik) references korisnik (id_korisnik)
);

create table volonter (
	id_volonter int not null primary key auto_increment,
	id_prijava int not null,
	foreign key (id_prijava) references prijava (id_prijava)
);

create table tip_natjecatelja (
	id_tip_natjecatelja int not null primary key auto_increment,
	naziv_tipa_natjecatelja varchar(50)
-- Primjerice: BMX, skateboard- in-line itd...
);

create table natjecatelj (
	id_natjecatelj int not null primary key auto_increment,
	id_prijava int not null,
	id_tip_natjecatelja int not null,
	foreign key (id_prijava) references prijava (id_prijava),
	foreign key (id_tip_natjecatelja) references tip_natjecatelja (id_tip_natjecatelja)
);

create table pannonian_challenge (
	id_pannonian_challenge int not null primary key auto_increment,
	povijest text,
	organizacija text,
	kontakt_email varchar(50)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	id_pannonian_challenge int not null,
	path_name varchar(50),
	foreign key (id_pannonian_challenge) references pannonian_challenge (id_pannonian_challenge)
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	id_galerija int not null,
	path_name varchar(50),
	file_size decimal(12,2),
	foreign key (id_galerija) references galerija (id_galerija)
);