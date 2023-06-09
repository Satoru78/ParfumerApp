USE [master]
GO
/****** Object:  Database [dbParfumer]    Script Date: 04.06.2023 17:28:02 ******/
CREATE DATABASE [dbParfumer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbParfumer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERKIRA\MSSQL\DATA\dbParfumer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbParfumer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERKIRA\MSSQL\DATA\dbParfumer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbParfumer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbParfumer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbParfumer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbParfumer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbParfumer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbParfumer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbParfumer] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbParfumer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbParfumer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbParfumer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbParfumer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbParfumer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbParfumer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbParfumer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbParfumer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbParfumer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbParfumer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbParfumer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbParfumer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbParfumer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbParfumer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbParfumer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbParfumer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbParfumer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbParfumer] SET RECOVERY FULL 
GO
ALTER DATABASE [dbParfumer] SET  MULTI_USER 
GO
ALTER DATABASE [dbParfumer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbParfumer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbParfumer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbParfumer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbParfumer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbParfumer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbParfumer', N'ON'
GO
ALTER DATABASE [dbParfumer] SET QUERY_STORE = OFF
GO
USE [dbParfumer]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Compound] [nvarchar](50) NULL,
	[DateOrder] [date] NOT NULL,
	[DateDelivery] [date] NOT NULL,
	[PointOfSale] [nvarchar](150) NOT NULL,
	[ClientName] [nvarchar](50) NULL,
	[Code] [int] NOT NULL,
	[IDOrderStatus] [int] NOT NULL,
	[IDProduct] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDUnit] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[DiscountMax] [int] NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Supplier] [nvarchar](50) NOT NULL,
	[IDProductCategory] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.06.2023 17:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (1, N'А112Т4,2,F893T5,2', CAST(N'2022-05-04' AS Date), CAST(N'2022-05-10' AS Date), N'603379, г. Ангарск, ул. Спортивная, 46', N'Новиков Матвей Маркович', 201, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (2, N'E530Y6,1,F346G5,2', CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), N'603721, г. Ангарск, ул. Гоголя, 41', NULL, 202, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (3, N'J432E4,1,D344Y7,2', CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), N'410172, г. Ангарск, ул. Северная, 13', N'Соловьев Пётр Никитич', 203, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (4, N'E245R5,1,D378D3,2', CAST(N'2022-05-07' AS Date), CAST(N'2022-05-13' AS Date), N'420151, г. Ангарск, ул. Вишневая, 32', NULL, 204, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (5, N'H732R5,3,R464G6,2', CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), N'125061, г. Ангарск, ул. Подгорная, 8', N'Васильева Софья Глебовна', 205, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (6, N'K535G6,3,E573G6,3', CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), N'630370, г. Ангарск, ул. Шоссейная, 24', NULL, 206, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (7, N'G532R5,5,F344S4,6', CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), N'614753, г. Ангарск, ул. Полевая, 35', NULL, 207, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (8, N'D526R4,5,S753T5,4', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), N'426030, г. Ангарск, ул. Маяковского, 44', NULL, 208, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (9, N'V472S3,3,A436H7,3', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), N'450375, г. Ангарск ул. Клубная, 44', N'Львов Роман Павлович', 209, 1, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (10, N'O875F6,4,E479G6,1', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), N'625560, г. Ангарск, ул. Некрасова, 12', NULL, 210, 2, NULL)
INSERT [dbo].[Order] ([ID], [Compound], [DateOrder], [DateDelivery], [PointOfSale], [ClientName], [Code], [IDOrderStatus], [IDProduct]) VALUES (11, N'tjfjfgh', CAST(N'0001-01-20' AS Date), CAST(N'0001-01-27' AS Date), N'fghjfgh', N'fgjhfg', 11, 2, 17)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Title]) VALUES (1, N'Новый ')
INSERT [dbo].[OrderStatus] ([ID], [Title]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (1, N'А112Т4', N'Одеколон', 1, 660.0000, 30, N'Dragon', N'Летуаль', 1, 5, 6, N'Одеколон Dragon Parfums Dragon Noir, 100 мл', N'\products\А112Т4.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (2, N'F893T5', N'Туалетная вода', 1, 327.0000, 15, N'Paris Line', N'Рив Гош', 2, 2, 14, N'Туалетная вода Paris Line Parfums Cosa Nostra Platinum, 100 мл', N'\products\F893T5.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (3, N'G832G6', N'Туалетная вода', 1, 368.0000, 10, N'Paris Line', N'Рив Гош', 2, 4, 7, N'Туалетная вода Paris Line Parfums Vodka Extreme, 100 мл', N'\products\G832G6.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (4, N'E530Y6', N'Парфюмерная вода', 1, 519.0000, 15, N'Parfums Constantine', N'Летуаль', 2, 3, 9, N'Парфюмерная вода Parfums Constantine Mademoiselle 5, 50 мл', N'\products\E530Y6.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (5, N'F346G5', N'Туалетная вода', 1, 450.0000, 5, N'Today Parfum', N'Рив Гош', 2, 3, 18, N'Туалетная вода Today Parfum G-Club Egoist, 100 мл', N'\products\F346G5.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (6, N'J432E4', N'Туалетная вода', 1, 341.0000, 5, N'Paris Line', N'Рив Гош', 2, 2, 4, N'Туалетная вода Paris Line Parfums Dollar, 100 мл', N'\products\J432E4.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (7, N'D344Y7', N'Парфюмерная вода', 1, 223.0000, 10, N'Today Parfum', N'Летуаль', 2, 5, 16, N'Парфюмерная вода Today Parfum Prestige №6 Eclat, 17 мл', N'\products\D344Y7.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (8, N'V324R5', N'Парфюмерная вода', 1, 519.0000, 5, N'Parfums Constantine', N'Летуаль', 2, 3, 5, N'Парфюмерная вода Parfums Constantine Mademoiselle 7, 50 мл', N'\products\V324R5.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (9, N'E245R5', N'Туалетная вода', 1, 1000.0000, 15, N'Dilis Parfum', N'Рив Гош', 2, 5, 2, N'Туалетная вода Dilis Parfum Mila, 100 мл', N'\products\E245R5.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (10, N'D378D3', N'Туалетная вода', 1, 1500.0000, 10, N'Dilis Parfum', N'Летуаль', 2, 3, 16, N'Духи Dilis Parfum Classic Collection №18, 30 мл', N'\products\D378D3.jpg')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (11, N'C323R4', N'Парфюмерная вода', 1, 4100.0000, 25, N'TRUSSARDI', N'Летуаль', 1, 4, 8, N'Парфюмерная вода TRUSSARDI Donna Trussardi (2011), 50 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (12, N'H732R5', N'Туалетная вода', 1, 500.0000, 15, N'Paris Line', N'Рив Гош', 2, 5, 7, N'Туалетная вода Paris Line Parfums Cosa Nostra, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (13, N'R464G6', N'Духи', 1, 290.0000, 5, N'Dilis Parfum', N'Летуаль', 2, 2, 11, N'Духи Dilis Parfum Ночная Фиалка, 9.5 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (14, N'S346H6', N'Туалетная вода', 1, 1000.0000, 10, N'Dilis Parfum', N'Летуаль', 1, 4, 12, N'Туалетная вода Dilis Parfum Steelman Zone, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (15, N'K535G6', N'Парфюмерная вода', 1, 1200.0000, 15, N'Yves de Sistelle', N'Рив Гош', 2, 2, 5, N'Парфюмерная вода Yves de Sistelle Incidence pour Femme, 65 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (16, N'G532R5', N'Парфюмерная вода', 1, 640.0000, 10, N'Parfums Constantine', N'Летуаль', 1, 3, 16, N'Парфюмерная вода Parfums Constantine New York Perfume Six, 50 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (17, N'K742T5', N'Туалетная вода', 1, 900.0000, 15, N'Dilis Parfum', N'Летуаль', 1, 4, 6, N'Туалетная вода Dilis Parfum Cool&Grey, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (18, N'R563E3', N'Туалетная вода', 1, 418.0000, 5, N'Today Parfum', N'Летуаль', 1, 4, 9, N'Туалетная вода Today Parfum G-Club Millioner, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (19, N'E573G6', N'Духи', 1, 1087.0000, 15, N'Dilis Parfum', N'Рив Гош', 2, 5, 13, N'Духи Dilis Parfum Classic Collection №34, 30 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (20, N'H647R5', N'Туалетная вода', 1, 555.0000, 10, N'Parfums Constantine', N'Рив Гош', 2, 4, 6, N'Туалетная вода Parfums Constantine Gentleman №3, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (21, N'F344S4', N'Туалетная вода', 1, 546.0000, 5, N'Today Parfum', N'Рив Гош', 2, 2, 9, N'Туалетная вода Today Parfum Cola Cherry, 50 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (22, N'L533E4', N'Туалетная вода', 1, 3900.0000, 15, N'HUGO BOSS', N'Рив Гош', 1, 4, 15, N'Туалетная вода HUGO BOSS Boss Bottled, 50 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (23, N'D526R4', N'Парфюмерная вода', 1, 3600.0000, 10, N'DOLCE & GABBANA', N'Летуаль', 2, 3, 6, N'Парфюмерная вода DOLCE & GABBANA Dolce&Gabbana pour', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (24, N'S753T5', N'Парфюмерная вода', 1, 5200.0000, 5, N'DOLCE & GABBANA', N'Летуаль', 2, 4, 3, N'Парфюмерная вода DOLCE & GABBANA Dolce Shine, 75 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (25, N'D634D4', N'Туалетная вода', 1, 367.0000, 15, N'Paris Line', N'Рив Гош', 1, 2, 14, N'Туалетная вода Paris Line Parfums Dollar Diamond, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (26, N'V472S3', N'Парфюмерная вода', 1, 2640.0000, 30, N'LACOSTE', N'Рив Гош', 1, 4, 7, N'Парфюмерная вода LACOSTE Lacoste pour Femme, 30 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (27, N'A436H7', N'Туалетная вода', 1, 1000.0000, 15, N'Dilis Parfum', N'Летуаль', 1, 4, 12, N'Туалетная вода Dilis Parfum Aqua Cool, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (28, N'O875F6', N'Парфюмерная вода', 1, 600.0000, 10, N'Dilis Parfum', N'Рив Гош', 1, 2, 5, N'Dilis Parfum Мужской Walker Breeze', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (29, N'E479G6', N'Туалетная вода', 1, 6100.0000, 25, N'HUGO BOSS', N'Рив Гош', 1, 5, 3, N'Туалетная вода HUGO BOSS Boss Bottled, 100 мл', N'\products\picture.png')
INSERT [dbo].[Product] ([ID], [Articul], [Title], [IDUnit], [Cost], [DiscountMax], [Manufacturer], [Supplier], [IDProductCategory], [Discount], [QuantityInStock], [Description], [Image]) VALUES (30, N'V493E3', N'Туалетная вода', 1, 3200.0000, 10, N'DOLCE & GABBANA', N'Летуаль', 2, 2, 8, N'Туалетная вода DOLCE & GABBANA 3 L''Imperatrice, 50 мл', N'\products\picture.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Title]) VALUES (1, N'Мужской парфюм')
INSERT [dbo].[ProductCategory] ([ID], [Title]) VALUES (2, N'Женский парфюм')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Title]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([ID], [Title]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([ID], [Title]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([ID], [Title]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (1, N'Федоров', N'Глеб', N'Михайлович', N'o@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (2, N'Семенова', N'Софья', N'Дмитриевна', N'hr6zdl@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (3, N'Васильев', N'Егор', N'Германович', N'kaft93x@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (4, N'Смирнова', N'Ирина', N'Александровна', N'dcu@yandex.ru', N'YOyhfR', 2)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (5, N'Петров', N'Андрей', N'Владимирович', N'19dn@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (6, N'Егоров', N'Максим', N'Андреевич', N'pa5h@mail.ru', N'rwVDh9', 2)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (7, N'Никитин', N'Артур', N'Алексеевич', N'281av0@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (8, N'Киселев', N'Максим', N'Сергеевич', N'8edmfh@outlook.com', N'gynQMT', 3)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (9, N'Борисов', N'Тимур', N'Егорович', N'sfn13i@mail.ru', N'AtnDjr', 3)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (10, N'Климов', N'Арсений', N'Тимурович', N'g0orc3x1@outlook.com', N'JlFRCZ', 3)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (11, N'admin', N'admin', N'aa', N'admin', N'admin', 1)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (12, N'man', N'man', N'man', N'man', N'man', 2)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Patronymic], [Login], [Password], [IDRole]) VALUES (13, N'us', N'us', N'us', N'us', N'us', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([IDOrderStatus])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([IDProductCategory])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([IDUnit])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [dbParfumer] SET  READ_WRITE 
GO
