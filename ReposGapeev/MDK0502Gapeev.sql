USE [master]
GO
/****** Object:  Database [MDK0502Gapeev]    Script Date: 11.04.2022 15:31:48 ******/
CREATE DATABASE [MDK0502Gapeev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MDK0502Gapeev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MDK0502Gapeev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MDK0502Gapeev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MDK0502Gapeev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MDK0502Gapeev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MDK0502Gapeev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MDK0502Gapeev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET ARITHABORT OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MDK0502Gapeev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MDK0502Gapeev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MDK0502Gapeev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MDK0502Gapeev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MDK0502Gapeev] SET  MULTI_USER 
GO
ALTER DATABASE [MDK0502Gapeev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MDK0502Gapeev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MDK0502Gapeev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MDK0502Gapeev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MDK0502Gapeev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MDK0502Gapeev] SET QUERY_STORE = OFF
GO
USE [MDK0502Gapeev]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[IdAgent] [int] IDENTITY(1,1) NOT NULL,
	[LastNameAgent] [nvarchar](45) NOT NULL,
	[FirstNameAgent] [nvarchar](45) NOT NULL,
	[MiddleNameAgent] [nvarchar](45) NOT NULL,
	[DealShareAgent] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[IdAgent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[LastNameClient] [nvarchar](45) NOT NULL,
	[FirstNameClient] [nvarchar](45) NOT NULL,
	[MiddleNameClient] [nvarchar](45) NOT NULL,
	[PhoneClient] [nvarchar](18) NULL,
	[EmailClient] [nvarchar](45) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](55) NOT NULL,
	[PriceProduct] [decimal](8, 2) NOT NULL,
	[CountProduct] [int] NOT NULL,
	[ItogPriceProduct]  AS ([PriceProduct]*[CountProduct]),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[IdStaff] [int] IDENTITY(1,1) NOT NULL,
	[LastNameStaff] [nvarchar](40) NOT NULL,
	[FirstNameStaff] [nvarchar](40) NOT NULL,
	[MiddleNameStaff] [nvarchar](40) NULL,
	[DateOfBirthStaff] [date] NOT NULL,
	[EmailStaff] [nvarchar](40) NOT NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.04.2022 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[LoginUser] [nvarchar](45) NOT NULL,
	[PasswordUser] [nvarchar](45) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (1, N'Фахрутдинов', N'Роман', N'Рубинович', CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (4, N'Устинов', N'Максим', N'Алексеевич', CAST(40.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (7, N'Сысоева', N'Людмила', N'Валентиновна', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (9, N'Додонов', N'Илья', N'Геннадьевич', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (11, N'Мухтаруллин', N'Руслан', N'Расыхович', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (13, N'Мосеева', N'Любовь', N'Александровна', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (15, N'Киселев', N'Алексей', N'Геннадьевич', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (19, N'Клюйков', N'Евгений', N'Николаевич', CAST(50.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (24, N'Жданова', N'Галина', N'Николаевна', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (34, N'Басырова', N'Елена', N'Азатовна', CAST(45.00 AS Decimal(5, 2)))
INSERT [dbo].[Agent] ([IdAgent], [LastNameAgent], [FirstNameAgent], [MiddleNameAgent], [DealShareAgent]) VALUES (37, N'Швецов', N'Виталий', N'Олегович', CAST(45.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (2, N'Семенов', N'Евгений ', N'Николаевич', N'32-25-55', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (3, N'Денисова', N'Олеся', N'Леонидовна', NULL, N'dummy@email.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (5, N'Сафронов', N'Алексей', N'Вячеславович', NULL, N'client@esoft.tech')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (6, N'Кудряшов', N'Александр', N'Витальевич', N'551988', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (8, N'Фёдоров', N'Алексей', N'Николаевич', NULL, N'fedorov@mail.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (10, N'Пелымская', N'Светлана', N'Александровна', N'83452112233', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (12, N'Коновальчик', N'Татьяна', N'Геннадьевна', NULL, N'dummy@email.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (14, N'Молоковская', N'Светлана', N'Михайловна', N'898489848', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (16, N'Моторина', N'Анастасия', N'Сергеевна', N'895159848', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (17, N'Поспелова', N'Ольга', N'Александровна', NULL, N'angel@mail.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (18, N'Жиляков', N'Владимир', N'Владимирович', N'445588', N'445588@email.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (20, N'Ефремов', N'Владислав', N'Николаевич', NULL, N'parampampam@mail.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (21, N'Баль', N'Валентина', N'Сергеевна', N'+7998888444', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (22, N'Стрелков', N'Артем', N'Николаевич', NULL, N'test@test.test')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (23, N'Луканин', N'Павел', N'Валерьевич', NULL, N'foo@bar.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (25, N'Шарипова', N'Эльвира', N'Закирчановна', N'12345678910', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (26, N'Фомина', N'Маргарита', N'Николаевна', NULL, N'fomina@email.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (27, N'Кремлев', N'Владислав', N'Юрьевич', N'777', N'kremlevvu@gmail.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (28, N'Пономарева', N'Елена', N'Сергеевна', NULL, N'ponomareva@gmail.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (29, N'Шелест', N'Тамара', N'Васильевна', N'112', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (30, N'Шарипов', N'Рустам', N'Владимирович', NULL, N'sharipov@yandex.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (31, N'Романов', N'Сергей', N'Федорович', N'02', NULL)
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (32, N'Кручинин', N'Иван', N'Андреевич', NULL, N'kruch@list.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (33, N'Гапеев', N'Егор', N'Евгеньевич', N'+688899444', N'UwU')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (35, N'Попов ', N'Алексей', N'Николаевич', N'+0489848565', N'popovan@bik.ru')
INSERT [dbo].[Client] ([IdClient], [LastNameClient], [FirstNameClient], [MiddleNameClient], [PhoneClient], [EmailClient]) VALUES (36, N'Неезжала', N'Наталья', N'Леонидовна', NULL, N'neez@mail.ru')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [NameProduct], [PriceProduct], [CountProduct]) VALUES (2, N'Арбуз', CAST(50.00 AS Decimal(8, 2)), 100)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([IdStaff], [LastNameStaff], [FirstNameStaff], [MiddleNameStaff], [DateOfBirthStaff], [EmailStaff], [IdUser]) VALUES (1, N'444', N'444', N'444', CAST(N'2022-02-11' AS Date), N'444', 3)
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole]) VALUES (1, N'egorca', N'egorca', 1)
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole]) VALUES (2, N'kyza', N'kyza', 1)
INSERT [dbo].[User] ([IdUser], [LoginUser], [PasswordUser], [IdRole]) VALUES (3, N'444', N'444', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Product_NameProduct]    Script Date: 11.04.2022 15:31:49 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UQ_Product_NameProduct] UNIQUE NONCLUSTERED 
(
	[NameProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Role_NameRole]    Script Date: 11.04.2022 15:31:49 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [UQ_Role_NameRole] UNIQUE NONCLUSTERED 
(
	[NameRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_User_LoginUser]    Script Date: 11.04.2022 15:31:49 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_User_LoginUser] UNIQUE NONCLUSTERED 
(
	[LoginUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [MDK0502Gapeev] SET  READ_WRITE 
GO
