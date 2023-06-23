drop database if exists baby_rhythm;
create database baby_rhythm;
use baby_rhythm;

create table majka (
	id_majka int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table beba (
	id_beba int not null primary key auto_increment,
	id_majka int not null,
	ime varchar(50),
	prezime varchar(50),
	datum_rodjenja date,
	foreign key (id_majka) references majka (id_majka)
);

create table dnevna_aktivnost (
	id_dnevna_aktivnost int not null primary key auto_increment,
	vrsta_dnevne_aktivnosti varchar(100)
-- Primjerice: jelo, piće, spavanje...
);

create table dnevnik (
	id_dnevnik int not null primary key auto_increment,
	id_beba int not null,
	id_dnevna_aktivnost int not null,
	datum_zapisa date not null,
	koemntar text,
	foreign key (id_beba) references beba (id_beba),
	foreign key (id_dnevna_aktivnost) references dnevna_aktivnost (id_dnevna_aktivnost)
);

create table jedinstveni_dogadjaj (
	id_jedinstveni_dogadjaj int not null primary key auto_increment,
	vrsta_jedinstvenog_dogadjaja varchar(100)
-- Primjerice: prve riječi, prvi koraci... 
);

create table kalendar (
	id_kalendar int not null primary key auto_increment,
	id_beba int not null,
	id_jedinstveni_dogadjaj int not null,
	datum_dogadjaja date not null,
	koemntar text,
	foreign key (id_beba) references beba (id_beba),
	foreign key (id_jedinstveni_dogadjaj) references jedinstveni_dogadjaj (id_jedinstveni_dogadjaj)
);

create table zdravstvena_obveza (
	id_zdravstvena_obveza int not null primary key auto_increment,
	vrsta_zdravstvene_obveze varchar(100)
-- Primjerice: pojava zubi, cijepljenje, odlazak doktoru...
);

create table zdravstveni_kutak (
	id_zdravstveni_kutak int not null primary key auto_increment,
	id_beba int not null,
	id_zdravstvena_obveza int not null,
	datum_izvrsenja_z_o date not null,
	foreign key (id_beba) references beba (id_beba),
	foreign key (id_zdravstvena_obveza) references zdravstvena_obveza (id_zdravstvena_obveza)
);