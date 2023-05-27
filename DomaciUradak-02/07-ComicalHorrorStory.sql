drop database if exists comical_horror_story;
create database comical_horror_story;
use comical_horror_story;

create table web_stranica (
	id_web_stranica int not null primary key auto_increment,
	url varchar(50),
	host varchar(50)
);

create table registracija (
	id_registracija int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50),
	potvrda_lozinke varchar(50)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	id_registracija int not null,
	ime varchar(50),
	prezime varchar(50),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table prijava (
	id_prijava int not null primary key auto_increment,
	id_registracija int not null,
	korisnicko_ime varchar(50),
	lozinka varchar(50),
	foreign key (id_registracija) references registracija (id_registracija)
);

create table komentar (
	id_komentar int not null primary key auto_increment,
	id_korisnik int not null,
	id_web_stranica int not null,
	tekst text,
	foreign key (id_korisnik) references korisnik (id_korisnik),
	foreign key (id_web_stranica) references web_stranica (id_web_stranica)
);

create table posluzitelj (
	id_posluzitelj int not null primary key auto_increment,
	id_web_stranica int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	foreign key (id_web_stranica) references web_stranica (id_web_stranica)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	naziv_galerije varchar(50),
	file_path text
);

create table slika (
	id_slika int not null primary key auto_increment,
	id_galerija int not null,
	naziv_slike varchar(50),
	file_path text,
	foreign key (id_galerija) references galerija (id_galerija)
);

create table informacija (
	id_informacija int not null primary key auto_increment,
	id_posluzitelj int not null,
	id_web_stranica int not null,
	id_galerija int,
	naslov_clanka varchar(50),
	tekst text,
	foreign key (id_posluzitelj) references posluzitelj (id_posluzitelj),
	foreign key (id_web_stranica) references web_stranica (id_web_stranica),
	foreign key (id_galerija) references galerija (id_galerija)
);





