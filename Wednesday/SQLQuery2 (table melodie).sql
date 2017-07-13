--create table Melodie(
--ID int,
--Titlu nvarchar(100),
--Artist nvarchar(200),
--DataLansare datetime,
--RankMaxim int
--)
--Insert into Melodie (ID, titlu, Artist, DataLansare, RankMaxim)
--values (1,'Despacito','Daddy Yankee','2017-01-28',1),
--		(2,'Story of OJ','Jay-Z','2017-07-2',7),
--		(3,'Rap God','Eminem','2016-03-31',1);

--select *
--from Melodie
--order by RankMaxim

--drop table melodie

--create table Melodie(
--ID int,
--Nume nvarchar(100),
--AlbumId int,
--Durata int
--)

--create table Album(
--ID int,
--Nume nvarchar(100),
--ArtistId int,
--Gen nvarchar(100),
--DataLansarii DateTime
--)

--create table Artist(
--ID int,
--Nume nvarchar(100)
--)

--alter table melodie drop column durata

--alter table melodie add durata time


--Insert into Melodie (ID, nume, AlbumId, Durata)
--values (1,'Melodie1',1,'00:03:33'),
--		(2,'Melodie2',1,'00:02:13'),
--		(3,'Melodie3',2,'00:06:13'),
--		(4,'Melodie4',2,'00:02:53'),

--		(5,'Melodie5',3,'00:01:53'),
--		(6,'Melodie6',3,'00:04:43'),
--		(7,'Melodie7',4,'00:03:13'),
--		(8,'Melodie8',4,'00:03:53')

--insert into Album (id,nume,artistID,gen,datalansarii)
--values (1,'Album1',1,'Reagge','1997-01-28'),
-- (2,'Album2',1,'Reagge','2000-01-28'),
-- (3,'Album3',2,'Rap','2008-04-28'),
--(4,'Album4',2,'Rap','2017-06-28')

--insert into Artist(id, nume)
--values (1,'Artist1'),
--(2,'Artist2')

select * from Melodie

select * from Album

select * from Artist
--insert into Melodie 
--values (9,'Melodie9',1,'00:04:33')


select ar.Nume as NumeArtist, al.Nume as NumeAlbum, count(m.AlbumId) as NoOfSongs, AVG(m.durata)
from Melodie as m
inner join album as al on m.AlbumId = al.ID
inner join artist as ar on al.ArtistId = ar.ID
group by ar.Nume, al.Nume