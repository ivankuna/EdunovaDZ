drop database if exists kavissimo;
create database kavissimo;
use kavissimo;

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_osoba int not null,
	foreign key (id_osoba) references osoba (id_osoba)
);

create table vlasnik (
	id_vlasnik int not null primary key auto_increment,
	id_osoba int not null,
	foreign key (id_osoba) references osoba (id_osoba)
);

create table administrator (
	id_administrator int not null primary key auto_increment,
	id_osoba int not null,
	foreign key (id_osoba) references osoba (id_osoba)
);

create table informacija (
	id_informacija int not null primary key auto_increment,
	kontakt varchar(50),
	dodatne_pogodnosti text,
	vrste_kave text,
	fotografija_cjenika blob,
	kocni_ljubimci tinyint(11),
	wifi_lozinka varchar(50)
);

create table kafic (
	id_kafic int not null primary key auto_increment,
	id_informacija int not null,
	id_vlasnik int not null,
	naziv_kafica varchar(50),
	lokacija varchar(50),
	foreign key (id_informacija) references informacija (id_informacija),
	foreign key (id_vlasnik) references vlasnik (id_vlasnik)
);

create table recenzija (
	id_recenzija int not null primary key auto_increment,
	id_korisnik int not null,
	id_kafic int not null,
	ocjena int not null,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_kafic) references kafic (id_kafic)
);

create table prijavni_obrazac (
	id_prijavni_obrazac int not null primary key auto_increment,
	id_vlasnik int not null,
	id_administrator int not null,
	zamolba text,
	foreign key (id_vlasnik) references vlasnik (id_vlasnik),
	foreign key (id_administrator) references administrator (id_administrator)
);