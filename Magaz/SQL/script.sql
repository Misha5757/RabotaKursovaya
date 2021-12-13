USE [master]
GO
/****** Object:  Database [Magaz]    Script Date: 13.12.2021 22:34:50 ******/
CREATE DATABASE [Magaz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Magaz', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Magaz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Magaz_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Magaz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Magaz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Magaz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Magaz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Magaz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Magaz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Magaz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Magaz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Magaz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Magaz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Magaz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Magaz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Magaz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Magaz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Magaz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Magaz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Magaz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Magaz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Magaz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Magaz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Magaz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Magaz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Magaz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Magaz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Magaz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Magaz] SET RECOVERY FULL 
GO
ALTER DATABASE [Magaz] SET  MULTI_USER 
GO
ALTER DATABASE [Magaz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Magaz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Magaz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Magaz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Magaz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Magaz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Magaz', N'ON'
GO
ALTER DATABASE [Magaz] SET QUERY_STORE = OFF
GO
USE [Magaz]
GO
/****** Object:  Table [dbo].[CONSUMER]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONSUMER](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Invoice] [nchar](10) NOT NULL,
	[INN] [nchar](11) NOT NULL,
	[CodeProfile] [int] NOT NULL,
 CONSTRAINT [PK_CONSUMER] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrance]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Date] [date] NOT NULL,
	[Attempts] [nvarchar](50) NOT NULL,
	[LoginSuccess] [nvarchar](50) NOT NULL,
	[SignlnID] [int] NOT NULL,
 CONSTRAINT [PK_Entrance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MATERIAL_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCER]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCER](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Invoice] [nchar](10) NOT NULL,
	[CodeProfile] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCER_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[CallNumber] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[MaterialCode] [int] NOT NULL,
	[ProducerCode] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCT_1] PRIMARY KEY CLUSTERED 
(
	[CallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFILE]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFILE](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PROFILE] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUEST](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[CountOfProduct] [int] NOT NULL,
	[DateRequest] [date] NOT NULL,
	[Deadline] [date] NOT NULL,
	[ConsumerCode] [int] NOT NULL,
	[ProductNumber] [int] NOT NULL,
 CONSTRAINT [PK_REQUEST] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Status] [nchar](1) NOT NULL,
	[Access] [nchar](1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignIn]    Script Date: 13.12.2021 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignIn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[RoleID] [nchar](1) NOT NULL,
 CONSTRAINT [PK_SignIn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CONSUMER] ON 

INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (30, N'Троглодит ЛТД', N'Новые Васюки, ул. Центральная, 2', N'88        ', N'11111111155', 2)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (31, N'Кисти и глазеты INC', N'Новые Васюки, ул. Тупиковая, 15', N'89        ', N'11111111125', 3)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (32, N'Несите Ваши деньги', N'Новые Васюки, ул. Верный путь, 77', N'90        ', N'11111111192', 2)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (33, N'ООО "Балтикс"', N'Новые Васюки, ул. Верный путь, 78', N'91        ', N'11111111199', 1)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (34, N'ООО "Дороги"', N'Новые Васюки, ул. Большая, 3', N'92        ', N'11111111220', 3)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (35, N'ООО "Перспектива"', N'Новые Васюки, ул. Тупиковая, 17', N'93        ', N'11111111242', 2)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (36, N'ЗАО "Невский"', N'Новые Васюки, ул. Верный путь, 79', N'94        ', N'11111111263', 1)
INSERT [dbo].[CONSUMER] ([Code], [Title], [Address], [Invoice], [INN], [CodeProfile]) VALUES (37, N'ООО "Перекресток"', N'Новые Васюки, ул. Шамиля,  75 ', N'95        ', N'11111111284', 2)
SET IDENTITY_INSERT [dbo].[CONSUMER] OFF
GO
SET IDENTITY_INSERT [dbo].[Entrance] ON 

INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (1, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (2, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (3, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (4, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (5, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (6, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (7, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (8, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (9, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (10, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (11, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (12, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (13, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (14, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (15, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (16, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (17, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (18, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (19, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (20, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (21, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (22, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (23, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (24, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (25, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (26, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (27, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (28, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (30, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (31, N'1', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 1)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (32, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (33, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
INSERT [dbo].[Entrance] ([ID], [Login], [Date], [Attempts], [LoginSuccess], [SignlnID]) VALUES (34, N'2', CAST(N'2021-12-13' AS Date), N'1', N'Успешно!', 3)
SET IDENTITY_INSERT [dbo].[Entrance] OFF
GO
SET IDENTITY_INSERT [dbo].[MATERIAL] ON 

INSERT [dbo].[MATERIAL] ([Code], [Title]) VALUES (1, N'Цемент')
INSERT [dbo].[MATERIAL] ([Code], [Title]) VALUES (2, N'Пластик')
INSERT [dbo].[MATERIAL] ([Code], [Title]) VALUES (3, N'Техника')
SET IDENTITY_INSERT [dbo].[MATERIAL] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCER] ON 

INSERT [dbo].[PRODUCER] ([Code], [Title], [Invoice], [CodeProfile]) VALUES (1, N'Philips', N'123232343 ', 4)
INSERT [dbo].[PRODUCER] ([Code], [Title], [Invoice], [CodeProfile]) VALUES (2, N'Apple', N'1255645   ', 4)
INSERT [dbo].[PRODUCER] ([Code], [Title], [Invoice], [CodeProfile]) VALUES (3, N'Xerox', N'156565    ', 4)
INSERT [dbo].[PRODUCER] ([Code], [Title], [Invoice], [CodeProfile]) VALUES (4, N'Miniampl', N'56565656  ', 4)
INSERT [dbo].[PRODUCER] ([Code], [Title], [Invoice], [CodeProfile]) VALUES (5, N'SLMSUNG', N'56587869  ', 4)
SET IDENTITY_INSERT [dbo].[PRODUCER] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (3, N'Клавиатура', 500.0000, 2, 1)
INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (4, N'Мышка', 250.0000, 2, 1)
INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (7, N'Iphone 11', 500000.0000, 3, 2)
INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (8, N'Xerox Pasher 3020', 90000.0000, 3, 3)
INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (9, N'Цифровой мини-усилитель', 5000.0000, 3, 3)
INSERT [dbo].[PRODUCT] ([CallNumber], [Title], [Price], [MaterialCode], [ProducerCode]) VALUES (10, N'Монитор', 7000.0000, 3, 3)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET IDENTITY_INSERT [dbo].[PROFILE] ON 

INSERT [dbo].[PROFILE] ([Code], [Title]) VALUES (1, N'Торговля')
INSERT [dbo].[PROFILE] ([Code], [Title]) VALUES (2, N'Производство')
INSERT [dbo].[PROFILE] ([Code], [Title]) VALUES (3, N'Ремонт')
INSERT [dbo].[PROFILE] ([Code], [Title]) VALUES (4, N'Производитель')
SET IDENTITY_INSERT [dbo].[PROFILE] OFF
GO
SET IDENTITY_INSERT [dbo].[REQUEST] ON 

INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (8, 30, CAST(N'2021-10-21' AS Date), CAST(N'2021-11-10' AS Date), 30, 3)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (9, 30, CAST(N'2021-10-21' AS Date), CAST(N'2021-11-10' AS Date), 30, 4)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (25, 21, CAST(N'2021-11-25' AS Date), CAST(N'2021-11-15' AS Date), 31, 3)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (26, 22, CAST(N'2021-10-20' AS Date), CAST(N'2021-11-16' AS Date), 31, 4)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (27, 23, CAST(N'2021-10-21' AS Date), CAST(N'2021-11-10' AS Date), 32, 3)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (28, 24, CAST(N'2021-10-21' AS Date), CAST(N'2021-11-10' AS Date), 32, 4)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (29, 25, CAST(N'2021-10-20' AS Date), CAST(N'2021-11-16' AS Date), 33, 7)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (30, 26, CAST(N'2021-10-19' AS Date), CAST(N'2021-11-10' AS Date), 34, 8)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (31, 27, CAST(N'2021-10-18' AS Date), CAST(N'2021-11-04' AS Date), 35, 9)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (32, 28, CAST(N'2021-10-17' AS Date), CAST(N'2021-11-15' AS Date), 33, 10)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (33, 29, CAST(N'2021-10-16' AS Date), CAST(N'2021-11-16' AS Date), 34, 4)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (35, 31, CAST(N'2021-10-14' AS Date), CAST(N'2021-11-18' AS Date), 37, 3)
INSERT [dbo].[REQUEST] ([Number], [CountOfProduct], [DateRequest], [Deadline], [ConsumerCode], [ProductNumber]) VALUES (37, 33, CAST(N'2021-10-12' AS Date), CAST(N'2021-11-20' AS Date), 36, 8)
SET IDENTITY_INSERT [dbo].[REQUEST] OFF
GO
INSERT [dbo].[Role] ([Status], [Access], [Title]) VALUES (N'A', N'A', N'Administrator')
INSERT [dbo].[Role] ([Status], [Access], [Title]) VALUES (N'C', N'U', N'Sotrudnik')
INSERT [dbo].[Role] ([Status], [Access], [Title]) VALUES (N'S', N'S', N'Str.Sotrudnik')
GO
SET IDENTITY_INSERT [dbo].[SignIn] ON 

INSERT [dbo].[SignIn] ([ID], [Login], [Password], [Email], [RoleID]) VALUES (1, N'1', N'1', N'1', N'A')
INSERT [dbo].[SignIn] ([ID], [Login], [Password], [Email], [RoleID]) VALUES (3, N'2', N'2', N'2', N'C')
INSERT [dbo].[SignIn] ([ID], [Login], [Password], [Email], [RoleID]) VALUES (5, N'1', N'1', N'1', N'A')
SET IDENTITY_INSERT [dbo].[SignIn] OFF
GO
ALTER TABLE [dbo].[CONSUMER]  WITH CHECK ADD  CONSTRAINT [FK_CONSUMER_PROFILE] FOREIGN KEY([CodeProfile])
REFERENCES [dbo].[PROFILE] ([Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CONSUMER] CHECK CONSTRAINT [FK_CONSUMER_PROFILE]
GO
ALTER TABLE [dbo].[Entrance]  WITH CHECK ADD  CONSTRAINT [FK_Entrance_SignIn] FOREIGN KEY([SignlnID])
REFERENCES [dbo].[SignIn] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Entrance] CHECK CONSTRAINT [FK_Entrance_SignIn]
GO
ALTER TABLE [dbo].[PRODUCER]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCER_PROFILE] FOREIGN KEY([CodeProfile])
REFERENCES [dbo].[PROFILE] ([Code])
GO
ALTER TABLE [dbo].[PRODUCER] CHECK CONSTRAINT [FK_PRODUCER_PROFILE]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_MATERIAL] FOREIGN KEY([MaterialCode])
REFERENCES [dbo].[MATERIAL] ([Code])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_MATERIAL]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_PRODUCER] FOREIGN KEY([ProducerCode])
REFERENCES [dbo].[PRODUCER] ([Code])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_PRODUCER]
GO
ALTER TABLE [dbo].[REQUEST]  WITH CHECK ADD  CONSTRAINT [FK_REQUEST_CONSUMER] FOREIGN KEY([ConsumerCode])
REFERENCES [dbo].[CONSUMER] ([Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REQUEST] CHECK CONSTRAINT [FK_REQUEST_CONSUMER]
GO
ALTER TABLE [dbo].[REQUEST]  WITH CHECK ADD  CONSTRAINT [FK_REQUEST_PRODUCT] FOREIGN KEY([ProductNumber])
REFERENCES [dbo].[PRODUCT] ([CallNumber])
GO
ALTER TABLE [dbo].[REQUEST] CHECK CONSTRAINT [FK_REQUEST_PRODUCT]
GO
ALTER TABLE [dbo].[SignIn]  WITH CHECK ADD  CONSTRAINT [FK_SignIn_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([Status])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SignIn] CHECK CONSTRAINT [FK_SignIn_Role]
GO
USE [master]
GO
ALTER DATABASE [Magaz] SET  READ_WRITE 
GO
