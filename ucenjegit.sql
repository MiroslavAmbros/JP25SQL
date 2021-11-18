drop database if exists ucenjegit;
create database ucenjegit;
use ucenjegit;

create table git(
    sifra int not null primary key auto_increment ;
    naziv varchar(50);
    tip int
);

insert into git(sifra,naziv) values (null,'jeeej');
