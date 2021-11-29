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

create table radni_nalog (
    sifra int not null primary key auto_increment,
    rednibroj varchar(50),
    vozilo int,
    opisservisa varchar(250),
    datum datetime,
    djelatnik int
);

create table vozilo (
    sifra int not null primary key auto_increment,
    registracija varchar(50),
    vlasnik int,
    brojsasije varchar(50),
    kilometraza varchar(50)
);

create table vlasnik (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    brojtelefona varchar(50)
);


alter table radni_nalog add foreign key (djelatnik) references djelatnik(sifra);
alter table vozilo add foreign key (vlasnik) references vlasnik(sifra);
alter table radni_nalog add foreign key (vozilo) references vozilo(sifra);

insert into djelatnik (sifra,ime,prezime,oib,iban)
values (null,'Siniša','Tomić','14828349027','HR9725000095156619582'),
(null,'Marinko','Košar','75258540677','HR3923400093136667769');

insert into vlasnik (sifra,ime,prezime,oib,brojtelefona)
values (null,'Tomica','Božić','23093303162','+385981763121'),
(null,'Mario','Marjanović','82157837941','+38591556782');

insert into vozilo (sifra,registracija,vlasnik,brojsasije,kilometraza)
values(null,'OS235OK',1,'1FMZU77KX4UA69977','189456'),
(null,'BM657ZU',2,'JH4KA8250MC004002','396852');

insert into radni_nalog (sifra,rednibroj,vozilo,datum,opisservisa,djelatnik)
values(null,'RN 1',1,'2021-11-05','Izmjena ulja i filtera i pregled vozila',1),
(null,'RN 2',2,'2021-11-06','Izmjena desne poluosovine i pregled nosača motora',2);


select b.* 
from djelatnik a inner join radni_nalog b on b.djelatnik=a.sifra
inner join vozilo c on b.vozilo=c.sifra
where in not null (a.sifra);
