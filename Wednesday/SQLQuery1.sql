--DROP DATABASE	MyDatabase

--create table Persoana(
--ID int,
--Nume nvarchar(200),
--Prenume nvarchar(200)
--)

--alter table Persoana
--add Varsta tinyint

--alter table Persoana
--drop column Varsta

--alter table Persoana
--alter column Varsta int

--insert into Persoana(ID, Nume, Prenume)
--values (1,N'Ştefănescu',N'Robert')

--select ID, Nume, Prenume from Persoana 


--update Persoana
--set Varsta = 27,
--Nume = 'Stefanescu'
--where ID = 1

--delete from Persoana 
--where ID = 1

--insert into Persoana(Id, Nume, Prenume, Varsta)
--values (1, N'Stefanescu', N'Robert', 27)
--       , (2, N'Popescu', N'Popica', 50)
--       , (3, N'Marinescu', N'Marinica', 14)
--       , (4, N'Ionescu', N'Ionica', 20)
--       , (5, N'Georgescu', N'Georgica', 34)

--select * 
--from Persoana
----where varsta between 10 and 30
--where Prenume like '[I-R]%'

--select *
--from Persoana
--order by Nume desc, Prenume asc 

--select MIN(varsta) --MAX
--from Persoana

--select COUNT(*)
--from Persoana

--select len(nume), * --lower(nume),upper(nume)
--from Persoana

--alter table Persoana
--add NumePrenume as Nume + ' ' + Prenume

--alter table Persoana
--drop column Varsta

--alter table Persoana
--add DataNasterii date

--alter table Persoana
--add Varsta as datediff(yy,DataNasterii,getDate())

--select *
--from Persoana

--insert into Oras(ID, Nume, Tara, Populatie)
--values (1,'Constanta','Ungaria',500000),
--(2,'Londra','UK',8000000),
--(3,'Berlin','Germania',600000)

--alter Table persoana
--Add orasID int

--select * 
--from Oras

--select * 
--from Persoana

--Select *
--from persoana
--inner join Oras On persoana.orasID = Oras.ID

--select p.Id, p.NumePrenume, o.Nume as NumeOras
--from Persoana as p
--inner join Oras as o on p.orasID = o.ID

--Exercitiu:

--alter table Oras
--drop column tara

--create table Tara(id int,
--				Nume varchar(200)) 

--alter table Oras
--add TaraId int

--insert into Tara (id,nume)
--values (1,'UK'),
--	(2,'Romania'),
--	(3,'Germania'),
--	(4,'Olanda')

--select Persoana.ID, Persoana.Nume, Oras.Nume, Tara.Nume
--from Persoana
--inner join Oras on Persoana.OrasId = Oras.ID
--inner join Tara on Oras.ID = Tara.id

--Persoanele care au Varsta mai mare decat media de varsta din tara din care fac parte
select
       p.Id
       , P.NumePrenume
       , p.Varsta
       , t.Nume
       , medieDeVarsta.MedieVarsta
from Persoana p
inner join oras o on p.OrasId = o.Id
inner join tara t on o.TaraId = t.Id
inner join (
             select
                    t1.Id as IdTara
                    , t1.Nume
                    , avg(p1.Varsta) as MedieVarsta
             from persoana p1
                    inner join oras o1 on p1.OrasId = o1.Id
                    inner join tara t1 on o1.TaraId = t1.Id
             group by t1.Id, t1.Nume) medieDeVarsta on t.Id = medieDeVarsta.IdTara
where p.Varsta > medieDeVarsta.MedieVarsta 