drop database if exists adopt_animals_app;
create database adopt_animals_app;
use adopt_animals_app;

create table azil (
	id_azil int not null primary key auto_increment,
	naziv_azila varchar(50),
	adresa varchar(50),
	telefon varchar(50)
);

create table registracija (
	id_registracija int not null primary key auto_increment,
	email varchar(50),
	korisnicko_ime varchar(50),
	lozinka varchar(50)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_registracija int,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table vrsta_zivotinje (
	id_vrsta_zivotinje int not null primary key auto_increment,
	naziv_vrste_zivotinje varchar(50)	
);

create table zivotinja (
	id_zivotinja int not null primary key auto_increment,
	id_azil int not null,
	id_vrsta_zivotinje int not null,
	godina_rodjenja int,
	zdravlje text,
	osobine text,
	foreign key (id_azil) references azil (id_azil),
	foreign key (id_vrsta_zivotinje) references vrsta_zivotinje (id_vrsta_zivotinje)
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	file_path varchar(100),
	file_size int
);

create table pregled_zivotinje (
	id_pregled_zivotinje int not null primary key auto_increment,
	id_registracija int not null,
	id_zivotinja int not null,
	id_fotografija int not null,
	svidja_mi_se tinyint(1),
	foreign key (id_registracija) references registracija (id_registracija),
	foreign key (id_zivotinja) references zivotinja (id_zivotinja),
	foreign key (id_fotografija) references fotografija (id_fotografija)
);

create table komentar (
	id_komentar int not null primary key auto_increment,
	id_registracija int not null,
	id_zivotinja int not null,
	tekst text,
	foreign key (id_registracija) references registracija (id_registracija),
	foreign key (id_zivotinja) references zivotinja (id_zivotinja)
);