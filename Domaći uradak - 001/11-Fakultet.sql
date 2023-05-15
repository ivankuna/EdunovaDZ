-- 11. Zadatak 
-- Studenti polažu kolegije kroz rokove. Student može rok  
-- prijaviti više puta a na jedan rok može izaći više studenata.

drop database if exists zadatak11;
create database zadatak11;
use zadatak11;

create table student (
	id_student int not null primary key auto_increment, 
	id_kolegij int not null,
	id_rok int not null,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib varchar(11) not null,
	jmag varchar(10) not null
);

create table kolegij (
	id_kolegij int not null primary key auto_increment, 
	naziv_kolegija varchar(50) not null,
	ects int not null,
	max_broj_studenata int
);

create table rok (
	id_rok int not null primary key auto_increment, 
	datum_roka date not null,
	dvorana varchar(50) not null,
	zgrada varchar(50) not null
);

create table prijava_roka (
	id_prijava_roka int not null primary key auto_increment, 
	id_student int not null,
	id_rok int not null
);

alter table student add foreign key (id_kolegij)
references kolegij(id_kolegij);

alter table student add foreign key (id_rok)
references rok(id_rok);

alter table prijava_roka add foreign key (id_student)
references student(id_student);

alter table prijava_roka add foreign key (id_rok)
references rok(id_rok);