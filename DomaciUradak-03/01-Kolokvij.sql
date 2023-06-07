drop database if exists 01kolokvij;
create database 01kolokvij;
use 01kolokvij;

create table punac (
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura (
	sifra int not null primary key auto_increment,
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int,
	foreign key (punac) references punac (sifra)
);

create table svekar (
	sifra int not null primary key auto_increment,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

create table sestra (
	sifra int not null primary key auto_increment,
	introvertno bit,
	haljina varchar(31) not null,
	marka decimal(16,6),
	hlace varchar(46) not null,
	narukvica int not null
);

create table sestra_svekar (
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null,
	foreign key (sestra) references sestra (sifra),
	foreign key (svekar) references svekar (sifra)
);

create table zena (
	sifra int not null primary key auto_increment,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null,
	foreign key (sestra) references sestra (sifra)
);

create table muskarac (
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	marka decimal(14,5) not null,
	zena int not null,
	foreign key (zena) references zena (sifra)
);

create table mladic (
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstrovertno bit not null,
	dukserica varchar(48) not null,
	muskarac int,
	foreign key (muskarac) references muskarac (sifra)
);

-- Insert statements for table 'punac'
INSERT INTO punac (ogrlica, gustoca, hlace) VALUES
(123, 0.123456789, 'Blue jeans'),
(456, 0.987654321, 'Black pants'),
(789, 0.246813579, 'White trousers');

-- Insert statements for table 'cura'
INSERT INTO cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac) VALUES
(1000.50, 0.123456, 0.9876543210, 123, 'Red', 'Floral skirt', 1),
(2000.75, 0.987654, 0.1234567890, 456, 'Green', 'Denim skirt', 2),
(3000.25, 0.246813, NULL, 789, 'Blue', 'Pleated skirt', 3);

-- Insert statements for table 'svekar'
INSERT INTO svekar (bojaociju, prstena, dukserica, lipa, eura, majica) VALUES
('Brown', 5, 'Gray sweatshirt', 0.12345678, 1234.5678901, 'White t-shirt'),
('Black', 3, 'Blue hoodie', 0.98765432, 987.6543210, 'Red polo shirt'),
('Green', NULL, 'Green sweater', 0.24681357, 246.8135790, 'Blue button-down');

-- Insert statements for table 'sestra'
INSERT INTO sestra (introvertno, haljina, marka, hlace, narukvica) VALUES
(1, 'Red dress', 123.456789, 'Black leggings', 1),
(0, 'Balitmore dress', 987.654321, 'Blue jeans', 2),
(1, 'Pink dress', NULL, 'White trousers', 3);

-- Insert statements for table 'sestra_svekar'
INSERT INTO sestra_svekar (sestra, svekar) VALUES
(2, 3),
(2, 2),
(3, 3);

-- Insert statements for table 'zena'
INSERT INTO zena (treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra) VALUES
('2023-01-01 10:00:00', 'Banana jeans', 'Red t-shirt', '12345678901', 'Purple', NULL, 1),
('2023-02-02 12:00:00', 'Azure jeans', 'White blouse', '98765432109', 'Yellow', 'Blue floral', 2),
('2023-03-03 14:00:00', 'White trousers', 'Black top', '24681357901', 'Green', 'Green polka dot', 3);

-- Insert statements for table 'muskarac'
INSERT INTO muskarac (bojaociju, hlace, modelnaocala, marka, zena) VALUES
('Blue', 'Black jeans', 'Aviator sunglasses', 123.45678, 1),
('Red', 'Gray pants', 'Wayfarer glasses', 987.65432, 2),
('Green', 'Green shorts', 'Square frame glasses', 246.81357, 3);

-- Insert statements for table 'mladic'
INSERT INTO mladic (suknja, kuna, drugiputa, asocijalno, ekstrovertno, dukserica, muskarac) VALUES
('Floral skirt', 10.12345678, '2023-04-04 16:00:00', 1, 0, 'Black hoodie', 1),
('Denim skirt', 2.98765432, '2023-05-05 18:00:00', 0, 1, 'Gray sweatshirt', 2),
('Pleated skirt', 300.24681357, '2023-06-06 20:00:00', 1, 1, 'Green sweater', 3);

	
update cura set gustoca = 15.77 
where sifra > 0;

delete from mladic where kuna > 15.78;

select kratkamajica from zena where hlace like '%ana%';

select a.dukserica, f.asocijalno, e.hlace  
from svekar a 
inner join sestra_svekar b 	on a.sifra = b.svekar
inner join sestra c 		on b.sestra = c.sifra
inner join zena d 			on c.sifra = d.sestra
inner join muskarac e 		on d.sifra = e.zena
inner join mladic f 		on e.sifra = f.muskarac
where d.hlace like 'a%' and c.haljina like '%ba%'
group by e.hlace;

select a.haljina 
from sestra a 
left join sestra_svekar b on a.sifra = b.sestra
where a.sifra not in (select sestra from sestra_svekar); 




	















