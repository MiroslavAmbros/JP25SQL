drop database if exists autoservis;
create database autoservis character set utf8;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < C:\jp25\jp25sql\zavrsni_rad\autoservis.sql
use autoservis;

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    iban varchar(50)
);
create table radni_nalog(
    sifra int not null primary key auto_increment,
    rednibroj int auto_increment,
    opisservisa varchar(250),
    datum datetime,
    djelatnik int
);
create table vozilo (
    registracija varchar(50),
    vlasnik int,
    brojsasije varchar(50),
    kilometraza varchar(50)
);
create table vlasnik (
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    brojtelefona varchar(50)
);

alter table djelatnik add foreign key (servis) references servis(sifra);
alter table radni_nalog add foreign key (djelatnik) references djelatnik(sifra);
alter table vozilo add foreign key (vlasnik) references vlasnik(sifra);
