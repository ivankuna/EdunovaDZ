-- 6. Zadatak 
-- U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova. Jedan posao u isto  
-- vrijeme može obavljati više svećenika. Svaki svećenik ima samo jednog nadređenog svećenika.

drop database if exists zadatak06;
create database zadatak06;
use zadatak06;

create table samostan (
	id_samostan int  not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table svecenik (
	id_svecenik int  not null primary key auto_increment, 
	id_nadređeni int,
	id_samostan int not null,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11)
);

create table posao (
	id_posao int  not null primary key auto_increment,
	vrsta_posla varchar(50)
);

create table svecenik_posao (
	id_svecenik int,
	id_posao int
);

alter table svecenik add foreign key (id_nadređeni)
references svecenik(id_svecenik);

alter table svecenik add foreign key (id_samostan)
references samostan(id_samostan);

alter table svecenik_posao add foreign key (id_svecenik)
references svecenik(id_svecenik);

alter table svecenik_posao add foreign key (id_posao)
references posao(id_posao);


 