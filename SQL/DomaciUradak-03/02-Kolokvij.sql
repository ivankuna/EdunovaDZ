drop database if exists 02kolokvij;
create database 02kolokvij;
use 02kolokvij;

create table svekar (
	sifra int not null primary key auto_increment,
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno bit not null
);

create table prijatelj (
	sifra int not null primary key auto_increment,
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstrovertno bit not null,
	prviputa datetime,
	svekar int not null,
	foreign key (svekar) references svekar(sifra)
);

create table zarucnica (
	sifra int not null primary key auto_increment,
	narukvica int,
	bojakose varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferentno bit not null
);

create table decko (
	sifra int not null primary key auto_increment,
	indiferentno bit,
	vesta varchar(34),
	asocijalno bit not null
);

create table decko_zarucnica (
	sifra int not null primary key auto_increment,
	decko int not null,
	zarucnica int not null,
	foreign key (decko) references decko(sifra),
	foreign key (zarucnica) references zarucnica(sifra)
);

create table cura (
	sifra int not null primary key auto_increment,
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno bit,
	majica varchar(40) not null,
	decko int,
	foreign key (decko) references decko(sifra)
);

create table neprijatelj (
	sifra int not null primary key auto_increment,
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11),
	cura int,
	foreign key (cura) references cura(sifra)
);

create table brat (
	sifra int not null primary key auto_increment,
	suknja varchar(47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null,
	foreign key (neprijatelj) references neprijatelj(sifra)
);
	
-- INSERT queries for table "svekar"
INSERT INTO svekar (stilfrizura, ogrlica, asocijalno)
VALUES ('Frizura 1', 123, 1),
       ('Frizura 2', 456, 0),
       ('Frizura 3', 789, 1);

-- INSERT queries for table "prijatelj"
INSERT INTO prijatelj (modelnaocala, treciputa, ekstrovertno, prviputa, svekar)
VALUES ('Naočale 1', '2023-06-01 10:00:00', 1, '2023-05-31 15:30:00', 1),
       ('Naočale 2', '2023-06-02 14:45:00', 0, '2023-06-01 09:15:00', 2),
       ('Naočale 3', '2023-06-03 19:20:00', 1, '2023-06-02 16:10:00', 3);

-- INSERT queries for table "zarucnica"
INSERT INTO zarucnica (narukvica, bojakose, novcica, lipa, indiferentno)
VALUES (1, 'Boja kose 1', 12.3456789, 1.23456789, 0),
       (2, 'Boja kose 2', 98.7654321, 9.87654321, 1),
       (3, 'Boja kose 3', 54.3210987, 5.43210987, 0);

-- INSERT queries for table "decko"
INSERT INTO decko (indiferentno, vesta, asocijalno)
VALUES (0, 'banana', 1),
       (1, 'obadva', 0),
       (1, 'okrugla', 1);

-- INSERT queries for table "decko_zarucnica"
INSERT INTO decko_zarucnica (decko, zarucnica)
VALUES (1, 1),
       (2, 2),
       (1, 3);

-- INSERT queries for table "cura"
INSERT INTO cura (haljina, drugiputa, suknja, narukvica, introvertno, majica, decko)
VALUES ('Haljina 1', '2023-06-01 08:00:00', 'Suknja 1', 1, 1, 'Majica 1', 1),
       ('Haljina 2', '2023-06-02 13:30:00', 'Suknja 2', 2, 0, 'Majica 2', 2),
       ('Haljina 3', '2023-06-03 18:45:00', 'Suknja 3', 3, 1, 'Majica 3', 3);

-- INSERT queries for table "neprijatelj"
INSERT INTO neprijatelj (majica, haljina, lipa, modelnaocala, kuna, jmbag, cura)
VALUES ('Majica 1', 'Haljina 1', 1.23456789, 'Naočale 1', 123.456, '12345678901', 1),
       ('Majica 2', 'Haljina 2', 9.87654321, 'Naočale 2', 654.321, '98765432109', 2),
       ('Majica 3', 'Haljina 3', 5.43210987, 'Naočale 3', 321.987, '56789012345', 3);

-- INSERT queries for table "brat"
INSERT INTO brat (suknja, ogrlica, asocijalno, neprijatelj)
VALUES ('Suknja 1', 14, 1, 1),
       ('Suknja 2', 14, 0, 2),
       ('Suknja 3', 789, 1, 3);

update prijatelj set treciputa = '2020-04-30' 
where sifra > 0;

delete from brat where ogrlica != 14;

select suknja from cura where drugiputa is null;

select a.novcica, f.neprijatelj, e.haljina 
from zarucnica a 
inner join decko_zarucnica b 	on a.sifra = b.zarucnica 
inner join decko c 				on b.decko = c.sifra 
inner join cura d 				on c.sifra = d.decko 
inner join neprijatelj e 		on d.sifra = e.cura 
inner join brat f 				on e.sifra = f.neprijatelj 
where d.drugiputa is not null and c.vesta like '%ba%'
group by e.haljina;

select vesta, asocijalno from decko where sifra not in (select decko from decko_zarucnica);