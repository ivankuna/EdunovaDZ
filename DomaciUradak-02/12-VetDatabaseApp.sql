drop database if exists VDBA;
create database VDBA;
use VDBA;

create table vlasnik (
	id_vlasnik int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table pasmina (
	id_pasmina int not null primary key auto_increment,
	naziv_pasmine varchar(50)
);

create table zivotinja (
	id_zivotinja int not null primary key auto_increment,
	id_vlasnik int not null,
	id_pasmina int not null,
	datum_rodjenja date,
	cipirana tinyint(1),
	foreign key (id_vlasnik) references vlasnik (id_vlasnik),
	foreign key (id_pasmina) references pasmina (id_pasmina)	
);

create table cjepivo (
	id_cjepivo int not null primary key auto_increment,
	vrsta_cjepiva varchar(50),
	jedinica_mjere varchar(5),
	rok_trajanja date
);

create table tretman (
	id_tretman int not null primary key auto_increment,
	naziv_tretmana varchar(50)
);

create table vrsta_termin (
	id_termin int not null primary key auto_increment,
	id_tretman int not null,
	id_zivotinja int not null,
	id_cjepivo int,
	datum_termina date not null,
	datum_sljedeceg_termina date,
	foreign key (id_tretman) references tretman (id_tretman),
	foreign key (id_zivotinja) references zivotinja (id_zivotinja),
	foreign key (id_cjepivo) references cjepivo (id_cjepivo)
);