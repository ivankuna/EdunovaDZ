drop database if exists igraonica;
create database igraonica;
use igraonica;

create table djelatnik (
	id_djelatnik int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	iban varchar(21),
	radnoMjesto varchar(50)
);

create table posjeta (
	id_posjeta int not null primary key auto_increment,
	id_djelatnik int not null,
	datumVrijemeDolaska datetime,
	datumVrijemeOdlaska datetime,
	napomena varchar(50)
);

create table operater (
	id_operater int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	oib varchar(11),
	email varchar(50),
	lozinka varchar(50)
);

create table dijete (
	id_dijete int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50),
	imeRoditelja varchar(50),
	telefonRoditelja varchar(50)
);

create table dijetePosjeta (
	id_dijetePosjeta int not null primary key auto_increment, 
	id_dijete int not null,
	id_posjeta int not null
);

create table usluga (
	id_usluga int not null primary key auto_increment, 
	naziv varchar(50),
	kolicina int,
	cijena decimal(12,2),
	jedinicaMjere varchar(10)
);

create table uslugaPosjeta (
	id_uslugaPosjeta int not null primary key auto_increment, 
	id_usluga int not null,
	id_posjeta int not null
);

alter table posjeta add foreign key (id_djelatnik)
references djelatnik(id_djelatnik);

alter table dijetePosjeta add foreign key (id_dijete)
references dijete(id_dijete);

alter table dijetePosjeta add foreign key (id_posjeta)
references posjeta(id_posjeta);

alter table uslugaPosjeta add foreign key (id_usluga)
references usluga(id_usluga);

alter table uslugaPosjeta add foreign key (id_posjeta)
references posjeta(id_posjeta);

insert into djelatnik (ime,prezime,oib,iban,radnoMjesto) 
values 
	("Ivo","Ivić","12345678912","123456789121234567891","Osijek"),
	("Pero","Nadoveza","09876543210","098765432100987654321","Zagreb"),
	("Mujo","Hasić","23456789012","234567890122345678901","Split");

insert into posjeta (id_djelatnik,datumVrijemeDolaska,datumVrijemeOdlaska,napomena)
values 
	(1,"2023-01-01 12:00:00","2023-01-01 14:00:00","neka napomena"),
	(2,"2023-01-02 11:00:00","2023-01-02 13:00:00","opet neka napomena"),
	(3,"2023-01-03 10:00:00","2023-01-03 12:00:00","i opet neka napomena");

insert into operater (ime,prezime,oib,email,lozinka)
values 
	("Ostao","Sam","12345678912","nekiMail@gmail.com","0000"),
	("Bez","Imena","09876543210","opetNekiMail@yahoo.com","1111"),
	("Štada","Seradi","23456789012","tkoUopceKoristiHotMail@hotmail.com","2222");

insert into dijete (ime,prezime,imeRoditelja,telefonRoditelja)
values
	("Josip","Josipović","Goran","091321123"),
	("Stjepan","Stjepanović","Gorana","098123321"),
	("Domagoj","Domagojević","Nešto kao Goran ili Gorana","099331122");

insert into dijetePosjeta (id_dijete,id_posjeta)
values 
	(1,2),
	(2,3),
	(3,1);

insert into usluga (naziv,kolicina,cijena,jedinicaMjere)
values 
	("Playstation EyeToy", 1, 2.00, "eur/h"),
	("Rođendanska torta", 1, 20.00, "kom."),
	("Nogometni teren", 1, 70.00, "kom.");

insert into uslugaPosjeta (id_usluga,id_posjeta)
values 
	(3,2),
	(2,1),
	(1,3);

update posjeta set napomena = '3 updated rows';

delete from operater;
	
