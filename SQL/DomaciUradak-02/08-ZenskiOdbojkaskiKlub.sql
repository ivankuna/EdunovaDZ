drop database if exists zenski_odbojkaski_klub;
create database zenski_odbojkaski_klub;
use zenski_odbojkaski_klub;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	nadimak varchar(50),
	email varchar(50),
	lozinka varchar(50)
);

create table igrac (
	id_igrac int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	broj_dresa varchar(2),
	email varchar(50),
	lozinka varchar(50),
	posluzitelj tinyint(1)
);

create table trener (
	id_trener int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	naziv_mjesta varchar(50)
);

create table klub (
	id_klub int not null primary key auto_increment,
	id_mjesto int not null,
	id_trener int not null,
	naziv_kluba varchar(50),
	godina_osnivanja int not null,
	foreign key (id_mjesto) references mjesto (id_mjesto),
	foreign key (id_trener) references trener (id_trener)
);

create table utakmica (
	id_utakmica int not null primary key auto_increment,
	domaca_ekipa int not null,
	gostujuca_ekipa int not null,
	datum_utakmica date,
	mjesto_odrzavanja int,
	foreign key (domaca_ekipa) references klub (id_klub),
	foreign key (gostujuca_ekipa) references klub (id_klub),
	foreign key (mjesto_odrzavanja) references mjesto (id_mjesto)
);

create table vijest (
	id_vijest int not null primary key auto_increment,
	id_utakmica int,
	posluzitelj int not null,
	tekst text,
	foreign key (id_utakmica) references utakmica (id_utakmica),
	foreign key (posluzitelj) references igrac (id_igrac)
);

create table komentar (
	id_komentar int not null primary key auto_increment,
	id_korisnik int,
	id_igrac int,
	tekst text,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_igrac) references igrac (id_igrac)
);