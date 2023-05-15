-- 5. Zadatak 
-- U muzeju postoji više izložaba. Jedna izložba ima više djela. Svaki  
-- kustos je zadužen za jednu izložbu. Svaka izložba ima jednog sponzora.

drop database if exists zadatak05;
create database zadatak05;
use zadatak05;

create table muzej (
	id_muzej int  not null primary key auto_increment, 
	naziv varchar(50),
	adresa varchar(50),
	broj_telefona varchar(50)
);

create table izlozba (
	id_izlozba int  not null primary key auto_increment, 
	id_muzej int not null,
	id_kustos int not null,
	id_sponzor int not null,
	naziv_izlozbe varchar(50),
	datum_otvaranja date,
	datum_zatvaranja date
);

create table djelo (
	id_djelo int  not null primary key auto_increment, 
	id_izlozba int not null,
	naziv_djela varchar(50),
	ime_umjetnika varchar(50),
	dijena decimal(12,2)
);

create table kustos (
	id_kustos int  not null primary key auto_increment, 
	id_osoba int not null
);

create table sponzor (
	id_sponzor int  not null primary key auto_increment, 
	id_osoba int not null,
	iban varchar(21)
);

create table osoba (
	id_osoba int  not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50)
);

ALTER TABLE izlozba ADD CONSTRAINT uc_kustos UNIQUE (id_kustos);

alter table izlozba add foreign key (id_muzej)
references muzej(id_muzej);

alter table izlozba add foreign key (id_kustos)
references kustos(id_kustos);

alter table izlozba add foreign key (id_sponzor)
references sponzor(id_sponzor);

alter table djelo add foreign key (id_izlozba)
references izlozba(id_izlozba);

alter table kustos add foreign key (id_osoba)
references osoba(id_osoba);

alter table sponzor add foreign key (id_osoba)
references osoba(id_osoba);

 