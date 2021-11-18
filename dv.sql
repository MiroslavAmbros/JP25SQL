drop database if exists dv;
create database dv;
use dv;
create table vrtic (
    sifra  int not null primary key auto_increment,
    naziv varchar(50),
    vrijemeotv time,
    vrijemezat time,
    cijena decimal(18,2),
    iban varchar(50)
);
create table skupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    odgajatelj int,
    dijete int,
    vrtic int
);
create table odgajatelj(
    sifra int not null primary key auto_increment,
    osoba int,
    strucnasprema varchar(50),
    placa decimal(18,2)
);
create table dijete(
    sifra int not null primary key auto_increment,
    osoba int,
    roditelj int
);
create table roditelj(
    sifra int not null primary key auto_increment,
    osoba int,
    telefon varchar(50)
);
create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);
alter table skupina add foreign key (odgajatelj) references odgajatelj(sifra);
alter table skupina add foreign key (dijete) references dijete(sifra);
alter table skupina add foreign key (vrtic) references vrtic(sifra);
alter table odgajatelj add foreign key (osoba) references osoba(sifra);
alter table dijete add foreign key (osoba) references osoba(sifra);
alter table dijete add foreign key (roditelj) references roditelj(sifra);
alter table roditelj add foreign key (osoba) references osoba(sifra);

insert into vrtic (sifra,naziv,cijena,iban) values
(null,'DV Jelenko',1500.99,'hr2132435465'); 

insert into osoba (ime,prezime,oib) values 
 ('odgajatelj','teta',01234567890),
 ('djete','maleno',12345678901),
 ('roditelj','veliki',23456789012);

insert into roditelj (sifra,osoba,telefon)
values (null,3,'031385594');
insert into dijete (sifra,osoba,roditelj)
values (null,2,1);
insert into odgajatelj (sifra,osoba,strucnasprema,placa)
values (null,1,'vss',7500.56);
insert into skupina (sifra,naziv,odgajatelj,dijete,vrtic)
values (null,'Žuta soba',1,1,1);

