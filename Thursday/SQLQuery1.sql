
--Constraints



--alter table Persoana
--drop column NumePrenume

--alter table Persoana
--drop column Varsta


--alter table Persoana 
--alter column nume nvarchar(200) NOT NULL

--alter table Persoana 
--alter column prenume nvarchar(200) NOT NULL

select * from Persoana

 --create table Firma (
 --ID int primary key,
 --Nume nvarchar(200) not null,
 --OrasID int)

 --drop table firma

 --MOD MAI BUN DE  A DEFINI PRIMARY KEY:S
 --create table Firma (
 --ID int NOT NULL,
 --Nume nvarchar(200) not null,
 --OrasID int
 --constraint PK_Firma PRIMARY KEY(Id)
 
 --alter table Persoana
 --alter column ID int not null

 --alter table persoana
 --add constraint PK_Persoana primary key(ID)

 -- alter table Album
 --alter column ID int not null

 --GO

 --alter table Album
 --add constraint PK_Album primary key(ID)
 

 --  alter table Artist
 --alter column ID int not null

 --GO

 --alter table Artist
 --add constraint PK_Artist primary key(ID)

 
--alter table Artist
--alter column ID int not null

-- GO

-- alter table Artist
-- add constraint PK_Artist primary key(ID)

--alter table Melodie
--alter column ID int not null

-- GO

-- alter table Melodie
-- add constraint PK_Melodie primary key(ID)

--alter table Oras
--alter column ID int not null

-- GO

-- alter table Oras
-- add constraint PK_Oras primary key(ID)

--alter table Tara
--alter column ID int not null

-- GO

-- alter table Tara
-- add constraint PK_Tara primary key(ID)

--alter table persoana
--add constraint FK_OrasID foreign key (OrasID) references Oras(id)

--create table Playlist(
--Id int,
--PersoanaId int,
--MelodieId int,

--constraint FK_PlaylistID primary key (Id))

--alter table playlist
--add constraint FK_PersoanaID1 foreign key (PersoanaId) references Persoana(ID)

--alter table playlist
--add constraint FK_MelodieId1 foreign key (MelodieId) references Melodie(ID)



--alter table playlist
--alter column PersoanaID int not null

--GO

--alter table playlist
--alter column MelodieID int not null

--alter table persoana
--add CNP char(13)

--alter table persoana
--alter column CNP char(13) not null

--alter table persoana
--add constraint UK_CNP unique (CNP)

--alter table persoana
--add constraint CK_CNP check (CNP like '[1-9]%')

--alter table oras
--add constraint DF_Populatie default 0 for Populatie

--insert into oras(ID, Nume, TaraID)
--values (5,'Lisabona',3)

--insert into oras(Nume,TaraId)
--values ('Oradea',1)


--select * from oras

create table concediu(
ID int not null identity(1,1),
PersoanaID int not null,
FirmaID int not null,
OrasDestinatieID int not null,
DataInceput Date not null default cast(DATEADD(DD,1,GETDATE()) as date),
DataSfarsit Date not null,
DataInZile as datediff(dd, DataInceput, DataSfarsit),

constraint PK_Concediu primary key (ID),
constraint PK_Concediu_PersoanaID foreign key (PersoanaID) references persoana(ID),
constraint PK_Concediu_FirmaID foreign key (FirmaID) references firma(ID),
constraint PK_Concediu_OrasID foreign key (OrasDestinatieID) references Oras(ID),
constraint CK_Date check (DataSfarsit >= DataInceput)
)