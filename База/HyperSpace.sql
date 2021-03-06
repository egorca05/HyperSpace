USE [master]
GO
/****** Object:  Database [HyperSpace]    Script Date: 19.04.2022 16:25:19 ******/
CREATE DATABASE [HyperSpace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HyperSpace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HyperSpace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HyperSpace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HyperSpace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HyperSpace] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HyperSpace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HyperSpace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HyperSpace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HyperSpace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HyperSpace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HyperSpace] SET ARITHABORT OFF 
GO
ALTER DATABASE [HyperSpace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HyperSpace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HyperSpace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HyperSpace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HyperSpace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HyperSpace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HyperSpace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HyperSpace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HyperSpace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HyperSpace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HyperSpace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HyperSpace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HyperSpace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HyperSpace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HyperSpace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HyperSpace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HyperSpace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HyperSpace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HyperSpace] SET  MULTI_USER 
GO
ALTER DATABASE [HyperSpace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HyperSpace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HyperSpace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HyperSpace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HyperSpace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HyperSpace] SET QUERY_STORE = OFF
GO
USE [HyperSpace]
GO
/****** Object:  Table [dbo].[PC]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC](
	[IdPC] [int] IDENTITY(1,1) NOT NULL,
	[NumberPC] [int] NOT NULL,
	[IdStatusPC] [int] NOT NULL,
 CONSTRAINT [PK_PC] PRIMARY KEY CLUSTERED 
(
	[IdPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[IdSale] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdPC] [int] NOT NULL,
	[IdTarif] [int] NOT NULL,
	[TimeInSale] [date] NOT NULL,
	[TimeOutSale] [date] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[IdSale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPC]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPC](
	[IdStatusPC] [int] IDENTITY(1,1) NOT NULL,
	[NameStatusPC] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_StatusPC] PRIMARY KEY CLUSTERED 
(
	[IdStatusPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarif]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarif](
	[IdTarif] [int] IDENTITY(1,1) NOT NULL,
	[NameTarif] [nvarchar](40) NOT NULL,
	[PriceTarif] [int] NOT NULL,
 CONSTRAINT [PK_Tarif] PRIMARY KEY CLUSTERED 
(
	[IdTarif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.04.2022 16:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[LoginUser] [nvarchar](40) NOT NULL,
	[PasswordUser] [nvarchar](40) NOT NULL,
	[IdRole] [int] NOT NULL,
	[Balans] [decimal](7, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PC] ON 

INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (1, 1, 1)
INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (2, 2, 1)
INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (3, 3, 1)
INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (4, 4, 1)
INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (5, 5, 1)
INSERT [dbo].[PC] ([IdPC], [NumberPC], [IdStatusPC]) VALUES (6, 6, 1)
SET IDENTITY_INSERT [dbo].[PC] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (1, N'Админ')
INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (3, N'Директор')
INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([IdSale], [IdUser], [IdPC], [IdTarif], [TimeInSale], [TimeOutSale]) VALUES (1, 2, 4, 1, CAST(N'2022-04-19' AS Date), CAST(N'2022-04-19' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[StatusPC] ON 

INSERT [dbo].[StatusPC] ([IdStatusPC], [NameStatusPC]) VALUES (1, N'Выключен')
INSERT [dbo].[StatusPC] ([IdStatusPC], [NameStatusPC]) VALUES (2, N'Включен')
INSERT [dbo].[StatusPC] ([IdStatusPC], [NameStatusPC]) VALUES (3, N'Занят')
SET IDENTITY_INSERT [dbo].[StatusPC] OFF
SET IDENTITY_INSERT [dbo].[Tarif] ON 

INSERT [dbo].[Tarif] ([IdTarif], [NameTarif], [PriceTarif]) VALUES (1, N'Стандарт', 100)
INSERT [dbo].[Tarif] ([IdTarif], [NameTarif], [PriceTarif]) VALUES (2, N'VIP', 150)
INSERT [dbo].[Tarif] ([IdTarif], [NameTarif], [PriceTarif]) VALUES (3, N'Premium', 200)
SET IDENTITY_INSERT [dbo].[Tarif] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (1, N'egor', N'egor', 1, CAST(1000 AS Decimal(7, 0)))
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (2, N'obi', N'obi', 2, CAST(500 AS Decimal(7, 0)))
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (3, N'mag', N'mag', 3, CAST(500 AS Decimal(7, 0)))
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (4, N'ivan', N'ivan', 2, CAST(50 AS Decimal(7, 0)))
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (5, N'kyza', N'kyza', 2, CAST(0 AS Decimal(7, 0)))
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole], [Balans]) VALUES (9, N'master', N'master', 2, CAST(0 AS Decimal(7, 0)))
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Role_NameRole]    Script Date: 19.04.2022 16:25:19 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [UQ_Role_NameRole] UNIQUE NONCLUSTERED 
(
	[NameRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [QU_User_LoginUser]    Script Date: 19.04.2022 16:25:19 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [QU_User_LoginUser] UNIQUE NONCLUSTERED 
(
	[LoginUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Balans]  DEFAULT ((0)) FOR [Balans]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK_PC_StatusPC] FOREIGN KEY([IdStatusPC])
REFERENCES [dbo].[StatusPC] ([IdStatusPC])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK_PC_StatusPC]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_PC1] FOREIGN KEY([IdPC])
REFERENCES [dbo].[PC] ([IdPC])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_PC1]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Tarif1] FOREIGN KEY([IdTarif])
REFERENCES [dbo].[Tarif] ([IdTarif])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Tarif1]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_User1] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
USE [master]
GO
ALTER DATABASE [HyperSpace] SET  READ_WRITE 
GO
