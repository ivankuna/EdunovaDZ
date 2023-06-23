drop database if exists zbirka_maticnih_knjiga;
create database zbirka_maticnih_knjiga;
use zbirka_maticnih_knjiga;

create table zupanija (
	id_zupanija int not null primary key auto_increment,
	naziv_zupanije varchar(50)
);

create table opcina (
	id_opcina int not null primary key auto_increment,
	id_zupanija int not null,
	naziv_opcine varchar(50),
	foreign key (id_zupanija) references zupanija (id_zupanija)
);

create table mjesto (
	id_mjesto int not null primary key auto_increment,
	id_opcina int not null,
	naziv_mjesta varchar(50),
	foreign key (id_opcina) references opcina (id_opcina)
);

create table osoba (
	id_osoba int not null primary key auto_increment,	
	ime varchar(50),
	prezime varchar(50),
	vjeroispovijest varchar(50),
	ime_oca varchar(50),
	datum_rodjenja date
);

create table knjiga_rodjenih (
	id_knjiga_rodjenih int not null primary key auto_increment,
	id_mjesto int not null,
	foreign key (id_mjesto) references mjesto (id_mjesto)
);

create table knjiga_vjencanih (
	id_knjiga_vjencanih int not null primary key auto_increment,
	datum_vjencanja date,
	id_mjesto int not null,
	foreign key (id_mjesto) references mjesto (id_mjesto)
);

create table knjiga_umrlih (
	id_knjiga_umrlih int not null primary key auto_increment,
	datum_smrti date,
	id_mjesto int not null,
	foreign key (id_mjesto) references mjesto (id_mjesto)
);

create table maticna_knjiga (
	id_maticna_knjiga int not null primary key auto_increment,
	id_osoba int not null,
	id_knjiga_rodjenih int,
	id_knjiga_vjencanih int,
	id_knjiga_umrlih int,
	datum_unosa date,
	dostupnost tinyint(1),
	status_rezervacije tinyint(1),
	foreign key (id_osoba) references osoba (id_osoba),
	foreign key (id_knjiga_rodjenih) references knjiga_rodjenih (id_knjiga_rodjenih),
	foreign key (id_knjiga_vjencanih) references knjiga_vjencanih (id_knjiga_vjencanih),
	foreign key (id_knjiga_umrlih) references knjiga_umrlih (id_knjiga_umrlih)
);


create table korisnik (
	id_korisnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)	
);

create table zahtjev_pregleda_mk (
	id_zahtjev_pregleda_mk int not null primary key auto_increment,
	id_maticna_knjiga int not null,
	id_korisnik int not null,
	upit text,
	datum_podnosa_zahtjeva date,
	foreign key (id_maticna_knjiga) references maticna_knjiga (id_maticna_knjiga),
	foreign key (id_korisnik) references korisnik (id_korisnik)
);