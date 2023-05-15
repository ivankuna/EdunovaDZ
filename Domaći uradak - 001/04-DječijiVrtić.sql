-- 4. Zadatak 
-- U dječjem vrtiću postoji više odgojnih skupina. Svaka odgojna skupina ima više 
-- djece i vodi ih jedna odgajateljica. Odgajateljica ima jednu stručnu spremu.
 
-- drop database if exists zadatak04;
create database zadatak04;
use zadatak04;

create table djecji_vrtic  (
	id_djecji_vrtic int  not null primary key auto_increment, 
	adresa varchar (50) not null,
	broj_telefona varchar(50) not null
);

create table odgojna_skupina (
	id_odgojna_skupina int  not null primary key auto_increment,
	id_djecji_vrtic int not null,
	id_odgajateljica int not null
);

create table dijete (
	id_dijete int not null primary key auto_increment,
	id_odgojna_skupina int not null,	
	id_osoba int not null
);

create table odgajateljica (
	id_odgajateljica int not null primary key auto_increment,
	id_strucna_sprema int not null,
	id_osoba int not null,
	iban varchar(21) not null,
	email varchar(50) not null
);

create table osoba (
	id_osoba int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11) not null
);

create table strucna_sprema (
	id_strucna_sprema int not null primary key auto_increment,	
	naziv_strucne_spreme varchar(50),
	datum_stijecanja_strucne_spreme date not null	
);

alter table odgojna_skupina add foreign key (id_djecji_vrtic)
references djecji_vrtic(id_djecji_vrtic);

alter table odgojna_skupina add foreign key (id_odgajateljica)
references odgajateljica(id_odgajateljica);

alter table dijete add foreign key (id_odgojna_skupina)
references odgojna_skupina(id_odgojna_skupina);

alter table dijete add foreign key (id_osoba)
references osoba(id_osoba);

alter table odgajateljica add foreign key (id_osoba)
references osoba(id_osoba);

alter table odgajateljica add foreign key (id_strucna_sprema)
references strucna_sprema(id_strucna_sprema);

