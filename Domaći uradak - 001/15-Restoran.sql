-- 15. Zadatak 
-- Restoran ima više kategorija na jelovniku. Jedna kategorija ima više jela. Uz   
-- svako jelo može se ponuditi više pića. Jedno piće se može ponuditi uz više jela.

drop database if exists zadatak15;
create database zadatak15;
use zadatak15;

create table restoran (
	id_restoran int not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50)
);

create table kategorija (
	id_kategorija int not null primary key auto_increment,
	id_restoran int not null,
	naziv_kategorije varchar(50)
);

create table jelo (
	id_jelo int not null primary key auto_increment,
	id_kategorija int not null,
	naziv_jela varchar(50),
	cijena decimal(12,2)
);

create table pice (
	id_pice int not null primary key auto_increment,
	naziv_pica varchar(50),
	cijena decimal(12,2)
);

create table jelo_pice (
	id_jelo_pice int not null primary key auto_increment,
	id_jelo int not null,
	id_pice int not null
);

alter table kategorija add foreign key (id_restoran)
references restoran(id_restoran);

alter table jelo add foreign key (id_kategorija)
references kategorija(id_kategorija);

alter table jelo_pice add foreign key (id_jelo)
references jelo(id_jelo);

alter table jelo_pice add foreign key (id_pice)
references pice(id_pice);