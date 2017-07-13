----create database MagazinOnline

--create table produs(
--ProdusID int primary key identity(1,1),
--Nume nvarchar(200) not null,
--CategorieID int,
--Pret decimal(5,2) not null check (Pret>0)
--)


--create table Categorie(
--CategorieID int primary key identity(1,1),
--Nume nvarchar(200) not null)

--create table Client(
--ClientID int primary key identity(1,1),
--Nume nvarchar(200) not null,
--Prenume nvarchar(200) not null,
--CNP char(13) not null unique
--)

--create table Comanda(
--ComandaID int primary key identity(1,1),
--ClientID int not null
--)

--create table LinieComanda (
--LinieComandaId int primary key identity(1,1),
--ComandaID int not null,
--ProdusID int not null,
--Cantitate int not null check (Cantitate <> 0) default(1)
--)

--alter table Produs
--add constraint FK_CategorieID foreign key (CategorieID) references Categorie(CategorieID) 

--alter table Produs
--alter column CategorieID int not null

--alter table Comanda
--add constraint FK_Comanda_ClientID foreign key (ComandaID) references Client(ClientID) 


--alter table LinieComanda
--add constraint FK_LinieComandaComandaID foreign key (ComandaID) references Comanda(ComandaID) 


--alter table LinieComanda
--add constraint FK_LinieComanda_ProdusID foreign key (ProdusID) references Produs(ProdusID) 

--insert into Categorie(Nume)
--values
--  ('Laptop')
--, ('Monitor')
--, ('Telefon')
--, ('Televizor')
 
--insert into Produs(Nume, CategorieId, Pret)
--values
--  ('Laptop Lenovo', 1, 3000)
--, ('Laptop Toshiba', 1, 3300)
--, ('Laptop Dell', 1, 4000)
--, ('Monitor Samsunng', 2, 1000)
--, ('Monitor Benq', 2, 1600)
--, ('Monitor LG', 2, 800)
--, ('Telefon Samsung', 3, 2000)
--, ('Telefon HTC', 3, 1800)
--, ('Telefon Apple', 3, 2600)
--, ('Telefon Motorola', 3, 1100)
--, ('Televizor LG', 4, 2000)
--, ('Televizor Samsung', 4, 2200)
--, ('Televizor Panasonic', 4, 1800)
 
--insert into Client(Nume, Prenume, CNP)
--values
--  ('Stefanescu', 'Robert', '1900227112233')
--, ('Marinescu', 'Marinica', '1600303112233')
--, ('Vasilescu', 'Vasilica', '6010903112233')
--, ('Popescu', 'Popica', '5050610112233')
--, ('Iliescu', 'Ion', '3971010112233')
 
--insert into Comanda(ClientId)
--values
--  (1)
--, (1)
--, (2)
--, (3)
--, (5)
 
--insert into LinieComanda(ComandaId, ProdusId, Cantitate)
--values
--  (1, 1, 1)
--, (1, 9, 2)
--, (2, 9, -1)
--, (3, 5, 1)
--, (4, 13, 1)
--, (4, 12, 1)
--, (5, 3, 1)
 
select * from Categorie
select * from Produs
select * from Client
select * from Comanda
select * from LinieComanda

--select care sa aduca lista cu numele produsului si numele categoriei din care face parte
select Produs.Nume, Categorie.Nume 
from Produs
inner join Categorie on Produs.CategorieID = Categorie.CategorieID
order by Categorie.Nume

--select care sa-mi aduca numarul de produse din fiecare categorie
select Categorie.nume,count(produs.ProdusID)
from produs
inner join categorie on Produs.CategorieID = Categorie.CategorieID
group by Categorie.Nume,Categorie.CategorieID

--care este pretul mediu al produselor din fiecare categorie
select Categorie.nume,avg(produs.Pret)
from produs
inner join categorie on Produs.CategorieID = Categorie.CategorieID
group by Categorie.Nume,Categorie.CategorieID

--care este valoarea totala a fiecarei comenzi?
select LinieComanda.ComandaID, (Produs.ProdusID*Produs.Pret)
from LinieComanda

inner join Produs on LinieComanda.ProdusID = produs.ProdusID
group by LinieComanda.ComandaID ,LinieComanda.ComandaID

--care client a platit cei mai multi bani pana acum
--???

--Persoana e femeie sau barbat? (in functie de CNP?)
select * ,
	case 
		when left(CNP,1) in ('1','3','5','7')
		then 'M'
	else 'F'
	end as Gen,
	case 
		when left(CNP,1) in ('1','2')
		then CONCAT('19',SUBSTRING(CNP,2,2),'-',SUBSTRING(CNP,4,2),'-',SUBSTRING(CNP,6,2))
		when left(CNP,1) in ('3','4')
		then CONCAT('18',SUBSTRING(CNP,2,2),'-',SUBSTRING(CNP,4,2),'-',SUBSTRING(CNP,6,2))
		when left(CNP,1) in ('5','6')
		then CONCAT('20',SUBSTRING(CNP,2,2),'-',SUBSTRING(CNP,4,2),'-',SUBSTRING(CNP,6,2))
	end
from Client

-- cate produse a cumparat fiecare om - cate produse a returnat
select * from LinieComanda
select * from Comanda

select sum(LinieComanda.Cantitate)
from LinieComanda
inner join Comanda on LinieComanda.ComandaID = Comanda.ComandaID
group by Comanda.ClientID