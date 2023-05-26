drop database if exists djecji_vrtic;
create database djecji_vrtic;
use djecji_vrtic;

create table roditelj (
	id_roditelj int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	telefon varchar(50)
);

create table odgojna_skupina (
	id_odgojna_skupina int not null primary key auto_increment,
	max_broj_djece int,
	oznaka_odgojne_skupine varchar(10)
);

create table dijete (
	id_dijete int not null primary key auto_increment,
	id_roditelj int not null,
	id_odgojna_skupina int,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	foreign key (id_roditelj) references roditelj (id_roditelj),
	foreign key (id_odgojna_skupina) references odgojna_skupina (id_odgojna_skupina)
);

create table djecji_vrtic (
	id_djecji_vrtic int not null primary key auto_increment,
	naziv_djecjeg_vrtica varchar(50),
	godina_otvorenja int,
	adresa varchar(50),
	email varchar(50),
	telefon varchar(50)
);

create table prijava (
	id_prijava int not null primary key auto_increment,
	datum_prijave date,
	id_dijete int not null,
	id_djecji_vrtic int not null,
	foreign key (id_dijete) references dijete (id_dijete),
	foreign key (id_djecji_vrtic) references djecji_vrtic (id_djecji_vrtic)
);


create table opis_odgojne_skupine (
	id_opis_odgojne_skupine int not null primary key auto_increment,
	id_odgojna_skupina int not null,
	tekst text,
	foreign key (id_odgojna_skupina) references odgojna_skupina (id_odgojna_skupina)
);

create table dogadjaj (
	id_dogadjaj int not null primary key auto_increment,
	naslov_dogadjaja varchar(100),
	opis_dogadjaja text
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	oznaka_galerije varchar(50),
	file_path varchar(50),
	id_dogadjaj int not null,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	oznaka_fotografija varchar(50),
	file_path varchar(50),
	id_galerija int not null,
	foreign key (id_galerija) references galerija (id_galerija)
);

create table informacija (
	id_informacija int not null primary key auto_increment,
	id_djecji_vrtic int not null,
	id_dogadjaj int,
	id_galerija int,
	id_opis_odgojne_skupine int,
	naslov varchar(100),
	tekst text,
	datum date,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj),
	foreign key (id_galerija) references galerija (id_galerija),
	foreign key (id_opis_odgojne_skupine) references opis_odgojne_skupine (id_opis_odgojne_skupine)
);
