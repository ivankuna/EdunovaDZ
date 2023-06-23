drop database if exists aukcijska_kuca;
create database aukcijska_kuca;
use aukcijska_kuca;


create table fan_mail (
	id_fan_mail int not null primary key auto_increment,
	id_korisnik int not null,
	tekst text,
	foreign key (id_korisnik) references korisnik (id_korisnik)
);