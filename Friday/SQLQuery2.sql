USE [MagazinOnline]
GO

/****** Object:  Table [dbo].[Comanda]    Script Date: 14-Jul-17 3:05:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Comanda](
	[ComandaID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComandaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

alter table comanda
drop constraint [FK_Comanda_ClientID]
ALTER TABLE [dbo].[Comanda]  WITH CHECK ADD  CONSTRAINT [FK_Comanda_ClientID] FOREIGN KEY(ClientID)
REFERENCES [dbo].[Client] ([ClientID])
GO

ALTER TABLE [dbo].[Comanda] CHECK CONSTRAINT [FK_Comanda_ClientID]
GO


