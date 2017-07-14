--select care sa aduca listele care au un produs care costa mai mult de 2500

select LinieComanda.ComandaID
from LinieComanda
inner join Produs on LinieComanda.ProdusID = Produs.ProdusID
where produs.Pret>2500
group by LinieComanda.ComandaID

select * from LinieComanda
select * from produs
select * from Categorie
select * from Comanda

--select care sa afiseze toate comanzile care au cumparat televizor mai scump de 2000 lei (NU E BUN)
select LinieComanda.ComandaID
from LinieComanda
inner join Produs on LinieComanda.ProdusID = Produs.ProdusID
inner join Categorie on produs.CategorieID = Categorie.CategorieID
where produs.Pret>=2000 and Categorie.CategorieID = 1
group by LinieComanda.ComandaID

--
create view V_Comanda as 
select 
co.ComandaID, 
cl.Nume, 
cl.Prenume, 
sum(pr.Pret*lc.Cantitate) as ValoareComanda, 
sum(lc.Cantitate) as NumarProduse

from Comanda co
inner join Client cl on co.ClientID = cl .ClientID
inner join LinieComanda lc on co.ComandaID = lc.ComandaID
inner join produs pr on lc.ProdusID = pr.ProdusID
group by co.ComandaID,co.ClientID, cl .Nume, cl .Prenume
select * from V_Comanda

--VARIABILE
declare @numr_variabila int

declare @pretTinta decimal(8,2)
set @pretTinta = 2600

select *
from produs
where pret < @pretTinta

select *
from Produs 
where pret > @pretTinta

select *
from produs 
where pret = @pretTinta

--a function that gets sex from CNP
create function F_GetSexFromCNP(@CNP char(13))
returns CHAR(1)
as
begin

declare @result Char(1)
select @result=
	case when left(@CNP,1) in(1,3,5,7) 
		then 'M'
		else 'F'
	end
return @result
end

select *, dbo.F_GetSexFromCNP(CNP) as Sex
from Client
where dbo.F_GetSexFromCNP(CNP) = 'F'

--

create function F_GetDateOfBirth(@CNP char(13))
returns varchar(20)
as 

begin

declare @result varchar(20)
select @result=
	case 
		when left(@CNP,1) in ('1','2')
		then CONCAT('19',SUBSTRING(@CNP,2,2),'-',SUBSTRING(@CNP,4,2),'-',SUBSTRING(@CNP,6,2))
		when left(@CNP,1) in ('3','4')
		then CONCAT('18',SUBSTRING(@CNP,2,2),'-',SUBSTRING(@CNP,4,2),'-',SUBSTRING(@CNP,6,2))
		when left(@CNP,1) in ('5','6')
		then CONCAT('20',SUBSTRING(@CNP,2,2),'-',SUBSTRING(@CNP,4,2),'-',SUBSTRING(@CNP,6,2))
	end
from Client
return @result
end

select *, dbo.F_GetSexFromCNP(CNP) as Sex, dbo.F_GetDateOfBirth(CNP) as Year
from Client

--functie tableara:

create function F_GetComenziValoareMinima(@ValoareMinima decimal(8,2))
returns @result table (ComandaID int,					  
					   NumeClient varchar(200),
					   PrenumeClient varchar(200),
					   ValoareComanda decimal(8,2),
					   NumarProduse int)
as 
begin

insert into @result(ComandaID, NumeClient,PrenumeClient, ValoareComanda, NumarProduse)
select ComandaID, Nume, Prenume, ValoareComanda, NumarProduse 
from V_Comanda
where ValoareComanda < @ValoareMinima

return
end

select * from dbo.F_GetComenziValoareMinima(5000)

select * from V_Comanda

--schimba  cu ă cu a

--create function GetStringWithoutDiacritics (@string nvarchar(max))
--returns varchar(4000)
--as
--begin
--	declare @result nvarchar(max)

--	set @result =  replace(@string, 'ă', 'a')
--	set @result =  replace(@string, 'ș', 's')

--	return @result
--end

--functie care primeste ca parametru comandaID si returneaza pretul mediu = val_comanda/nr_produse

create function F_CalculeazaValoareMedie(@ComandaID int)
returns decimal(8,2)
as
begin 

declare @result decimal(8,2)

select @result = ValoareComanda/ NumarProduse
from V_Comanda
where ComandaID = @ComandaID

return @result

end

select *, dbo.F_CalculeazaValoareMedie(ComandaID)
from V_Comanda

select * from 

--PROCEDURI

create procedure P_ProceduraMea
as begin
select 1
end

go

execute P_Proceduramea

--

Create procedure P_AdaugaProdus @nume nvarchar(200),
								@categorieID int,
								@pret decimal(8,2)
as
begin
	insert into Produs(Nume, CategorieID, Pret)
	values (@nume, @categorieID, @pret)
end

execute P_AdaugaProdus 'Televizor Philips 2', 4, 2100 

--procedura care sa prieasca ca paramentru un ClientID, produsID si cantitate si sa creeze in spate o comanda pt acel client
--si o linie comanda pentru comanda facuta mai sus cu produsID si cantitate din parametri

alter procedure P_AdaugaComanda @ClientID int, @ProdusID int, @Cantitate int
as
begin
	insert into Comanda (ClientID)
	values (@ClientID)

	declare @LastComanda int
	set @LastComanda = (select top 1 ComandaID
						from Comanda
						order by ComandaID desc )
						

	insert into LinieComanda (ComandaID, ProdusID, Cantitate)
	values (@LastComanda, @ProdusID, @Cantitate)

end

exec P_AdaugaComanda 2, 2, 8

--procedura ca re primeste un ID de comanda si sterge comanda aceea si totate linile de comanda ce au legatura cu acea comanda

create procedure P_StergeComanda @ComandaID int
as
begin
	delete from LinieComanda
	where ComandaID = @ComandaID

	delete from Comanda
	where ComandaID = @ComandaID
end

exec P_StergeComanda 5

select * from LinieComanda
select * 