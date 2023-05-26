drop database if exists acoustic_duo;
create database acoustic_duo;
use acoustic_duo;

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50)
);

create table fan_mail (
	id_fan_mail int not null primary key auto_increment,
	id_korisnik int not null,
	tekst text,
	foreign key (id_korisnik) references korisnik (id_korisnik)
);

create table dogadjaj (
	id_dogadjaj int not null primary key auto_increment,
	datum_dogadjaj date,
	mjesto varchar(50),
	email_organizatora varchar(50),
	telefon_organizatora varchar(50)
);

create table novost (
	id_novost int not null primary key auto_increment,
	id_dogadjaj int not null,
	tekst text,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	id_dogadjaj int not null,
	naziv_galerija varchar(50),
	file_path text,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	id_galerija int not null,
	file_path text,
	foreign key (id_galerija) references galerija (id_galerija)
);

create table korisnik_dogadjaj (
	id_korisnik_dogadjaj int not null primary key auto_increment,
	id_korisnik int not null,
	id_dogadjaj int not null,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);




