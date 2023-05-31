drop database if exists raps_finest;
create database raps_finest;
use raps_finest;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50)
);

create table autor (
	id_autor int not null primary key auto_increment,
	naziv_autora varchar(50),
	kontakt_email varchar(50)
);

create table album (
	id_album int not null primary key auto_increment,
	id_autor int not null,
	naziv_albuma varchar(50),
	trajanje int,
	godina_izdanja int,
	foreign key (id_autor) references autor (id_autor)
);

create table pjesma (
	id_pjesma int not null primary key auto_increment,
	id_album int not null,
	naziv_pjesme varchar(50),
	trajanje int,
	godina_izdanja int,
	solo_pjesma tinyint(1),
	foreign key (id_album) references album (id_album)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	naziv_mjesta varchar(50)
);

create table koncert (
	id_koncert int not null primary key auto_increment,
	id_autor int not null,
	id_mjesto int not null,
	datum_koncerta date not null,
	foreign key (id_autor) references autor (id_autor),
	foreign key (id_mjesto) references mjesto (id_mjesto)
);

create table vrsta_sadrzaja (
	id_vrsta_sadrzaja int not null primary key auto_increment,
	naziv_vrste_sadrzaja varchar(50)
);

create table sadrzaj (
	id_sadrzaj int not null primary key auto_increment,
	id_vrsta_sadrzaja int not null,
	file_name varchar(50),
	downloadable tinyint(1),
	foreign key (id_vrsta_sadrzaja) references vrsta_sadrzaja (id_vrsta_sadrzaja)
);

create table komentar (
	id_komentar int not null primary key auto_increment,
	id_korisnik int not null,
	id_sadrzaj int not null,
	tekst text,
	ocjena int,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_sadrzaj) references sadrzaj (id_sadrzaj)
);






