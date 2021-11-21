drop database if exists samostan;
create database samostan character set utf8;
use samostan;

create table nadredjeni(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    titula varchar(50) not null
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    nadredjeni int not null  
);

create table nalog (
    svecenik int not null,
    posao int not null
);

alter table svecenik add foreign key (nadredjeni) references nadredjeni(sifra);
alter table nalog add foreign key (svecenik) references svecenik(sifra);
alter table nalog add foreign key (posao) references posao(sifra);

insert into nadredjeni(sifra,ime,prezime,titula)
values
(null,'Pavle','Popadic','nadbiskup'),
(null,'Zdenko','Vejpović','gvardijan');

insert into posao(sifra,naziv)
values
(null,'čišćenje'),
(null,'skupljanje priloga'),
(null,'spremanje'),
(null'spremanje kreveta');

insert into svecenik(ime,prezime,nadredjeni)
values
('Ivan','Medved',1),
('Mario','Marić',2);

insert into nalog(svecenik,posao) 
values
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,3),
(2,4);