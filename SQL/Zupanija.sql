drop database if exists zupanija;
create database zupanija;
use zupanija;

create table zupanija (
	id_zupanija int not null primary key auto_increment, 
	naziv varchar(50),
	id_zupan int not null
);
create table zupan (
	id_zupan int not null primary key auto_increment, 
	ime varchar(50),
	prezime varchar(50)
);
create table opcina (
	id_opcina int not null primary key auto_increment, 
	id_zupanija int not null,
	naziv varchar(50)
);
create table mjesto (
	id_mjesto int not null primary key auto_increment, 
	id_opcina int not null,
	naziv varchar(50)
);

alter table zupanija add foreign key (id_zupan)
references zupan(id_zupan);

alter table opcina add foreign key (id_zupanija)
references zupanija(id_zupanija) on delete cascade;

alter table mjesto add foreign key (id_opcina)
references opcina(id_opcina);

-- Unos podataka 
insert into zupan(id_zupan,ime,prezime) values 
	(null,'Pero','Perić'),
	(null,'Ivo','Ivić'),
	(null,'Darko','Darkić');

insert into zupanija(id_zupanija,naziv,id_zupan) values 
	(null,'Osječko-baranjska županija',1),
	(null,'Zagerbačka županija',2),
	(null,'Vukovarsko-srijemska županija',3);
	
insert into opcina(id_opcina,id_zupanija,naziv) values 
	(null,1,'Općina Bizovac'),
	(null,1,'Općina Darda'),
	(null,2,'Općina Bedenica'),
	(null,2,'Općina Bistra'),
	(null,3,'Općina Andrijaševci'),
	(null,3,'Općina Babina Greda'); 
	
insert into mjesto(id_mjesto,id_opcina,naziv) values 
	(null,1,'Bizovac'),
	(null,1,'Brođanci'),
	(null,2,'Darda'),
	(null,2,'Mece'),
	(null,3,'Bedenica'),
	(null,3,'Beloslavec'),
	(null,4,'Gornja Bistra'),
	(null,4,'Donja bistra'),
	(null,5,'Andrijaševci'),
	(null,5,'Rokovci'),
	(null,6,'Babina Greda'),
	(null,6,'Greda Babina');

-- Promjena podataka 
update mjesto
set naziv = 'Error404' where id_opcina in (1,2,3);

-- Brisanje podataka (Zadatak navodi kako je potrebno obrisati dvije opcine, s obzirom na foreign key constraint,
-- da bi obrisali dvije opcine potrebno je dodati liniju koda'on delete cascade' u definiranju foreign key-a tablice
-- opcina, te prvo obrisati podatke u tablici mjesto koji su povezani sa opcinama koje namjeravamo obrisati)
delete from mjesto
where id_opcina in (1, 2);

delete from opcina
where id_opcina in (1, 2);
	