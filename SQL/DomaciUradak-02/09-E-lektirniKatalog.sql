drop database if exists e_lektirni_katalog;
create database e_lektirni_katalog;
use e_lektirni_katalog;

create table registracija (
	id_registracija int not null primary key auto_increment,
	email varchar(50),
	lozinka varchar(50),
	potvrda_lozinka varchar(50)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_registracija int not null,
	nadimak varchar(50),
	oib varchar(11),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	naziv_mjesta varchar(50)
);

create table autor (
	id_autor int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	datum_rodjenja date,
	datum_smrti date,
	mjesto_rodjenja int,
	mjesto_smrti int,
	foreign key (mjesto_rodjenja) references mjesto (id_mjesto),
	foreign key (mjesto_smrti) references mjesto (id_mjesto)
);

create table izdavac (
	id_izdavac int not null primary key auto_increment,
	naziv_izdavaca varchar(50),
	mjesto_izdavaca int,
	foreign key (mjesto_izdavaca) references mjesto (id_mjesto)
);

create table djelo (
	id_djelo int not null primary key auto_increment,
	tekst text,
	link varchar(150)
);

create table jedinica (
	id_jedinica int not null primary key auto_increment,
	naziv_djela varchar(50),
	id_autor int not null,
	id_izdavac int not null,
	godina_izdanja int,
	vrsta_uveza varchar(50),
	link int not null,
	foreign key (id_autor) references autor (id_autor),
	foreign key (id_izdavac) references izdavac (id_izdavac),
	foreign key (link) references djelo (id_djelo)
);