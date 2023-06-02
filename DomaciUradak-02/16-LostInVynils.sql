drop database if exists lost_in_vynils;
create database lost_in_vynils;
use lost_in_vynils;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	email varchar(50)
);

create table ploca (
	id_ploca int not null primary key auto_increment,
	izvodac varchar(50),
	naziv_LP varchar(50),
	trajanje int,
	godina_izdanja int,
	zvucni_primjer longblob
);

create table ponuda (
	id_ponuda int not null primary key auto_increment,
	id_korisnik int not null,
	id_ploca int not null,
	datum_objave_ponude date,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_ploca) references ploca (id_ploca)
);

create table potraznja (
	id_potraznja int not null primary key auto_increment,
	id_korisnik int not null,
	id_ploca int not null,
	datum_objave_potrage date,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_ploca) references ploca (id_ploca)
);