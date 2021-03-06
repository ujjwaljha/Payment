USE [master]
GO
/****** Object:  Database [PaymentDb]    Script Date: 13/06/2020 15:04:08 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PaymentDb')
BEGIN
CREATE DATABASE [PaymentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaymentDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.UJJWAL\MSSQL\DATA\PaymentDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaymentDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.UJJWAL\MSSQL\DATA\PaymentDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [PaymentDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaymentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaymentDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaymentDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaymentDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaymentDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaymentDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaymentDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaymentDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaymentDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaymentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaymentDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaymentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaymentDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaymentDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaymentDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaymentDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PaymentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaymentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaymentDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaymentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaymentDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaymentDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PaymentDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaymentDb] SET RECOVERY FULL 
GO
ALTER DATABASE [PaymentDb] SET  MULTI_USER 
GO
ALTER DATABASE [PaymentDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaymentDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaymentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaymentDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaymentDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PaymentDb', N'ON'
GO
ALTER DATABASE [PaymentDb] SET QUERY_STORE = OFF
GO
USE [PaymentDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PackageId] [int] NOT NULL,
	[FrequencyId] [int] NOT NULL,
	[DiscountPercent] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifiyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Installation]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Installation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Installation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PackageId] [int] NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifiyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Installation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookUpCountry]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookUpCountry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookUpCountry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookUpCountry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookUpFrequency]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookUpFrequency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookUpFrequency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookUpFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookUpHardware]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookUpHardware]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookUpHardware](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookUpHardware] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookUpPackage]    Script Date: 13/06/2020 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookUpPackage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookUpPackage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookUpPackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookUpPaymentMethod]    Script Date: 13/06/2020 15:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookUpPaymentMethod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookUpPaymentMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookUpPaymentMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PackageHardware]    Script Date: 13/06/2020 15:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackageHardware]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PackageHardware](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PackageId] [int] NOT NULL,
	[HardwareId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifyOn] [datetime] NULL,
	[ModifiyBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PackageHardware] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200613061108_Initial', N'2.1.14-servicing-32113')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200613104857_priceMandatoryForHardware', N'2.1.14-servicing-32113')
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([Id], [PackageId], [FrequencyId], [DiscountPercent], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (1, 1, 1, 0, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[Discount] ([Id], [PackageId], [FrequencyId], [DiscountPercent], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (2, 1, 2, 0, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[Discount] ([Id], [PackageId], [FrequencyId], [DiscountPercent], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (3, 1, 4, 14, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[Discount] ([Id], [PackageId], [FrequencyId], [DiscountPercent], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (4, 1, 5, 29, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Installation] ON 
GO
INSERT [dbo].[Installation] ([Id], [PackageId], [Price], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (1, 1, CAST(20.00 AS Numeric(8, 2)), CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Installation] OFF
GO
SET IDENTITY_INSERT [dbo].[LookUpCountry] ON 
GO
INSERT [dbo].[LookUpCountry] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (1, N'UAE', CAST(N'2020-06-04T10:24:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpCountry] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (2, N'India', CAST(N'2020-06-02T10:24:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpCountry] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (3, N'USA', CAST(N'2020-06-04T10:24:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LookUpCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[LookUpFrequency] ON 
GO
INSERT [dbo].[LookUpFrequency] ([Id], [Name], [MonthNumber], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (1, N'Monthly', 1, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpFrequency] ([Id], [Name], [MonthNumber], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (2, N'3 Month', 3, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpFrequency] ([Id], [Name], [MonthNumber], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (4, N'6 Month', 6, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpFrequency] ([Id], [Name], [MonthNumber], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (5, N'12 Months', 12, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LookUpFrequency] OFF
GO
SET IDENTITY_INSERT [dbo].[LookUpHardware] ON 
GO
INSERT [dbo].[LookUpHardware] ([Id], [Name], [Price], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (1, N'Harddisk1', CAST(40.00 AS Numeric(8, 2)), CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LookUpHardware] OFF
GO
SET IDENTITY_INSERT [dbo].[LookUpPackage] ON 
GO
INSERT [dbo].[LookUpPackage] ([Id], [Name], [Price], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (1, N'Package Gold', CAST(50.00 AS Numeric(8, 2)), CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LookUpPackage] OFF
GO
SET IDENTITY_INSERT [dbo].[LookUpPaymentMethod] ON 
GO
INSERT [dbo].[LookUpPaymentMethod] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (1, N'MasterCard', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpPaymentMethod] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (2, N'Visa', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpPaymentMethod] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (3, N'Amex', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpPaymentMethod] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (4, N'Meda', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[LookUpPaymentMethod] ([Id], [Name], [CreatedOn], [CreatedBy], [ModifyOn], [ModifyBy], [IsActive], [IsDeleted]) VALUES (5, N'PayPal', CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LookUpPaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageHardware] ON 
GO
INSERT [dbo].[PackageHardware] ([Id], [PackageId], [HardwareId], [CreatedOn], [CreatedBy], [ModifyOn], [ModifiyBy], [IsActive], [IsDeleted]) VALUES (1, 1, 1, CAST(N'2020-06-13T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[PackageHardware] OFF
GO
/****** Object:  Index [IX_Discount_FrequencyId]    Script Date: 13/06/2020 15:04:10 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Discount]') AND name = N'IX_Discount_FrequencyId')
CREATE NONCLUSTERED INDEX [IX_Discount_FrequencyId] ON [dbo].[Discount]
(
	[FrequencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Discount_PackageId]    Script Date: 13/06/2020 15:04:10 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Discount]') AND name = N'IX_Discount_PackageId')
CREATE NONCLUSTERED INDEX [IX_Discount_PackageId] ON [dbo].[Discount]
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Installation_PackageId]    Script Date: 13/06/2020 15:04:10 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Installation]') AND name = N'IX_Installation_PackageId')
CREATE NONCLUSTERED INDEX [IX_Installation_PackageId] ON [dbo].[Installation]
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackageHardware_HardwareId]    Script Date: 13/06/2020 15:04:10 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackageHardware]') AND name = N'IX_PackageHardware_HardwareId')
CREATE NONCLUSTERED INDEX [IX_PackageHardware_HardwareId] ON [dbo].[PackageHardware]
(
	[HardwareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackageHardware_PackageId]    Script Date: 13/06/2020 15:04:10 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackageHardware]') AND name = N'IX_PackageHardware_PackageId')
CREATE NONCLUSTERED INDEX [IX_PackageHardware_PackageId] ON [dbo].[PackageHardware]
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discount_Frequency_FrequencyId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discount]'))
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Frequency_FrequencyId] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[LookUpFrequency] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discount_Frequency_FrequencyId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discount]'))
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Frequency_FrequencyId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discount_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discount]'))
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Package_PackageId] FOREIGN KEY([PackageId])
REFERENCES [dbo].[LookUpPackage] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discount_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discount]'))
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Package_PackageId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Istallation_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installation]'))
ALTER TABLE [dbo].[Installation]  WITH CHECK ADD  CONSTRAINT [FK_Istallation_Package_PackageId] FOREIGN KEY([PackageId])
REFERENCES [dbo].[LookUpPackage] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Istallation_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installation]'))
ALTER TABLE [dbo].[Installation] CHECK CONSTRAINT [FK_Istallation_Package_PackageId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackageHardware_Hardware_HardwareId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackageHardware]'))
ALTER TABLE [dbo].[PackageHardware]  WITH CHECK ADD  CONSTRAINT [FK_PackageHardware_Hardware_HardwareId] FOREIGN KEY([HardwareId])
REFERENCES [dbo].[LookUpHardware] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackageHardware_Hardware_HardwareId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackageHardware]'))
ALTER TABLE [dbo].[PackageHardware] CHECK CONSTRAINT [FK_PackageHardware_Hardware_HardwareId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackageHardware_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackageHardware]'))
ALTER TABLE [dbo].[PackageHardware]  WITH CHECK ADD  CONSTRAINT [FK_PackageHardware_Package_PackageId] FOREIGN KEY([PackageId])
REFERENCES [dbo].[LookUpPackage] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackageHardware_Package_PackageId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackageHardware]'))
ALTER TABLE [dbo].[PackageHardware] CHECK CONSTRAINT [FK_PackageHardware_Package_PackageId]
GO
USE [master]
GO
ALTER DATABASE [PaymentDb] SET  READ_WRITE 
GO
