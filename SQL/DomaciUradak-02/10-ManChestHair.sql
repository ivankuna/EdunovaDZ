drop database if exists man_chest_hair;
create database man_chest_hair;
use man_chest_hair;

create table registracija (
	id_registracija int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50)
);

create table zanimanje (
	id_zanimanje int not null primary key auto_increment,
	naziv_zanimanja varchar(50)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_registracija int,
	ime varchar(50),
	prezime varchar(50),
	karma int,
	gost tinyint(1),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table korisnik_zanimanje (
	id_korisnik_zanimanje int not null primary key auto_increment,
	id_korisnik int not null,
	id_zanimanje int not null,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_zanimanje) references zanimanje (id_zanimanje)
);

create table ponuda (
	id_ponuda int not null primary key auto_increment,
	id_korisnik int not null,
	id_zanimanje int not null,
	opis_ponude text,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_zanimanje) references zanimanje (id_zanimanje)
); 