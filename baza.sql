drop database if exists baza;
create database baza;
use baza;
create table zupanija (
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan int
);
create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50)
);
create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv varchar(50)
);
create table zupan (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into zupan (sifra,ime,prezime) 
values (null,'Ivan','Anušić');
insert into zupanija (sifra,naziv,zupan)
values (null,'Osječko-baranjska',1);
insert into opcina (sifra,naziv,zupanija)
values (null,'Osijek',1);
insert into mjesto (sifra,naziv,opcina)
values (null,'Osijek',1);
