drop database if exists DVD;
create database DVD;
use DVD;

create table dogadjaj (
	id_dogadjaj int not null primary key auto_increment,
	naziv varchar(50),
	opis text
);

create table vijest (
	id_vijest int not null primary key auto_increment,
	id_dogadjaj int,
	naslov varchar(50),
	opis text,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	id_dogadjaj int,
	naslov varchar(50),
	opis text,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table slika (
	id_slika int not null primary key auto_increment,
	id_galerija int,
	naslov varchar(50),
	slika blob,
	foreign key (id_galerija) references galerija (id_galerija)
);

create table informacija (
	id_informacija int not null primary key auto_increment,
	id_dogadjaj int,
	id_vijest int,
	id_galerija int,
	naslov varchar(50),
	datum date,
	tekst text,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj),
	foreign key (id_vijest) references vijest (id_vijest),
	foreign key (id_galerija) references galerija (id_galerija)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	email varchar(50)
);

create table prijavnica (
	id_prijavnica int not null primary key auto_increment,
	id_korisnik int not null,
	oib_korisnika varchar(11),
	datum_rodjenja_korisnika date,
	foreign key (id_korisnik) references korisnik (id_korisnik)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	naziv_mjesta varchar(50)
);

create table web_stranica (
	id_web_stranica int not null primary key auto_increment,
	url varchar(50)
);

create table dvd (
	id_dvd int not null primary key auto_increment,
	id_web_stranica int not null,
	id_mjesto int not null,
	godina_osnivanja int,
	email varchar(50),
	foreign key (id_web_stranica) references web_stranica (id_web_stranica),
	foreign key (id_mjesto) references mjesto (id_mjesto)
);

create table dvd_prijavnica (
	id_dvd_prijavnica int not null primary key auto_increment,
	id_dvd int not null,
	id_prijavnica int not null,
	foreign key (id_dvd) references dvd (id_dvd),
	foreign key (id_prijavnica) references prijavnica (id_prijavnica)
);

create table informacija_dvd (
	id_informacija_dvd int not null primary key auto_increment,
	id_informacija int not null,
	id_dvd int not null,
	foreign key (id_informacija) references informacija (id_informacija),
	foreign key (id_dvd) references dvd (id_dvd)
);

create table posluzitelj (
	id_posluzitelj int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table informacija_posluzitelj (
	id_informacija_posluzitelj int not null primary key auto_increment,
	id_informacija int not null,
	id_posluzitelj int not null,
	foreign key (id_informacija) references informacija (id_informacija),
	foreign key (id_posluzitelj) references posluzitelj (id_posluzitelj)
);



































