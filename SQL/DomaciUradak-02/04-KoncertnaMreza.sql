drop database if exists koncertna_mreza;
create database koncertna_mreza;
use koncertna_mreza;

create table kategorija (
	id_kategorija int not null primary key auto_increment,
	naziv_kategorije varchar(50)
);

create table korisnik (
	id_korisnik int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50),
	id_kategorija int,
	foreign key (id_kategorija) references kategorija (id_kategorija)
);

create table posluzitelj (
	id_posluzitelj int not null primary key auto_increment,
	korisnicko_ime varchar(50),
	email varchar(50),
	lozinka varchar(50)
);

create table dopisivanje (
	id_dopisivanje int not null primary key auto_increment,
	posiljatelj int not null,
	primatelj int not null,
	sadrzaj_poruke text,
	foreign key (posiljatelj) references korisnik (id_korisnik),
	foreign key (primatelj) references korisnik (id_korisnik)
);

create table drzava (
	id_drzava int not null primary key auto_increment,
	naziv_drzave varchar(50)
);

create table grad (
	id_grad int not null primary key auto_increment,
	id_drzava int not null,
	naziv_grada varchar(50),
	foreign key (id_drzava) references drzava (id_drzava)
);

create table dogadjaj (
	id_dogadjaj int not null primary key auto_increment,
	naziv_dogadjaja varchar(50),
	datum_dogadjaja date,
	id_grad int not null,
	foreign key (id_grad) references grad (id_grad)
);

create table karta (
	id_karta int not null primary key auto_increment,
	id_dogadjaj int not null,
	cijena decimal(12,2),
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj)
);

create table rezervacija (
	id_rezervacija int not null primary key auto_increment,
	id_karta int not null,
	id_korisnik int not null,
	datum_rezervacije date,
	cijena_rezervacije decimal(12,2),
	foreign key (id_karta) references karta (id_karta),
	foreign key (id_korisnik) references korisnik (id_korisnik)
);

create table galerija (
	id_galerija int not null primary key auto_increment,
	file_path text
);

create table fotografija (
	id_fotografija int not null primary key auto_increment,
	id_galerija int not null,
	file_name text,
	foreign key (id_galerija) references galerija (id_galerija)
);


create table informacija (
	id_informacija int not null primary key auto_increment,
	id_galerija int not null,
	id_posluzitelj int not null,
	tekst text,
	foreign key (id_galerija) references galerija (id_galerija),
	foreign key (id_posluzitelj) references posluzitelj (id_posluzitelj)
);

create table dogadjaj_informacija (
	id_dogadjaj_informacija int not null primary key auto_increment,
	id_dogadjaj int not null,
	id_informacija int not null,
	foreign key (id_dogadjaj) references dogadjaj (id_dogadjaj),
	foreign key (id_informacija) references informacija (id_informacija)
);


