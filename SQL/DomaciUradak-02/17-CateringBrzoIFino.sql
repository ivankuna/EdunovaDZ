drop database if exists catering;
create database catering;
use catering;

create table registracija (
	id_registracija int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	lozinka varchar(50)	
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_registracija int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table ponuda (
	id_ponuda int not null primary key auto_increment,
	naziv_ponude varchar(50),
	cijena decimal(12,2)
);

create table narudzba (
	id_narudzba int not null primary key auto_increment,
	id_korisnik int not null,
	id_ponuda int not null,
	datum_narudzbe date,
	adresa_naruzdbe varchar(50),
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_ponuda) references ponuda (id_ponuda)
);

create table komentar (
	id_komentar int not null primary key auto_increment,
	id_registracija int not null,
	tekst text,
	foreign key (id_registracija) references registracija (id_registracija)
);

create table rating (
	id_rating int not null primary key auto_increment,
	id_korisnik int not null,
	id_narudzba int not null,
	ocjena int,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_narudzba) references narudzba (id_narudzba)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	file_path varchar(100)
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	id_galerija int not null,
	id_ponuda int not null,
	file_path varchar(100),
	foreign key (id_galerija) references galerija (id_galerija),
	foreign key (id_ponuda) references ponuda (id_ponuda)
);


