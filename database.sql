USE [master]
GO
/****** Object:  Database [FortuneTellerMVC]    Script Date: 9/15/2016 8:42:44 PM ******/
CREATE DATABASE [FortuneTellerMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FortuneTellerMVC', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FortuneTellerMVC_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FortuneTellerMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FortuneTellerMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FortuneTellerMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET  MULTI_USER 
GO
ALTER DATABASE [FortuneTellerMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FortuneTellerMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FortuneTellerMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FortuneTellerMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FortuneTellerMVC]
GO
/****** Object:  Table [dbo].[BirthMonth]    Script Date: 9/15/2016 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirthMonth](
	[BirthMonthID] [int] IDENTITY(1,1) NOT NULL,
	[BirthMonth] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_BirthMonth] PRIMARY KEY CLUSTERED 
(
	[BirthMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 9/15/2016 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/15/2016 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[SiblingsID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
	[BirthMonthID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siblings]    Script Date: 9/15/2016 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siblings](
	[NumberOfSiblings] [int] NOT NULL,
	[SiblingsID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Siblings] PRIMARY KEY CLUSTERED 
(
	[SiblingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BirthMonth] ON 

INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (1, N'Jan')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (2, N'Feb')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (3, N'March')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (4, N'April')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (5, N'May')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (6, N'June')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (7, N'July')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (8, N'August')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (9, N'Sept')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (10, N'October')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (11, N'November')
INSERT [dbo].[BirthMonth] ([BirthMonthID], [BirthMonth]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[BirthMonth] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (2, N'Orange')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (3, N'Yellow')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (4, N'Green')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (5, N'Blue')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (6, N'Indigo')
SET IDENTITY_INSERT [dbo].[Colors] OFF
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_BirthMonth] FOREIGN KEY([BirthMonthID])
REFERENCES [dbo].[BirthMonth] ([BirthMonthID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_BirthMonth]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Colors] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Colors]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Siblings] FOREIGN KEY([SiblingsID])
REFERENCES [dbo].[Siblings] ([SiblingsID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Siblings]
GO
USE [master]
GO
ALTER DATABASE [FortuneTellerMVC] SET  READ_WRITE 
GO
