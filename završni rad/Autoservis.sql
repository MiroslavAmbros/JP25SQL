drop database if exists autoservis;
create database autoservis character set utf8;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < C:\jp25\jp25sql\zavrsni_rad\autoservis.sql
use autoservis;
create table servispartner (
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    oib char(11),
    iban varchar(50),
    licenciran boolean
);
create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    iban varchar(50),
    servispartner int
);
create table servisninalog(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    brojsasije varchar(50),
    opisservisa varchar(250),
    datum datetime,
    kilometraza varchar(50),
    djelatnik int
);

alter table djelatnik add foreign key (servispartner) references servispartner(sifra);
alter table servisninalog add foreign key (djelatnik) references djelatnik(sifra);
#servis parteri
insert into servispartner(sifra,naziv,adresa)
values
(null,'AS Štimac','Gornjodravska 66, Osijek'),
(null,'AUTOPOINT','Kišpatićeva 99, Osijek');

#djelatnici

insert into djelatnik(sifra,ime,prezime)
values
(null,'Marko','Marković'),
(null,'Nenad','Debeljanović'),
(null,'Vlado','Kanteršić'),
(null,'Aleksandar','Vukobratović');

update servispartner 
set oib='06860590644' 
where sifra=1;

update servispartner
set iban='HR4523400098274733217'
where sifra=1;

update servispartner 
set oib='27808967531'
where sifra=2;

update servispartner
set iban='HR5823600005152285761'
where sifra=2;

update djelatnik
set oib='80603206972'
where sifra=1;

update djelatnik
set oib='48904582495'
where sifra=2;

update djelatnik
set oib='30007825585'
where sifra=3;

update djelatnik
set oib='54092461342'
where sifra=4;

update servispartner 
set licenciran=true
where sifra=1;