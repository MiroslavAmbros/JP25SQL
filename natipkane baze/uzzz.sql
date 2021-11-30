drop database if exists zastitazivotinja;
create database zastitazivotinja character set utf8;
use zastitazivotinja;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    kapacitet varchar(50) not null,
    popunjen boolean
);

create table zivotinja(
    osoba int not null,
    prostor int not null,
    vrsta varchar(50) not null,
    boksbroj int not null,
);

alter table zivotinja add foreign key (osoba) references osoba(sifra);
alter table zivotinja add foreign key (prostor) references prostor(sifra);