USE [master]
GO
/****** Object:  Database [bd2]    Script Date: 20.12.2018 06:50:56 ******/
CREATE DATABASE [bd2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bd2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bd2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bd2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd2] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd2] SET RECOVERY FULL 
GO
ALTER DATABASE [bd2] SET  MULTI_USER 
GO
ALTER DATABASE [bd2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd2', N'ON'
GO
ALTER DATABASE [bd2] SET QUERY_STORE = OFF
GO
USE [bd2]
GO
/****** Object:  User [b]    Script Date: 20.12.2018 06:50:56 ******/
CREATE USER [b] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [a]    Script Date: 20.12.2018 06:50:56 ******/
CREATE USER [a] FOR LOGIN [a] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [b]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [b]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [b]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [b]
GO
ALTER ROLE [db_datareader] ADD MEMBER [b]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [b]
GO
ALTER ROLE [db_owner] ADD MEMBER [a]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [a]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [a]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [a]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [a]
GO
ALTER ROLE [db_datareader] ADD MEMBER [a]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [a]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [a]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [a]
GO
/****** Object:  Schema [dict]    Script Date: 20.12.2018 06:50:56 ******/
CREATE SCHEMA [dict]
GO
/****** Object:  Schema [meta]    Script Date: 20.12.2018 06:50:56 ******/
CREATE SCHEMA [meta]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountsId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Revenue] [float] NOT NULL,
	[OperationalCost] [float] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyNameId] [int] NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[BuildingNumber] [int] NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[PhoneNumber] [varchar](9) NOT NULL,
	[EmailAddress] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ComplaintId] [int] IDENTITY(1,1) NOT NULL,
	[PassengerId] [int] NULL,
	[TicketCollectorId] [int] NULL,
	[Justification] [varchar](3000) NOT NULL,
	[ArrivalDate] [datetime2](7) NOT NULL,
	[ComplaintStatusId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlSchedule]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlSchedule](
	[ControlScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[RegionId] [int] NOT NULL,
	[MeanOfTransportId] [int] NOT NULL,
	[Month] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[FineId] [int] IDENTITY(1,1) NOT NULL,
	[TicketCollectorId] [int] NOT NULL,
	[PassengerId] [int] NOT NULL,
	[WritingDate] [datetime2](7) NOT NULL,
	[FineTypeId] [int] NOT NULL,
	[FineAmountWithInterests] [float] NOT NULL,
	[PaymentStatusId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[PassengerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[PESEL] [nvarchar](9) NULL,
	[DocumentTypeId] [int] NOT NULL,
	[DocumentSeries] [varchar](7) NOT NULL,
	[FathersName] [varchar](30) NULL,
	[City] [varchar](20) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[BuildingNumber] [int] NOT NULL,
	[FlatNumber] [int] NULL,
	[Nationality] [varchar](20) NULL,
	[BirthCountry] [varchar](20) NULL,
	[BirthCity] [varchar](20) NULL,
	[BirthDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[PayrollId] [int] IDENTITY(1,1) NOT NULL,
	[TicketCollectorId] [int] NOT NULL,
	[TotalGrossSalary] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCollector]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCollector](
	[TicketCollectorId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ControlScheduleId] [int] NULL,
	[Name] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[MedicalExamValidity] [date] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[LicenseNumber] [int] NOT NULL,
	[TrainingValidity] [date] NOT NULL,
	[JobStatusId] [int] NOT NULL,
	[BankAccountNumber] [varchar](26) NOT NULL,
	[ColleagueTicketCollectorId] [int] NOT NULL,
	[ContractTypeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[PhoneNumber] [varchar](9) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[PESEL] [varchar](9) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[CompanyName]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[CompanyName](
	[CompanyNameId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](45) NOT NULL,
	[NationalBusinessRegistryNumber] [varchar](14) NOT NULL,
	[TaxNumber] [varchar](14) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[ComplaintStatus]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[ComplaintStatus](
	[ComplaintStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[ContractType]    Script Date: 20.12.2018 06:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[ContractType](
	[ContractTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ContractType] [varchar](50) NOT NULL,
	[Commission] [int] NOT NULL,
	[FineQuota] [int] NOT NULL,
	[BaseGrossSalary] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[DocumentType]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[DocumentType](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[FineType]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[FineType](
	[FineTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FineType] [varchar](45) NOT NULL,
	[FineAmount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[JobStatus]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[JobStatus](
	[JobStatusId] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[MeanOfTansport]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[MeanOfTansport](
	[MeanOfTransportId] [int] IDENTITY(1,1) NOT NULL,
	[TransportName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[PaymentStatus]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[PermissionType]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[PermissionType](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionType] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[Region]    Script Date: 20.12.2018 06:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[Region](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (1, 1, 472973.96095409105, 587.03842507071727, 1, 2000)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (2, 2, 45025.615136165463, 1395.1624247222965, 2, 2001)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (3, 3, 456944.43869902071, 1729.9733216548214, 3, 2002)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (4, 4, 906041.9185002204, 396.97996638574637, 4, 2003)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (5, 5, 172458.88143553952, 1120.9807466347613, 5, 2004)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (6, 6, 171843.32029927397, 361.15642933228821, 6, 2005)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (7, 7, 834666.4397600817, 500.39431755449357, 7, 2006)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (8, 8, 960709.27293809655, 1894.4621635109475, 8, 2007)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (9, 9, 338499.27591685363, 697.399708767142, 9, 2008)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (10, 10, 330033.2051347486, 759.915501233151, 10, 2009)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (11, 1, 396002.10197490366, 1004.1957371887731, 11, 2010)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (12, 2, 55268.024790924981, 1618.9160717739333, 12, 2011)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (13, 3, 194701.06350872063, 1390.02449875233, 1, 2012)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (14, 4, 192400.4159784822, 60.555372415369085, 2, 2013)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (15, 5, 681872.91007307777, 164.13370061858265, 3, 2014)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (16, 6, 900105.94017568044, 1807.8593592196048, 4, 2015)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (17, 7, 486370.80708438705, 246.89472850733191, 5, 2016)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (18, 8, 815357.32950490445, 1710.6901247569779, 6, 2017)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (19, 9, 974956.92854806816, 1516.7846165209937, 7, 2018)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (20, 10, 573887.5410669304, 952.41288046930583, 8, 2019)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (21, 1, 278555.70225831436, 431.03904669687108, 9, 2000)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (22, 2, 546800.23385351489, 1168.1237514913657, 10, 2001)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (23, 3, 850971.34258249239, 997.83441284570586, 11, 2002)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (24, 4, 875441.45255145128, 161.32567271651965, 12, 2003)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (25, 5, 778026.25350871694, 1987.9182483944662, 1, 2004)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (26, 6, 601336.52672507265, 911.66634806975094, 2, 2005)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (27, 7, 391493.72582652967, 1026.6271005508615, 3, 2006)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (28, 8, 503357.0050668451, 1092.8883231677526, 4, 2007)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (29, 9, 585199.28926808073, 750.90884452262378, 5, 2008)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (30, 10, 940070.50106860441, 994.37744402996145, 6, 2009)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (31, 1, 248154.6761230038, 589.31559817367963, 7, 2010)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (32, 2, 350866.79745866812, 487.09530312898352, 8, 2011)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (33, 3, 720562.72250016534, 1007.0875301058812, 9, 2012)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (34, 4, 264393.9413037835, 127.51129927463425, 10, 2013)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (35, 5, 483713.48227214278, 1380.4666872045334, 11, 2014)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (36, 6, 239757.56327778733, 1785.955276240574, 12, 2015)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (37, 7, 142322.29486378809, 1030.8844228418936, 1, 2016)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (38, 8, 877502.87772060686, 851.00192150613384, 2, 2017)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (39, 9, 226989.92497197815, 1713.7951430463211, 3, 2018)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (40, 10, 203368.4980223889, 1321.7288029015663, 4, 2019)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (41, 1, 949788.685876346, 1616.4340989740724, 5, 2000)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (42, 2, 772056.75049214985, 1098.888050345186, 6, 2001)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (43, 3, 412629.74438744818, 1670.7956500681096, 7, 2002)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (44, 4, 518303.14771202864, 1225.8869713292861, 8, 2003)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (45, 5, 706722.327573714, 977.61176572070076, 9, 2004)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (46, 6, 481856.23035096942, 873.37080523063, 10, 2005)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (47, 7, 79686.978652834892, 715.64868498390945, 11, 2006)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (48, 8, 629570.04819218628, 1008.4129446225301, 12, 2007)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (49, 9, 221533.47485397683, 879.812336005183, 1, 2008)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (50, 10, 675209.6283126527, 1235.645705478101, 2, 2009)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (51, 1, 688076.82006809476, 1517.2227590890707, 3, 2010)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (52, 2, 676463.50887877564, 141.65639045725408, 4, 2011)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (53, 3, 614201.06773855689, 1600.2057388425833, 5, 2012)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (54, 4, 728990.45926059573, 198.29757707114217, 6, 2013)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (55, 5, 397499.58866032708, 1591.2048516754082, 7, 2014)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (56, 6, 926172.72710057616, 1418.9146735793515, 8, 2015)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (57, 7, 194053.27255367316, 397.32801187659055, 9, 2016)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (58, 8, 581501.98614756949, 1568.6476489383019, 10, 2017)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (59, 9, 128115.66499150342, 409.0617179912802, 11, 2018)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (60, 10, 571121.35471046681, 209.31439856501035, 12, 2019)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (61, 1, 780348.59447274427, 1334.5293287814266, 1, 2000)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (62, 2, 331409.4346932366, 1407.5059943867409, 2, 2001)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (63, 3, 375609.98367001582, 1143.5533189883238, 3, 2002)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (64, 4, 398427.77484824916, 1703.0222647371807, 4, 2003)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (65, 5, 81978.529011744788, 170.59990305947133, 5, 2004)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (66, 6, 45235.304516235512, 517.10043405978956, 6, 2005)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (67, 7, 334704.30229075969, 611.82854166805214, 7, 2006)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (68, 8, 930306.122204937, 1262.5131994776955, 8, 2007)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (69, 9, 708685.93370633945, 680.08868521083559, 9, 2008)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (70, 10, 442215.34679529042, 378.1784243780088, 10, 2009)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (71, 1, 757883.64531189238, 776.97493637771106, 11, 2010)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (72, 2, 608866.92936378007, 1395.892807001198, 12, 2011)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (73, 3, 588467.40453292639, 1996.894981710657, 1, 2012)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (74, 4, 771688.43052567926, 195.05581361942731, 2, 2013)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (75, 5, 624097.85519058432, 1335.9787814952335, 3, 2014)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (76, 6, 506497.95176616445, 1332.1509963516849, 4, 2015)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (77, 7, 134270.48946606671, 1497.3281014232562, 5, 2016)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (78, 8, 332768.19487046369, 1771.9474415164195, 6, 2017)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (79, 9, 168819.12497773726, 1183.7139069958189, 7, 2018)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (80, 10, 296270.02315774746, 1114.5474431638361, 8, 2019)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (81, 1, 521749.54807223781, 196.01766308584143, 9, 2000)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (82, 2, 761922.67763434339, 18.2141559283315, 10, 2001)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (83, 3, 281923.53021286824, 213.07598716256953, 11, 2002)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (84, 4, 909988.660955428, 1515.2631390445229, 12, 2003)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (85, 5, 252093.68100050962, 1477.1546849408908, 1, 2004)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (86, 6, 571690.16724422819, 447.65920771642556, 2, 2005)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (87, 7, 736664.72972011124, 886.88956428640029, 3, 2006)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (88, 8, 991571.26323956961, 808.789953034739, 4, 2007)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (89, 9, 866893.35264345643, 536.30644759922586, 5, 2008)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (90, 10, 557539.75517156662, 1961.5520136251823, 6, 2009)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (91, 1, 45804.290724114187, 1388.6272643639832, 7, 2010)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (92, 2, 560819.30871621857, 1462.2367739035919, 8, 2011)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (93, 3, 749487.21272910351, 441.94020351485358, 9, 2012)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (94, 4, 655867.57026151125, 1504.4807444813107, 10, 2013)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (95, 5, 423018.90354964457, 1987.1994741201397, 11, 2014)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (96, 6, 618479.25118310947, 208.92810458733146, 12, 2015)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (97, 7, 396546.766822134, 1955.3347313568622, 1, 2016)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (98, 8, 14301.96953919901, 1967.7733853309292, 2, 2017)
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (99, 9, 436424.61870028387, 1055.2870682698149, 3, 2018)
GO
INSERT [dbo].[Accounts] ([AccountsId], [CompanyId], [Revenue], [OperationalCost], [Month], [Year]) VALUES (100, 10, 661587.02305747848, 460.51133166091114, 4, 2019)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (1, 1, N'Peterborough', N'31 Nobel Way', 234, N'70-779', N'142641401', N'ilqrowrn@kwqxgfpn.edu')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (2, 2, N'Exeter', N'70 White Clardon Drive', 136, N'27-808', N'792855165', N'gftqj.kvaxvq@baxjzday.pl')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (3, 3, N'Blackburn', N'84 Milton St.', 99, N'64-575', N'804806474', N'cpwme@qocfwbfj.pl')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (4, 4, N'Huddersfield', N'85 Green Milton Way', 294, N'85-362', N'323772848', N'qvmoffwgif.uhsao@qvfkdjfc.pl')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (5, 5, N'Milton Keynes', N'219 Hague St.', 101, N'70-079', N'857309134', N'dwequ.qgokrq@craztumw.pl')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (6, 6, N'Bradford', N'720 Green Clardon Road', 278, N'46-245', N'972151863', N'snxfsdj@clbwwxzb.edu')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (7, 7, N'Middlesbrough', N'42 Milton Drive', 153, N'74-456', N'950587971', N'izfh3@iojgjsyh.net')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (8, 8, N'Kingston upon Hull', N'69 Cowley Bevard', 53, N'94-120', N'928165551', N'ycfhuqvqqd@lcnctiqx.com')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (9, 9, N'Sutton Coldfield', N'480 Clardon Blvd.', 48, N'56-169', N'135567761', N'duirw9@yxdrubeo.pl')
INSERT [dbo].[Company] ([CompanyId], [CompanyNameId], [City], [Street], [BuildingNumber], [PostalCode], [PhoneNumber], [EmailAddress]) VALUES (10, 10, N'Middlesbrough', N'99 Oak Parway', 105, N'68-288', N'752250446', N'vfclsx@fyierhbm.pl')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (1, 79, 14, N'your Lorem here text your Domine et here Ipsum Lorem text Ipsum Lorem Lorem Lorem Domine Enter Lorem', CAST(N'2014-12-19T19:29:29.3839446' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (2, 50, NULL, N'here text Enter Lorem Lorem Ipsum Ipsum text Lorem Enter et text Ipsum Enter here et Ipsum Domine your Lorem', CAST(N'2009-06-25T17:05:26.1098403' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (3, 49, 7, N'Lorem Lorem text text Domine your Lorem Lorem text Ipsum Enter your text et your Domine et Lorem Lorem text', CAST(N'2009-04-18T15:14:45.5560752' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (4, 97, NULL, N'et your Ipsum Ipsum your Ipsum Domine Domine Domine Enter Ipsum here et here your text Ipsum Lorem Ipsum et', CAST(N'2018-06-05T10:01:48.2999592' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (5, 56, 14, N'text Lorem Ipsum Lorem Lorem Ipsum Enter Lorem Enter Domine Ipsum your Ipsum your Ipsum text Domine Domine text Enter Domine', CAST(N'2010-08-06T04:13:37.2181320' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (6, 55, 3, N'Ipsum Ipsum Lorem Domine Domine Domine here Lorem Ipsum Domine Enter Domine Ipsum Enter text et text et Lorem Enter here et', CAST(N'2010-05-09T14:44:33.9175403' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (7, 22, NULL, N'here text your Domine et here Domine Domine Lorem Lorem your Enter text Lorem Enter your Lorem here text your here', CAST(N'2004-01-28T07:17:34.3685305' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (8, 91, 16, N'et your here Enter Ipsum Domine Lorem text Enter Domine your text et your your your your here text et Ipsum', CAST(N'2017-02-18T13:41:19.9265705' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (9, 10, 1, N'Domine Lorem et Enter Enter text Enter your Domine Domine Enter your Ipsum Enter et your Lorem Enter Domine', CAST(N'2001-09-27T23:25:28.8863083' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (10, 69, NULL, N'here et here text text your Lorem et your Ipsum text Enter Ipsum here here et et here Enter Enter Ipsum', CAST(N'2013-01-29T05:12:37.7838017' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (11, 54, 9, N'text Ipsum Domine here your here your Ipsum Ipsum Enter et Enter Lorem et here Ipsum Ipsum your here', CAST(N'2010-03-11T03:41:18.3568712' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (12, 6, NULL, N'Ipsum your et your Domine Lorem here here et Lorem et Domine Ipsum your here et here et Domine your Lorem Enter', CAST(N'2001-01-15T03:41:28.7122767' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (13, 66, 18, N'your Ipsum Domine Lorem here Enter et et Lorem text Ipsum your et Ipsum Lorem Lorem Domine Ipsum Domine', CAST(N'2012-06-25T20:27:38.5134015' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (14, 8, 12, N'your et here here here Lorem text Domine your your et Enter your Lorem Domine your Ipsum et Enter Ipsum Domine', CAST(N'2001-05-27T08:10:30.3057211' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (15, 73, 5, N'here here text Domine Ipsum your here your Domine Ipsum Enter Enter here text Lorem your et et et Ipsum', CAST(N'2013-10-05T08:35:28.2160442' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (16, 80, 12, N'here Lorem Domine text Ipsum text Domine your Ipsum text your text here Enter Domine your Ipsum Lorem et', CAST(N'2015-02-16T10:36:52.6398638' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (17, 28, 19, N'Domine here your Lorem Lorem Domine Enter Ipsum text et Enter text Enter Domine Domine text Lorem Domine here', CAST(N'2005-04-26T05:27:51.3358777' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (18, 48, NULL, N'your here et Ipsum Enter your Lorem Enter Enter text Enter et text Lorem your et Ipsum your text et Lorem', CAST(N'2009-01-01T20:12:37.3176455' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (19, 28, 19, N'here Enter Domine text Enter Enter et Enter Lorem Domine text Domine Ipsum Enter text et here Ipsum here your Enter et', CAST(N'2005-04-25T05:13:48.0174984' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (20, 64, 20, N'Ipsum Lorem et et Lorem Lorem Lorem et Domine et et et your Lorem your Domine Ipsum your here text et', CAST(N'2012-01-13T07:16:28.9598328' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (21, 74, 19, N'Lorem Domine et Lorem here Domine Enter et Enter here here Ipsum text text your et text et here et Enter Enter Lorem here', CAST(N'2013-12-04T05:47:29.9944218' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (22, 77, 6, N'Domine et Enter here Lorem Lorem Enter Domine Domine Domine your Ipsum et your Ipsum text text here text et et Domine Enter Domine', CAST(N'2014-08-15T10:51:38.5756342' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (23, 13, 12, N'Enter Lorem here et Domine text here Enter Enter et text text et here Ipsum et Enter et Domine Ipsum', CAST(N'2002-06-08T12:49:25.4204285' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (24, 59, 20, N'Enter Lorem Lorem here Enter Enter here Lorem Ipsum here Enter Enter et Domine Lorem your Domine text', CAST(N'2011-03-11T11:55:06.2709353' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (25, 1, 4, N'Domine text here here Lorem Lorem Enter here Domine Enter et text Enter your et Domine Domine Domine', CAST(N'2000-01-26T12:25:46.9010248' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (26, 63, 2, N'Domine text Enter here here text your your Enter Lorem Enter Lorem your Lorem Lorem Ipsum Domine Ipsum', CAST(N'2011-11-10T05:42:43.7445159' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (27, 90, 5, N'Domine Domine Domine Lorem here here et your Domine et Domine Enter Ipsum text Lorem here Enter Domine Domine', CAST(N'2016-12-06T09:55:22.6514775' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (28, 37, 16, N'here text Enter et Domine Lorem Ipsum Ipsum Lorem here Domine your et Domine here Domine Ipsum Lorem', CAST(N'2006-11-19T11:34:01.2695080' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (29, 89, 10, N'Ipsum your text text Enter here text text Ipsum your here et Enter et Domine Lorem Lorem et et here Domine', CAST(N'2016-11-15T23:27:50.9438763' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (30, 29, 4, N'here here here Enter et et text Enter here here text et text Domine your Enter Enter text Lorem your Lorem', CAST(N'2005-07-03T07:01:19.2112364' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (31, 48, 13, N'Ipsum et text et here et Enter Domine your your Lorem Ipsum et Domine Domine Ipsum Lorem Domine Ipsum Domine', CAST(N'2009-01-31T06:29:48.8321107' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (32, 50, 2, N'text here Enter here Lorem et here Domine Ipsum your Domine text Ipsum text Lorem Domine Domine your', CAST(N'2009-04-29T15:09:07.4565611' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (33, 26, 10, N'Lorem your Ipsum et your text Enter Enter Ipsum Enter text text Domine Enter your Lorem Domine et Enter', CAST(N'2004-12-07T17:52:32.5802882' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (34, 49, 18, N'your Lorem your here text et Lorem your Ipsum your Lorem Enter here text here your Lorem Ipsum et your', CAST(N'2009-03-09T17:33:09.1693782' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (35, 86, 16, N'Ipsum Ipsum et here et Domine your here Ipsum Lorem your Domine Domine your Enter Enter your here here Domine', CAST(N'2016-04-02T22:35:02.5668136' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (36, 78, 2, N'Lorem Lorem your Domine Ipsum Ipsum Enter Domine your Enter Domine et here Domine text Enter here et', CAST(N'2014-10-21T05:08:05.0398374' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (37, 46, 1, N'Ipsum Domine Lorem here your here Enter here your text text here here Lorem text Enter text your Domine', CAST(N'2008-09-26T00:46:14.9822138' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (38, NULL, 9, N'Lorem here et here Enter Domine your Ipsum your Ipsum your Domine Lorem here text here Enter Enter Enter', CAST(N'2003-05-31T01:57:54.3576082' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (39, 18, NULL, N'Lorem your et Ipsum Domine Ipsum Lorem text your et Domine et here here et your your Enter text your', CAST(N'2001-10-18T04:07:01.4966008' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (40, 10, 14, N'here text Lorem your text et Domine text et Domine your Enter Lorem et text Ipsum Enter Lorem here here here', CAST(N'2004-04-10T03:02:10.5062777' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (41, 23, 8, N'Ipsum text here Enter Ipsum Enter text Enter et Domine Enter Enter Domine your Lorem Lorem et Lorem Enter', CAST(N'2006-09-12T16:49:56.0087894' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (42, 36, 10, N'Domine Ipsum et Domine Ipsum here here Enter Lorem Domine Ipsum here Domine Domine Domine et et Ipsum', CAST(N'2006-12-15T14:38:59.9184666' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (43, 37, 13, N'your Lorem Domine here your Lorem et text Lorem Lorem Domine Lorem Domine et your text Domine Lorem Lorem', CAST(N'2005-11-09T03:10:19.7613591' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (44, 31, 3, N'your Lorem text Lorem Domine text Lorem Enter Domine text Ipsum et your your et et Enter text Lorem text Enter here text Ipsum Ipsum text', CAST(N'2013-07-13T17:05:21.4401010' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (45, 72, NULL, N'text your Lorem text here here Domine Domine et here your et your here et Enter here text Lorem Domine', CAST(N'2016-02-22T17:36:56.7968703' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (46, 85, 10, N'Lorem Enter Ipsum et Domine Lorem Lorem Domine your text text here here et Domine your Lorem Ipsum et here', CAST(N'2011-12-14T23:33:42.2373643' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (47, 63, 9, N'Ipsum Ipsum Ipsum here Domine Domine Ipsum here text text text Enter Ipsum Enter Domine here here Domine', CAST(N'2002-11-19T05:02:09.1247288' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (48, 16, 20, N'Enter Lorem Enter Domine here Ipsum Lorem et et Domine Lorem et your et Lorem here Domine your here Ipsum text Domine Enter', CAST(N'2012-01-23T23:09:58.6799271' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (49, 64, 6, N'your Domine text Enter your Domine text text Lorem Lorem et your et here Enter et Lorem Ipsum Lorem Enter', CAST(N'2015-05-20T12:50:02.4755888' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (50, 81, NULL, N'your Ipsum Domine text Enter your Ipsum et Ipsum your Domine text your text Domine here Domine here et Lorem Domine', CAST(N'2013-03-30T21:23:02.0677759' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (51, 70, 6, N'Domine Ipsum text Lorem here text your here Domine your Enter text here Ipsum your Ipsum Ipsum here et', CAST(N'2000-10-21T20:30:38.9780433' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (52, 5, 1, N'et Domine Lorem Enter your here Ipsum text Ipsum your Ipsum your et Ipsum here text Domine your here', CAST(N'2008-09-09T07:30:15.0686897' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (53, 46, 6, N'Domine Lorem text Enter text Ipsum Enter your your your your Enter Enter here here Domine your your text', CAST(N'2007-03-20T09:22:40.1933219' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (54, 38, 15, N'Ipsum Domine Ipsum et here et here Ipsum your Domine Ipsum Lorem Domine here here text Lorem here Ipsum text', CAST(N'2017-11-30T18:59:46.8093035' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (55, 95, 3, N'Enter Lorem Enter Lorem your text text here Enter Ipsum et here et Enter et Lorem Lorem Lorem your text', CAST(N'2008-11-12T00:34:31.4397813' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (56, 47, 16, N'text here Ipsum Enter Ipsum Enter Enter here Ipsum Lorem et Ipsum your et your et Domine Lorem your here et', CAST(N'2000-05-06T08:37:50.8083103' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (57, 2, 12, N'Ipsum Lorem Ipsum here Lorem Enter et Enter here Domine here Ipsum Enter text here Lorem your your Enter', CAST(N'2007-01-18T04:16:00.6894117' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (58, 38, 9, N'your Enter Ipsum Lorem your Lorem et Ipsum Domine Domine Domine text Lorem here Enter Lorem Enter Ipsum text Lorem', CAST(N'2017-02-07T03:19:39.2851401' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (59, 91, 4, N'Ipsum et your your here here Enter Domine your Ipsum text Domine Ipsum Domine Enter your Domine your', CAST(N'2018-05-10T21:36:01.3989343' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (60, 97, NULL, N'Enter here Enter your Enter Ipsum text Domine here Lorem Ipsum Ipsum Lorem Ipsum Ipsum Domine et Enter', CAST(N'2017-09-25T22:30:53.4736162' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (61, 94, 12, N'text text Domine Domine et Lorem your Lorem text Ipsum Domine here Lorem your Ipsum here et Ipsum Ipsum', CAST(N'2012-06-02T04:49:11.2660629' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (62, 66, 14, N'Lorem your here Lorem here here Domine et your Enter Domine your your Lorem Domine et your Lorem your Domine', CAST(N'2016-03-09T19:43:33.0990226' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (63, 86, 10, N'Domine text here your Enter Lorem et your et text your Domine et your et text Lorem text Lorem here text', CAST(N'2000-04-04T14:13:28.9826941' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (64, 2, 3, N'Ipsum et your Enter your et text text Lorem Enter your here your your Enter your here here Domine Enter', CAST(N'2015-03-27T16:24:09.6750720' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (65, 81, 14, N'Ipsum Enter your Ipsum Ipsum Enter Domine Domine et Domine Lorem et Ipsum Lorem Ipsum Domine Enter text', CAST(N'2003-12-29T22:42:48.9516910' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (66, 22, 19, N'Domine here Ipsum Enter et here Domine Ipsum your text Domine your here text Enter Enter Ipsum Enter', CAST(N'2000-11-11T12:32:10.9003101' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (67, 5, 18, N'Lorem et text text Ipsum your Ipsum Lorem Lorem Lorem here text here Enter Domine Enter Ipsum Domine', CAST(N'2015-02-07T09:48:56.1319886' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (68, 80, 11, N'here your et here Ipsum Ipsum et Ipsum Enter Lorem Ipsum Lorem Enter Domine Ipsum et text Lorem your', CAST(N'2003-04-19T02:54:29.3440233' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (69, 18, 11, N'Domine your Domine here Enter et Enter Lorem your here your text Enter Ipsum Lorem your Ipsum text Ipsum Domine', CAST(N'2004-02-23T09:35:27.7389076' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (70, 22, 15, N'Lorem Enter Domine Enter text text et your Ipsum here Lorem Domine Enter text text here text Domine Lorem', CAST(N'2017-12-15T03:27:23.1762069' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (71, 95, NULL, N'here Ipsum text text here text text here your Domine Domine Lorem Enter here Lorem Domine Lorem Enter', CAST(N'2006-05-23T09:50:37.6576499' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (72, 34, 12, N'Ipsum et Enter et Ipsum et your Lorem text et text Enter et Enter Lorem Enter Domine Ipsum Lorem Lorem Enter', CAST(N'2001-11-27T03:29:56.9782694' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (73, 11, NULL, N'Enter et Lorem Enter et Ipsum Ipsum here et your here Domine here here Domine Ipsum Lorem text et Domine et your', CAST(N'2007-03-17T16:05:35.8210446' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (74, 38, 11, N'Lorem text Ipsum your Domine Lorem here Lorem Lorem Enter Domine your et text et Ipsum here here et text', CAST(N'2001-01-15T02:11:37.5112206' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (75, 6, 3, N'your Ipsum Domine Enter Enter text your Enter Ipsum your et here Lorem text text Enter your Domine Ipsum text here here Domine text', CAST(N'2005-05-02T14:26:32.9510433' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (76, 29, 11, N'text Enter et text here Ipsum Ipsum your Domine your your Lorem et et Enter Ipsum your Enter Lorem Lorem', CAST(N'2006-12-20T15:08:30.0759551' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (77, 37, 5, N'Lorem Enter text et your your Enter Lorem text text text Ipsum here Domine et Lorem your Domine Ipsum', CAST(N'2008-10-06T07:41:18.8142751' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (78, 47, 4, N'Domine Domine here et et Enter Lorem et et Lorem Domine text Ipsum Domine Ipsum Enter Lorem Lorem your', CAST(N'2007-11-25T19:44:03.9803276' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (79, 42, 6, N'Ipsum Ipsum Lorem et et et here et text your Domine Enter Domine text text Ipsum Lorem Lorem Enter Enter text et', CAST(N'2014-01-16T18:18:09.4740651' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (80, 74, 11, N'Domine Domine Lorem your et Domine Ipsum Ipsum your Ipsum text here Lorem Domine Domine Ipsum et here Lorem here', CAST(N'2007-02-11T12:52:04.6636606' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (81, 38, NULL, N'Ipsum Enter here Enter Lorem Enter Domine here Domine et here Domine et et Ipsum Lorem your text here Ipsum', CAST(N'2008-12-22T00:40:34.6197870' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (82, 48, 11, N'your Domine Ipsum Enter text et et your your Ipsum here Lorem Domine your text Domine your Lorem text', CAST(N'2004-11-13T10:45:23.9715503' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (83, 26, 7, N'text Lorem your Enter Enter et Enter Domine here text here Ipsum et Lorem et here here here et Enter et Ipsum', CAST(N'2010-07-01T22:43:58.7939194' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (84, 56, 4, N'text Domine Lorem your your Enter et here here Ipsum Ipsum Ipsum Ipsum Domine Lorem Ipsum Domine et Domine', CAST(N'2003-08-19T02:04:48.8761004' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (85, 20, 3, N'et et text text Domine Lorem et et your Ipsum Lorem Domine Lorem Lorem et Domine Lorem Ipsum your your your', CAST(N'2004-09-11T10:30:40.2331931' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (86, 25, 12, N'Domine your Ipsum et here your text Ipsum Domine Ipsum text Ipsum Lorem Lorem your text Lorem text Domine', CAST(N'2000-05-23T22:59:33.7634209' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (87, 3, 5, N'Ipsum your Ipsum your Enter your Lorem your your Ipsum et Ipsum Lorem text here Enter your et text Lorem Domine text', CAST(N'2002-02-10T05:46:27.2632391' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (88, 12, NULL, N'Domine text text text here Lorem et Ipsum Domine Ipsum et here Lorem Ipsum text Ipsum Enter here text Lorem', CAST(N'2006-01-06T22:52:45.7709848' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (89, 32, 17, N'your your Enter Enter et Enter text text Ipsum Lorem here Domine Enter et text et et Enter Domine Enter Ipsum Ipsum Enter Domine Lorem', CAST(N'2000-04-27T16:58:37.7295969' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (90, 2, 19, N'here Lorem et your Enter your text et et text Ipsum Domine text Enter Lorem Lorem here text your Lorem', CAST(N'2015-11-28T13:57:11.7585032' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (91, 84, NULL, N'Domine Lorem Lorem Lorem Lorem here text Ipsum Enter text here your your Domine text text Ipsum your here', CAST(N'2007-10-04T00:52:04.3504256' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (92, 41, 16, N'your et et Ipsum here Lorem your Lorem Lorem Lorem Lorem Domine your here Enter your Lorem Lorem Ipsum', CAST(N'2010-08-18T21:26:35.6970738' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (93, 56, NULL, N'Enter et Domine your et Enter Enter your text et your Lorem Enter et et et Ipsum et Enter Domine your', CAST(N'2004-01-20T04:21:52.9586740' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (94, 22, 4, N'Lorem et et your Enter Lorem your Enter Enter Ipsum Domine here your here et Ipsum et text here Domine', CAST(N'2003-01-22T05:36:08.0229847' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (95, 17, 10, N'Ipsum here Enter et text Ipsum text here Ipsum here et Domine Domine your your text Lorem Enter Lorem your here Ipsum here Enter', CAST(N'2010-11-07T22:12:59.2402148' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (96, 58, NULL, N'et here your Domine et text et text Ipsum Domine Domine Ipsum text your Enter here text your Lorem text', CAST(N'2009-07-04T21:06:22.9097670' AS DateTime2), 3)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (97, 51, NULL, N'your Domine Domine Domine Domine Enter text your et your here text Ipsum Ipsum text et Domine here Domine', CAST(N'2006-09-12T00:25:30.9357725' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (98, 36, 11, N'text here Ipsum Enter Lorem here text Lorem your text your text et et Lorem Lorem your Enter et text your Ipsum', CAST(N'2009-08-14T10:46:10.0862872' AS DateTime2), 2)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (99, 51, NULL, N'text Lorem Lorem et Ipsum text et Ipsum et Domine et text Domine text Lorem Ipsum et Domine here Domine', CAST(N'2009-07-15T18:22:32.4884100' AS DateTime2), 3)
GO
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (100, 51, 6, N'Lorem Domine Enter et Lorem Domine Lorem Ipsum Domine Enter Lorem Domine Lorem text et Ipsum et here here Domine et', CAST(N'2015-04-13T05:04:45.8965602' AS DateTime2), 1)
INSERT [dbo].[Complaint] ([ComplaintId], [PassengerId], [TicketCollectorId], [Justification], [ArrivalDate], [ComplaintStatusId]) VALUES (101, NULL, NULL, N'Testowe zazalenie', CAST(N'2018-12-20T06:01:29.2036273' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[ControlSchedule] ON 

INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (2, 2, 2, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (3, 3, 3, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (4, 4, 4, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (5, 5, 5, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (6, 6, 1, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (7, 7, 2, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (8, 8, 3, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (9, 9, 4, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (10, 10, 5, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (11, 11, 1, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (12, 12, 2, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (13, 13, 3, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (14, 14, 4, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (15, 15, 5, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (16, 16, 1, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (17, 17, 2, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (18, 18, 3, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (19, 19, 4, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (20, 20, 5, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (21, 21, 1, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (22, 22, 2, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (23, 23, 3, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (24, 24, 4, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (25, 25, 5, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (26, 1, 1, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (27, 2, 2, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (28, 3, 3, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (29, 4, 4, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (30, 5, 5, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (31, 6, 1, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (32, 7, 2, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (33, 8, 3, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (34, 9, 4, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (35, 10, 5, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (36, 11, 1, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (37, 12, 2, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (38, 13, 3, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (39, 14, 4, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (40, 15, 5, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (41, 16, 1, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (42, 17, 2, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (43, 18, 3, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (44, 19, 4, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (45, 20, 5, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (46, 21, 1, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (47, 22, 2, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (48, 23, 3, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (49, 24, 4, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (50, 25, 5, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (51, 1, 1, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (52, 2, 2, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (53, 3, 3, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (54, 4, 4, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (55, 5, 5, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (56, 6, 1, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (57, 7, 2, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (58, 8, 3, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (59, 9, 4, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (60, 10, 5, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (61, 11, 1, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (62, 12, 2, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (63, 13, 3, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (64, 14, 4, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (65, 15, 5, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (66, 16, 1, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (67, 17, 2, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (68, 18, 3, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (69, 19, 4, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (70, 20, 5, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (71, 21, 1, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (72, 22, 2, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (73, 23, 3, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (74, 24, 4, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (75, 25, 5, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (76, 1, 1, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (77, 2, 2, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (78, 3, 3, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (79, 4, 4, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (80, 5, 5, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (81, 6, 1, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (82, 7, 2, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (83, 8, 3, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (84, 9, 4, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (85, 10, 5, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (86, 11, 1, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (87, 12, 2, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (88, 13, 3, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (89, 14, 4, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (90, 15, 5, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (91, 16, 1, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (92, 17, 2, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (93, 18, 3, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (94, 19, 4, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (95, 20, 5, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (96, 21, 1, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (97, 22, 2, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (98, 23, 3, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (99, 24, 4, 3)
GO
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (100, 25, 5, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (101, 1, 1, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (102, 2, 2, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (103, 3, 3, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (104, 4, 4, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (105, 5, 5, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (106, 6, 1, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (107, 7, 2, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (108, 8, 3, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (109, 9, 4, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (110, 10, 5, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (111, 11, 1, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (112, 12, 2, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (113, 13, 3, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (114, 14, 4, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (115, 15, 5, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (116, 16, 1, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (117, 17, 2, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (118, 18, 3, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (119, 19, 4, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (120, 20, 5, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (121, 21, 1, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (122, 22, 2, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (123, 23, 3, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (124, 24, 4, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (125, 25, 5, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (126, 1, 1, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (127, 2, 2, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (128, 3, 3, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (129, 4, 4, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (130, 5, 5, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (131, 6, 1, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (132, 7, 2, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (133, 8, 3, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (134, 9, 4, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (135, 10, 5, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (136, 11, 1, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (137, 12, 2, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (138, 13, 3, 6)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (139, 14, 4, 7)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (140, 15, 5, 8)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (141, 16, 1, 9)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (142, 17, 2, 10)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (143, 18, 3, 11)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (144, 19, 4, 12)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (145, 20, 5, 1)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (146, 21, 1, 2)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (147, 22, 2, 3)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (148, 23, 3, 4)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (149, 24, 4, 5)
INSERT [dbo].[ControlSchedule] ([ControlScheduleId], [RegionId], [MeanOfTransportId], [Month]) VALUES (150, 25, 5, 6)
SET IDENTITY_INSERT [dbo].[ControlSchedule] OFF
SET IDENTITY_INSERT [dbo].[Fine] ON 

INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (1, 11, 24, CAST(N'1996-11-18T07:44:27.9829935' AS DateTime2), 5, 384.91351920408829, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (2, 96, 72, CAST(N'2010-09-14T01:20:46.6117345' AS DateTime2), 6, 254.1521928525307, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (3, 53, 72, CAST(N'2010-10-03T11:35:33.9590073' AS DateTime2), 5, 635.54327592046161, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (4, 4, 32, CAST(N'1999-02-13T22:14:11.0555967' AS DateTime2), 5, 1775.2390446957381, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (5, 95, 66, CAST(N'2008-11-27T13:55:07.9293618' AS DateTime2), 3, 1498.1038642572723, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (6, 92, 17, CAST(N'1994-09-08T08:28:39.0469094' AS DateTime2), 4, 827.57999972793277, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (7, 60, 29, CAST(N'1998-03-13T14:57:21.1289093' AS DateTime2), 7, 773.08775241164847, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (8, 85, 86, CAST(N'2014-09-29T02:47:24.8117452' AS DateTime2), 3, 1699.8276345896663, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (9, 85, 59, CAST(N'2007-01-10T17:36:49.6259174' AS DateTime2), 2, 679.47630243351512, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (10, 5, 26, CAST(N'1997-07-10T22:05:36.8433384' AS DateTime2), 2, 1043.9117769915201, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (11, 68, 10, CAST(N'1992-10-27T02:33:11.3931189' AS DateTime2), 7, 1247.6027455402552, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (12, 6, 74, CAST(N'2011-06-03T09:28:08.1710643' AS DateTime2), 3, 354.5087642755866, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (13, 12, 25, CAST(N'1997-01-31T22:45:43.4778416' AS DateTime2), 2, 1738.9028592681991, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (14, 96, 8, CAST(N'1992-03-25T06:05:06.6837219' AS DateTime2), 4, 72.742221910852109, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (15, 77, 97, CAST(N'2018-01-12T11:49:10.5771090' AS DateTime2), 7, 1133.5451654780402, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (16, 70, 44, CAST(N'2002-09-30T20:25:33.0983907' AS DateTime2), 4, 381.12538046255958, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (17, 8, 60, CAST(N'2007-04-10T08:52:26.9958737' AS DateTime2), 3, 1509.8336197015988, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (18, 14, 86, CAST(N'2014-09-21T17:42:57.4491890' AS DateTime2), 7, 1225.1746613649532, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (19, 59, 75, CAST(N'2011-08-30T05:25:57.3759647' AS DateTime2), 5, 1385.6711235761973, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (20, 70, 2, CAST(N'1990-06-21T19:57:21.8111241' AS DateTime2), 6, 483.62905927171425, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (21, 19, 99, CAST(N'2018-07-22T05:39:10.9047528' AS DateTime2), 5, 1437.9703148444976, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (22, 100, 47, CAST(N'2003-06-21T18:01:05.4700432' AS DateTime2), 6, 1947.6968804130781, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (23, 41, 42, CAST(N'2002-03-01T11:56:07.6883853' AS DateTime2), 7, 162.89928842470948, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (24, 31, 40, CAST(N'2001-07-25T08:27:50.8971806' AS DateTime2), 3, 1400.1526308246669, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (25, 23, 82, CAST(N'2013-09-13T22:01:44.6605703' AS DateTime2), 4, 1242.7458889981481, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (26, 65, 51, CAST(N'2004-09-04T21:51:35.9018120' AS DateTime2), 5, 439.6201122736652, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (27, 40, 55, CAST(N'2005-12-09T12:04:11.2949356' AS DateTime2), 7, 1660.2703135741269, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (28, 23, 94, CAST(N'2017-03-25T18:50:09.0708154' AS DateTime2), 1, 1399.7259984722948, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (29, 20, 85, CAST(N'2014-08-11T23:37:33.5846510' AS DateTime2), 1, 592.62406481086464, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (30, 64, 48, CAST(N'2003-09-03T18:27:23.8933071' AS DateTime2), 1, 1721.582886633269, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (31, 71, 93, CAST(N'2016-10-10T17:07:34.2075966' AS DateTime2), 6, 370.08604797072991, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (32, 64, 22, CAST(N'1996-02-19T04:34:23.9971675' AS DateTime2), 3, 1369.4093569039412, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (33, 80, 22, CAST(N'1996-02-22T05:44:27.1941659' AS DateTime2), 1, 815.11648502904757, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (34, 71, 86, CAST(N'2014-09-29T10:15:50.1947694' AS DateTime2), 6, 1606.3415573939408, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (35, 23, 33, CAST(N'1999-05-10T13:12:44.4099844' AS DateTime2), 2, 1248.4654724823615, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (36, 32, 58, CAST(N'2006-10-14T13:20:35.2296799' AS DateTime2), 4, 984.33955152721114, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (37, 78, 75, CAST(N'2011-09-05T19:19:23.5265182' AS DateTime2), 2, 181.79777738721938, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (38, 49, 58, CAST(N'2006-07-19T19:15:31.8044598' AS DateTime2), 4, 415.31384941903588, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (39, 97, 99, CAST(N'2018-09-13T04:04:44.2250864' AS DateTime2), 4, 1294.44094435053, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (40, 25, 66, CAST(N'2008-12-13T01:50:55.7515504' AS DateTime2), 7, 1035.7609712685276, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (41, 76, 37, CAST(N'2000-06-26T15:23:24.9245317' AS DateTime2), 1, 1652.4040678760055, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (42, 97, 63, CAST(N'2008-03-09T10:39:47.9588485' AS DateTime2), 6, 143.06104748652365, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (43, 21, 64, CAST(N'2008-06-20T00:11:12.8481311' AS DateTime2), 7, 985.13764840789963, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (44, 91, 59, CAST(N'2006-12-22T09:42:39.2395245' AS DateTime2), 2, 718.03696673272032, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (45, 100, 16, CAST(N'1994-07-14T12:31:32.6293449' AS DateTime2), 5, 203.68415219880833, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (46, 78, 7, CAST(N'1991-10-02T22:49:29.7080771' AS DateTime2), 3, 598.28834077263639, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (47, 23, 27, CAST(N'1997-09-10T17:50:56.4588220' AS DateTime2), 2, 1169.705486469765, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (48, 65, 74, CAST(N'2011-04-18T18:27:46.4859023' AS DateTime2), 5, 1406.08711233646, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (49, 40, 99, CAST(N'2018-07-15T18:02:32.8944735' AS DateTime2), 5, 1577.4532377614887, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (50, 72, 52, CAST(N'2004-11-08T04:17:10.9979421' AS DateTime2), 1, 495.81096810093663, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (51, 40, 10, CAST(N'1992-09-22T17:01:06.8098586' AS DateTime2), 6, 1723.3118236639127, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (52, 24, 95, CAST(N'2017-05-03T00:46:36.6299338' AS DateTime2), 5, 82.578670271941775, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (53, 15, 51, CAST(N'2004-09-02T17:30:36.3534298' AS DateTime2), 3, 104.91013438669505, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (54, 16, 38, CAST(N'2001-01-02T03:47:15.3190873' AS DateTime2), 6, 1944.0684290342351, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (55, 54, 74, CAST(N'2011-05-18T21:44:37.0915709' AS DateTime2), 1, 673.52304080199588, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (56, 12, 78, CAST(N'2012-05-29T13:43:22.5129504' AS DateTime2), 7, 437.2166387910101, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (57, 55, 30, CAST(N'1998-07-16T13:24:38.9233492' AS DateTime2), 7, 91.252904427821235, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (58, 22, 32, CAST(N'1999-03-12T03:07:43.0618267' AS DateTime2), 2, 1235.3906450957948, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (59, 81, 50, CAST(N'2004-06-01T00:12:26.3950265' AS DateTime2), 2, 532.49315569759028, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (60, 30, 15, CAST(N'1994-03-25T16:03:32.0275498' AS DateTime2), 6, 1058.4837519836069, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (61, 53, 62, CAST(N'2007-09-29T20:24:27.7519738' AS DateTime2), 4, 1167.3096861538056, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (62, 38, 35, CAST(N'1999-12-18T20:07:12.0580939' AS DateTime2), 7, 1373.3617539393538, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (63, 66, 1, CAST(N'1990-02-18T03:09:51.2270941' AS DateTime2), 3, 1107.2035697788017, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (64, 21, 12, CAST(N'1993-05-09T23:09:25.7326103' AS DateTime2), 2, 957.89341580024609, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (65, 34, 34, CAST(N'1999-09-30T04:58:02.6357418' AS DateTime2), 3, 673.82572902079, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (66, 5, 89, CAST(N'2015-09-07T21:58:47.3959513' AS DateTime2), 4, 1878.193388636314, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (67, 26, 53, CAST(N'2005-04-12T03:43:40.9768984' AS DateTime2), 3, 1539.3922792465392, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (68, 42, 40, CAST(N'2001-05-04T12:29:53.2830722' AS DateTime2), 3, 132.56130187425825, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (69, 73, 76, CAST(N'2011-11-15T16:52:22.2737375' AS DateTime2), 2, 824.27674942849046, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (70, 45, 39, CAST(N'2001-03-31T22:28:35.3474290' AS DateTime2), 3, 149.20561395082885, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (71, 92, 70, CAST(N'2010-01-25T01:06:09.5718724' AS DateTime2), 3, 199.32760307534019, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (72, 60, 3, CAST(N'1990-09-22T13:36:55.1914139' AS DateTime2), 6, 1094.5197702825626, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (73, 18, 87, CAST(N'2015-01-08T13:38:13.2241027' AS DateTime2), 4, 1930.7337170144235, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (74, 34, 10, CAST(N'1992-09-17T03:35:01.6244143' AS DateTime2), 6, 349.9101523076697, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (75, 94, 66, CAST(N'2008-12-25T04:33:56.8865924' AS DateTime2), 6, 831.22499139570857, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (76, 23, 36, CAST(N'2000-05-14T18:59:22.9459043' AS DateTime2), 6, 1294.9092673579742, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (77, 79, 83, CAST(N'2013-12-31T17:49:52.6219121' AS DateTime2), 6, 962.55923200517861, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (78, 50, 84, CAST(N'2014-03-10T02:13:28.4488608' AS DateTime2), 5, 1444.8623216919891, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (79, 31, 25, CAST(N'1997-01-11T19:56:18.2678357' AS DateTime2), 6, 1196.4684786258583, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (80, 46, 76, CAST(N'2011-12-13T23:12:14.9524932' AS DateTime2), 1, 644.45754822551157, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (81, 43, 25, CAST(N'1996-12-26T04:00:39.4429900' AS DateTime2), 3, 1269.9146258039002, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (82, 76, 82, CAST(N'2013-08-22T17:36:24.8090333' AS DateTime2), 2, 254.18320123766696, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (83, 83, 96, CAST(N'2017-09-10T00:47:36.1763419' AS DateTime2), 3, 1822.2727607108061, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (84, 48, 34, CAST(N'1999-10-04T19:20:22.5867089' AS DateTime2), 7, 96.813096709928047, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (85, 25, 38, CAST(N'2000-12-12T01:26:17.0834485' AS DateTime2), 3, 1998.2710629693563, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (86, 47, 99, CAST(N'2018-06-09T16:20:57.5776628' AS DateTime2), 2, 287.50737769878816, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (87, 49, 71, CAST(N'2010-06-17T11:03:47.6437379' AS DateTime2), 1, 1264.4992225172459, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (88, 65, 84, CAST(N'2014-02-19T01:57:11.8750786' AS DateTime2), 2, 871.04805599481233, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (89, 17, 12, CAST(N'1993-05-14T12:31:13.1031985' AS DateTime2), 5, 932.8185165919449, 1)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (90, 12, 55, CAST(N'2005-12-10T23:29:21.8970341' AS DateTime2), 3, 811.24883369135148, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (91, 78, 29, CAST(N'1998-03-31T23:55:56.3063307' AS DateTime2), 4, 893.08664709939, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (92, 56, 44, CAST(N'2002-06-27T16:11:40.4646915' AS DateTime2), 7, 946.40713229142455, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (93, 68, 8, CAST(N'1992-02-18T19:03:05.4094332' AS DateTime2), 3, 1882.8206937214457, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (94, 67, 85, CAST(N'2014-06-21T12:01:12.1975364' AS DateTime2), 6, 235.95719236692284, 2)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (95, 72, 5, CAST(N'1991-03-17T05:26:27.9995765' AS DateTime2), 3, 1868.4512851147219, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (96, 39, 2, CAST(N'1990-07-10T19:16:12.8664378' AS DateTime2), 2, 279.04231393665185, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (97, 31, 63, CAST(N'2008-01-21T07:29:56.7317543' AS DateTime2), 4, 1035.8574777077222, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (98, 100, 53, CAST(N'2005-02-11T01:01:47.1155208' AS DateTime2), 6, 27.244232607653473, 3)
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (99, 57, 25, CAST(N'1997-03-25T04:44:36.6037826' AS DateTime2), 7, 44.211237711930295, 3)
GO
INSERT [dbo].[Fine] ([FineId], [TicketCollectorId], [PassengerId], [WritingDate], [FineTypeId], [FineAmountWithInterests], [PaymentStatusId]) VALUES (100, 95, 28, CAST(N'1997-11-05T14:32:45.2333935' AS DateTime2), 1, 325.49076356249429, 2)
SET IDENTITY_INSERT [dbo].[Fine] OFF
SET IDENTITY_INSERT [dbo].[Passenger] ON 

INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (1, N'Malcolm
', N'Alfred', N'588090205', 1, N'DG97922', N'Holland', N'Richmond', N'3 Rocky Blvd.', 243, 67, N'Thailand', N'Haiti', N'Dayton', CAST(N'1972-09-29' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (2, N'Rebekah
', N'Carmen', N'486157899', 2, N'ZB65850', N'Mercer', N'Anchorage', N'50 Drive', 87, 117, N'Iraq', N'Chile', N'Miami', CAST(N'1988-07-22' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (3, N'Jessica
', N'Sheri', N'454093661', 3, N'SM81220', N'Stephens', N'Corpus Christi', N'94 White Avenue', 13, 149, N'Norway', N'Burkina Faso', N'Yonkers', CAST(N'1978-03-26' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (4, N'Zachary
', N'Shannon', N'664134909', 4, N'GU14584', N'Sheppard', N'Rochester', N'13 Rocky Avenue', 29, 62, N'Uzbekistan', N'Qatar', N'Tacoma', CAST(N'1960-07-25' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (5, N'Phillip
', N'Robyn', N'975669204', 5, N'IJ34976', N'Murphy', N'Grand Rapids', N'55 South Rocky St.', 220, 37, N'Germany', N'Belarus', N'Mesa', CAST(N'1999-07-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (6, N'Rachel
', N'Hollie', N'815329370', 6, N'PG64769', N'Rocha', N'Omaha', N'5 South Blvd.', 72, 23, N'Bhutan', N'Swaziland', N'Baton Rouge', CAST(N'1981-07-04' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (7, N'Krystal
', N'Robyn', N'358688348', 7, N'VG96790', N'Decker', N'Lincoln', N'43 Avenue', 213, 32, N'Seychelles', N'Australia', N'Buffalo', CAST(N'1997-08-23' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (8, N'Kristian
', N'Joey', N'770036984', 8, N'RV67172', N'Torres', N'Fort Worth', N'6 White Avenue', 84, 157, N'Martinique', N'Senegal', N'Oklahoma', CAST(N'1990-01-11' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (9, N'Shanna
', N'Nathaniel', N'052904109', 9, N'YI90586', N'Shannon', N'Buffalo', N'32 Boulevard', 226, 176, N'Germany', N'Botswana', N'Nashville', CAST(N'1970-05-22' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (10, N'Ralph
', N'Pablo', N'029253997', 10, N'QO95470', N'Patterson', N'Dallas', N'6 Rocky Blvd.', 244, 37, N'Uruguay', N'Turkey', N'Oklahoma', CAST(N'1983-10-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (11, N'Donna
', N'Jared', N'572240140', 11, N'AJ33441', N'Powers', N'Cincinnati', N'21 Rocky Street', 279, 133, N'Yemen', N'Burkina Faso', N'Lubbock', CAST(N'1981-09-22' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (12, N'Rhonda
', N'Orlando', N'042967385', 12, N'VY19107', N'Barber', N'Birmingham', N'80 Green Avenue', 52, 191, N'Fiji', N'Luxembourg', N'Oklahoma', CAST(N'1956-06-30' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (13, N'Darla
', N'Jose', N'725505875', 13, N'TV50993', N'Hatfield', N'Anaheim', N'2 Parkway', 291, 132, N'Hungary', N'Anguilla', N'Aurora', CAST(N'1972-01-14' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (14, N'Marlon
', N'Brent', N'601643395', 14, N'CT09707', N'Frank', N'Aurora', N'1 North Way', 227, 56, N'Australia', N'Ghana', N'Grand Rapids', CAST(N'1969-10-09' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (15, N'Tammi
', N'Julia', N'260235996', 15, N'ZO55960', N'Olsen', N'Arlington', N'2 Drive', 118, 19, N'Andorra', N'Liberia', N'Washington', CAST(N'1994-12-04' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (16, N'Damion
', N'Andy', N'013203262', 16, N'IN18889', N'Good', N'Detroit', N'5 West Blvd.', 94, 188, N'Aruba', N'Comoros', N'Lincoln', CAST(N'1973-05-16' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (17, N'Jacob
', N'Damion', N'249099365', 17, N'AM74093', N'Carey', N'Sacramento', N'69 South Rocky Street', 77, 136, N'New Zealand', N'Macao', N'Spokane', CAST(N'1969-10-31' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (18, N'Edwin
', N'Eric', N'332511222', 18, N'NT70220', N'Spears', N'Fort Worth', N'19 White Drive', 158, 29, N'Tanzania', N'Hong Kong', N'New York', CAST(N'1982-04-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (19, N'Keith
', N'Christina', N'680795785', 19, N'TE28926', N'Espinoza', N'San Jose', N'2 West Boulevard', 49, 38, N'Libya', N'Egypt', N'Austin', CAST(N'1966-12-25' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (20, N'Chadwick
', N'Tyler', N'067678693', 20, N'WX52940', N'Dickerson', N'Omaha', N'95 West Rocky St.', 79, 130, N'Malaysia', N'Israel', N'Lincoln', CAST(N'1962-04-23' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (21, N'Gena
', N'Karla', N'234337871', 21, N'QH86151', N'Copeland', N'Richmond', N'2 West Green Avenue', 7, 32, N'Djibouti', N'Isle of Man', N'Tampa', CAST(N'1985-04-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (22, N'Greg
', N'Kendall', N'104724311', 22, N'SO38760', N'Villegas', N'Albuquerque', N'46 Way', 264, 25, N'Burundi', N'Mozambique', N'Montgomery', CAST(N'1957-11-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (23, N'Shelby
', N'Jackie', N'240326558', 23, N'XU24820', N'Cowan', N'Seattle', N'8 Road', 166, 145, N'South Georgia', N'Austria', N'Cleveland', CAST(N'1971-09-02' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (24, N'Derrick
', N'Frankie', N'428922363', 24, N'MA02006', N'Case', N'Dayton', N'4 Green Avenue', 177, 188, N'Mauritania', N'Netherlands', N'Fort Wayne', CAST(N'1968-10-26' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (25, N'Jenna
', N'Taryn', N'697500204', 25, N'BW16665', N'Thomas', N'Fresno', N'97 Blvd.', 200, 153, N'Liechtenstein', N'Vanuatu', N'San Diego', CAST(N'1960-04-23' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (26, N'Lindsay
', N'Karen', N'458907211', 26, N'KM18115', N'Beck', N'Tampa', N'6 East Drive', 254, 98, N'Luxembourg', N'San Marino', N'Sacramento', CAST(N'1955-11-08' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (27, N'Rex
', N'Margarita', N'129758154', 27, N'OI26560', N'Mc Guire', N'Stockton', N'37 White Way', 139, 65, N'Saudi Arabia', N'Argentina', N'Garland', CAST(N'1988-09-07' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (28, N'Margarita
', N'Charlene', N'077862753', 28, N'VQ33295', N'Morgan', N'Columbus', N'76 White Boulevard', 120, 4, N'Canada', N'Eritrea', N'Greensboro', CAST(N'1976-05-20' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (29, N'Lydia
', N'Dallas', N'441499488', 29, N'HT96878', N'Clay', N'Des Moines', N'24 Rocky Road', 105, 125, N'Austria', N'Colombia', N'Cincinnati', CAST(N'1987-04-18' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (30, N'Roderick
', N'Luis', N'025704090', 30, N'MI39684', N'Levine', N'Minneapolis', N'7 Rocky Blvd.', 9, 167, N'Uzbekistan', N'Jersey', N'Nashville', CAST(N'1955-08-18' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (31, N'Ray
', N'Christine', N'865427792', 31, N'YT94658', N'Martinez', N'Sacramento', N'3 Parkway', 47, 106, N'Swaziland', N'Estonia', N'Norfolk', CAST(N'1953-01-30' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (32, N'Eugene
', N'Oscar', N'077927048', 32, N'TA71298', N'Orozco', N'Jersey', N'4 Blvd.', 63, 95, N'Albania', N'Afghanistan', N'Denver', CAST(N'1977-10-08' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (33, N'Dion
', N'Maurice', N'327098107', 33, N'DP95892', N'Kim', N'Oklahoma', N'4 Green St.', 28, 99, N'Bolivia', N'Gabon', N'Anchorage', CAST(N'1957-09-29' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (34, N'Yesenia
', N'Darla', NULL, 34, N'AM65880', N'Donaldson', N'Anaheim', N'21 Rocky Freeway', 194, 134, N'Andorra', N'Poland', N'Stockton', CAST(N'1989-02-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (35, N'Jeanette
', N'Kim', N'274137871', 35, N'BH44899', N'Beasley', N'Louisville', N'7 Rocky Avenue', 87, 128, N'Israel', N'Greenland', N'Jersey', CAST(N'1954-07-15' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (36, N'Latasha
', N'Colin', N'146032454', 36, N'LR84087', N'Diaz', N'Toledo', N'13 Rocky Blvd.', 175, 125, N'France', N'Philippines', N'Raleigh', CAST(N'1990-07-03' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (37, N'Randolph
', N'Trisha', N'351385954', 37, N'RY30295', N'Tanner', N'Baton Rouge', N'95 Parkway', 118, 44, N'Somalia', N'Taiwan', N'Anchorage', CAST(N'1978-01-02' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (38, N'Marlon
', N'Maurice', N'572053265', 38, N'FE28148', N'Crawford', N'Jersey', N'3 Avenue', 14, 146, N'Martinique', N'Belarus', N'Shreveport', CAST(N'1974-04-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (39, N'Bryant
', N'Jorge', N'832748677', 39, N'NR80504', N'Stone', N'Anchorage', N'8 Green Blvd.', 12, 42, N'American Samoa', N'Malvinas', N'Aurora', CAST(N'1995-01-06' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (40, N'Lorraine
', N'Alana', N'355396612', 40, N'OE57702', N'Howell', N'Nashville', N'13 Boulevard', 116, 191, N'Belarus', N'Barbados', N'St. Petersburg', CAST(N'1963-06-20' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (41, N'Mario
', N'Gloria', N'732754254', 41, N'PS95857', N'Ramirez', N'Spokane', N'3 North Street', 140, 47, N'Tajikistan', N'Samoa', N'Mesa', CAST(N'1967-04-14' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (42, N'Latonya
', N'Malcolm', N'070959349', 42, N'HF03553', N'Oliver', N'Los Angeles', N'24 Freeway', 173, 171, N'Netherlands', N'Indonesia', N'Riverside', CAST(N'1998-04-04' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (43, N'Sam
', N'Victoria', N'927819180', 43, N'QV62573', N'Bond', N'San Diego', N'4 West Road', 60, 155, N'Kiribati', N'Tunisia', N'Omaha', CAST(N'1955-10-06' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (44, N'Anna
', N'Perry', N'714874051', 44, N'GQ72608', N'Allen', N'Chicago', N'4 Road', 76, 73, N'Montenegro', N'Monaco', N'Anchorage', CAST(N'1991-05-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (45, N'Susana
', N'Meredith', N'602665568', 45, N'IO33277', N'Powers', N'Aurora', N'96 St.', 233, 61, N'United Kingdom', N'Guernsey', N'Greensboro', CAST(N'1972-05-18' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (46, N'Casey
', N'Frances', N'312285546', 46, N'SN50373', N'Leon', N'San Francisco', N'10 North Road', 271, 157, N'Tanzania', N'Mali', N'Minneapolis', CAST(N'1967-04-12' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (47, N'Sherry
', N'Curtis', N'334638312', 47, N'DZ62152', N'Copeland', N'Oklahoma', N'19 Green Avenue', 292, 63, N'Estonia', N'Zambia', N'Tucson', CAST(N'1984-08-23' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (48, N'Annette
', N'Jake', N'873838011', 48, N'JP19531', N'Vargas', N'Fort Worth', N'14 East Street', 94, 66, N'Gabon', N'Guernsey', N'Virginia Beach', CAST(N'1971-04-05' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (49, N'Bradford
', N'Erika', N'440145919', 49, N'YI68420', N'Padilla', N'Omaha', N'4 Freeway', 204, 156, N'Spain', N'Vietnam', N'Detroit', CAST(N'1960-10-31' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (50, N'Harvey
', N'Billie', N'869572563', 50, N'PT19829', N'Tyler', N'Little Rock', N'9 Avenue', 65, 70, N'Burkina Faso', N'Mozambique', N'Stockton', CAST(N'1994-03-06' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (51, N'Dwight
', N'Ruby', N'134706839', 51, N'RR97014', N'Charles', N'Jersey', N'33 White Blvd.', 272, NULL, N'China', N'El Salvador', N'Virginia Beach', CAST(N'1975-11-22' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (52, N'Candy
', N'Beverly', N'443018331', 52, N'HP21858', N'Kemp', N'Rochester', N'45 Blvd.', 171, 5, N'Uzbekistan', N'Turkey', N'Virginia Beach', CAST(N'1991-08-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (53, N'Clyde
', N'Darla', N'921022871', 53, N'XM03129', N'Herrera', N'San Jose', N'54 White Road', 167, 4, N'Slovakia', N'Qatar', N'Miami', CAST(N'1961-11-28' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (54, N'Lisa
', N'Dena', N'248430030', 54, N'OG18067', N'Larsen', N'Oakland', N'90 Road', 240, 57, N'Monaco', N'Iran', N'Arlington', CAST(N'1991-06-17' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (55, N'Maggie
', N'Joshua', N'661074383', 55, N'MY45429', N'Travis', N'Boston', N'4 Parkway', 179, 1, N'Vanuatu', N'Costa Rica', N'Oakland', CAST(N'1981-01-07' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (56, N'Jayson
', N'Sarah', N'924579135', 56, N'HI65173', N'Klein', N'Virginia Beach', N'23 Freeway', 280, 160, N'Romania', N'Saint Helena', N'Houston', CAST(N'1967-11-09' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (57, N'Clyde
', N'Kellie', N'711960686', 57, N'TQ16855', N'Mayo', N'Omaha', N'71 East Green Boulevard', 222, 42, N'Moldova', N'Bermuda', N'New Orleans', CAST(N'1969-11-20' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (58, N'Rickey
', N'Jodi', N'793213113', 58, N'PD56430', N'Le', N'Raleigh', N'2 Rocky Road', 136, 173, N'Bolivia', N'Liechtenstein', N'Hialeah', CAST(N'1962-05-31' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (59, N'Jeff
', N'Erica', N'993200926', 59, N'NM67470', N'Woodward', N'Boston', N'4 Freeway', 129, 161, NULL, N'San Marino', N'Dayton', CAST(N'1953-04-03' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (60, N'Jon
', N'Pablo', NULL, 60, N'XX44468', N'Morse', N'Austin', N'2 South Rocky Road', 267, 109, N'Jordan', N'Germany', N'Baltimore', CAST(N'1996-09-15' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (61, N'Blake
', N'Carla', N'868105423', 61, N'FI68926', N'Schultz', N'Raleigh', N'7 Rocky Parkway', 233, 140, N'Singapore', N'Somalia', N'Grand Rapids', CAST(N'1992-10-27' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (62, N'Demond
', N'Grace', N'741219813', 62, N'ST13522', N'Lloyd', N'St. Petersburg', N'7 Green Parkway', 94, 159, N'Greenland', N'Seychelles', N'Norfolk', CAST(N'1974-04-05' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (63, N'Glenn
', N'Candace', N'800798788', 63, N'KC84626', N'Bowen', N'Omaha', N'2 Avenue', 280, 28, N'Nepal', N'Morocco', N'Grand Rapids', CAST(N'1955-09-27' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (64, N'Sandra
', N'Jeanette', N'132220111', 64, N'OD29731', N'Glass', N'Phoenix', N'18 Avenue', 217, 32, N'Libya', N'Norway', N'Arlington', CAST(N'1967-10-05' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (65, N'Drew
', N'Drew', N'898694711', 65, N'QW04159', N'Ortiz', N'St. Petersburg', N'29 Parkway', 197, 9, N'Guinea', N'Nicaragua', N'St. Petersburg', CAST(N'1983-09-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (66, N'Clinton
', N'Roy', N'178168602', 66, N'WT01252', N'Heath', N'Shreveport', N'62 Avenue', 216, 132, N'Belarus', N'Burkina Faso', N'Birmingham', CAST(N'1956-12-16' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (67, N'Lori
', N'Faith', N'853654199', 67, N'EH53126', N'Fowler', N'Long Beach', N'25 Parkway', 25, 39, N'Western Sahara', N'Cyprus', NULL, CAST(N'1998-10-03' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (68, N'Michelle
', N'Mitchell', N'770758147', 68, N'EL07186', N'Cook', N'Arlington', N'20 South St.', 98, 92, N'Cape Verde', N'Germany', N'Anaheim', CAST(N'1982-11-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (69, N'Johnathan
', N'Chanda', N'057743416', 69, N'IJ73444', N'Frost', N'Indianapolis', N'62 Boulevard', 141, 198, N'Guyana', N'Western Sahara', N'Fremont', CAST(N'1968-03-27' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (70, N'Susana
', N'Joe', N'419873510', 70, N'CM47792', N'Mejia', N'Toledo', N'7 White Parkway', 244, 128, N'Nauru', N'Saudi Arabia', N'Jacksonville', CAST(N'1957-06-04' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (71, N'Tyler
', N'Ethan', N'382024715', 71, N'VB48764', N'Weber', N'Tucson', N'7 Street', 277, 94, N'Puerto Rico', N'Georgia', N'Tulsa', CAST(N'1995-05-15' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (72, N'Peter
', N'Samantha', N'622722752', 72, N'LW41582', N'Newton', N'Baton Rouge', N'18 Parkway', 64, 144, N'Dominica', N'Israel', N'San Jose', CAST(N'1995-07-10' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (73, N'Bradford
', N'Anna', N'903466710', 73, N'DK41921', N'Boyer', N'Louisville', N'3 Parkway', 146, 190, N'Belgium', N'South Korea', N'Milwaukee', CAST(N'1987-04-20' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (74, N'Maribel
', N'Edwin', N'303211374', 74, N'NR10520', N'Alexander', N'Montgomery', N'34 St.', 234, 187, N'Switzerland', N'Canada', N'Fort Worth', CAST(N'1956-07-07' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (75, N'Cheryl
', N'Sherrie', N'535882816', 75, N'XX91999', N'Davenport', N'Tampa', N'6 Rocky Way', 239, 48, N'Indonesia', N'Nicaragua', N'Arlington', CAST(N'1995-01-11' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (76, N'Carrie
', N'Brooke', N'509853573', 76, N'XR46588', N'Becker', N'Stockton', N'89 Way', 135, 84, N'Niger', N'Algeria', N'Austin', CAST(N'1987-01-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (77, N'Leroy
', N'Gilbert', N'660346805', 77, N'XK51650', N'Gregory', N'Tucson', N'4 North Green Drive', 204, 61, N'Monaco', N'Panama', N'Lubbock', CAST(N'1955-02-16' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (78, N'Casey
', N'Deanna', N'900166446', 78, N'WI41199', N'Odom', N'Washington', N'90 Green Parkway', 91, 71, N'Norway', N'Kuwait', N'Virginia Beach', CAST(N'1980-04-14' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (79, N'Marcie
', N'Darius', N'855573046', 79, N'HE05133', N'Roman', N'Milwaukee', N'1 Way', 245, 72, N'Djibouti', N'Fiji', N'Santa Ana', CAST(N'1996-06-10' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (80, N'Paul
', N'Leah', N'663839224', 80, N'XB12274', N'Fuentes', N'Tucson', N'41 North Drive', 230, 128, N'Myanmar', N'Iraq', N'San Jose', CAST(N'1993-01-12' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (81, N'Benny
', N'Aisha', N'376554972', 81, N'RJ84020', N'Browning', N'Austin', N'4 Rocky Boulevard', 262, 197, N'Myanmar', N'Saudi Arabia', N'Las Vegas', CAST(N'1971-03-19' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (82, N'Alex
', N'Brady', N'800870156', 82, N'UM15715', N'Chen', N'Miami', N'94 Freeway', 46, 36, N'Egypt', N'Oman', N'Phoenix', CAST(N'1970-06-06' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (83, N'Juanita
', N'Lakeisha', N'543742627', 83, N'OV71716', N'Orr', N'Jersey', N'39 Road', 217, 199, N'Lebanon', N'France', N'Santa Ana', CAST(N'1968-07-20' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (84, N'Harry
', N'Krystal', N'329410909', 84, N'RS56752', N'Bradley', N'Yonkers', N'5 South St.', 40, 49, N'Gibraltar', N'Mauritius', N'Lincoln', CAST(N'1993-02-12' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (85, N'Carrie
', N'Martha', N'322795541', 85, N'PK18456', N'Dominguez', N'Stockton', N'1 Avenue', 37, 56, N'Turkey', N'Cook Islands', N'Akron', CAST(N'1979-09-28' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (86, N'Jeanne
', N'Harvey', N'866368390', 86, N'YT39761', N'Rhodes', N'Raleigh', N'85 Street', 177, 163, N'Saudi Arabia', N'Guadeloupe', N'Greensboro', CAST(N'1961-06-12' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (87, N'Summer
', N'Toni', N'869556067', 87, N'SY07705', N'Shepherd', N'St. Paul', N'70 East Street', 197, 102, N'Tonga', N'Estonia', N'Denver', CAST(N'1968-11-11' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (88, N'Felix
', N'Emma', N'006373267', 88, N'NF86215', N'Carson', N'Dayton', N'5 White Freeway', 88, 39, N'Costa Rica', N'Tanzania', N'Des Moines', CAST(N'1966-04-15' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (89, N'Benny
', N'Maurice', N'711486567', 89, N'WK41582', N'Zavala', N'Pittsburgh', N'5 West Freeway', 15, 98, N'Madagascar', N'Macedonia', N'Phoenix', CAST(N'1961-02-15' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (90, N'Stacey
', N'Darrin', N'609647261', 90, N'LJ39418', N'Sutton', N'Seattle', N'8 Green Freeway', 107, 175, N'Austria', N'Mayotte', N'Charlotte', CAST(N'1986-09-06' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (91, N'Julia
', N'Angelo', N'587427026', 91, N'JO00310', N'Kim', N'New York', N'38 East Blvd.', 254, 86, N'Oman', N'Montenegro', N'Corpus Christi', CAST(N'1973-08-13' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (92, N'Jolene
', N'Noel', N'671266557', 92, N'DD31457', N'Chambers', N'Fort Wayne', N'64 Rocky Boulevard', 282, 153, NULL, N'Haiti', N'Wichita', CAST(N'1968-08-05' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (93, N'Gerard
', N'Rickey', N'148590108', 93, N'OH61586', N'Schneider', N'Omaha', N'1 Rocky Avenue', 186, 84, N'Paraguay', N'Ghana', N'Hialeah', CAST(N'1974-01-21' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (94, N'Rachel
', N'Arlene', N'054438462', 94, N'PD26798', N'Newton', N'Minneapolis', N'14 Blvd.', 45, 37, N'Paraguay', N'Ecuador', N'Greensboro', CAST(N'1998-04-24' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (95, N'Terence
', N'Wendi', N'620459960', 95, N'MW62016', N'Davies', N'Toledo', N'48 Street', 183, 103, N'Benin', N'Ethiopia', N'Anaheim', CAST(N'1970-08-25' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (96, N'Darryl
', N'Terrence', N'179211014', 96, N'SD38166', N'Clayton', N'Fort Worth', N'3 Road', 47, 33, N'Cyprus', N'Vietnam', N'Madison', CAST(N'1993-01-09' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (97, N'Carolyn
', N'Cherie', N'504630279', 97, N'NR11415', N'Hayden', N'Mesa', N'42 North St.', 193, 19, N'Rwanda', N'Sierra Leone', N'Glendale', CAST(N'1995-07-10' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (98, N'Hilary
', N'Lindsay', N'182628449', 98, N'CW34330', N'Meza', N'Bakersfield', N'8 St.', 143, 140, N'Egypt', N'Dominica', N'Hialeah', CAST(N'1988-01-02' AS Date))
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (99, N'Luke
', N'Diane', N'040072622', 99, N'NW75541', N'Zavala', N'Virginia Beach', N'6 White Avenue', 179, 146, N'Burkina Faso', N'Ukraine', N'Toledo', CAST(N'1960-08-31' AS Date))
GO
INSERT [dbo].[Passenger] ([PassengerId], [Name], [Surname], [PESEL], [DocumentTypeId], [DocumentSeries], [FathersName], [City], [Street], [BuildingNumber], [FlatNumber], [Nationality], [BirthCountry], [BirthCity], [BirthDate]) VALUES (100, N'Rusty
', N'Jeannie', N'822046830', 100, N'ZH05023', N'Orozco', N'Little Rock', N'4 Avenue', 18, 142, N'Benin', N'Czech Republic', N'Philadelphia', CAST(N'1968-06-03' AS Date))
SET IDENTITY_INSERT [dbo].[Passenger] OFF
SET IDENTITY_INSERT [dbo].[Payroll] ON 

INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (1, 7, 17, 1267.1063501700323, 1994, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (2, 42, 17, 588.64378211490987, 2007, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (3, 29, 17, 764.97179305412419, 1992, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (4, 60, 17, 479.4750225169002, 2003, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (5, 27, 17, 1237.927424366552, 1992, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (6, 79, 17, 822.49247227911485, 1998, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (7, 41, 17, 1497.0910183606161, 1995, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (8, 57, 17, 146.11579391458807, 2007, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (9, 54, 17, 1803.8453496079171, 1990, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (10, 65, 17, 1508.657553004407, 1993, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (11, 9, 17, 598.26291380369241, 1991, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (12, 51, 17, 1696.2636018620169, 2008, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (13, 7, 17, 263.76927283768043, 2014, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (14, 70, 17, 515.02312650672309, 2013, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (15, 54, 17, 1275.982434524215, 2000, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (16, 21, 17, 150.87919689290189, 2010, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (17, 53, 17, 1564.4911320714705, 1996, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (18, 2, 17, 1743.7978143542064, 2004, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (19, 31, 17, 771.68159129642027, 2002, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (20, 20, 17, 704.81845676192017, 2012, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (21, 25, 17, 1291.0915172151715, 2013, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (22, 22, 17, 1906.5800699901674, 1995, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (23, 47, 17, 1947.1504762522648, 1994, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (24, 4, 17, 161.82173237289382, 2002, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (25, 59, 17, 1762.43565872425, 2019, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (26, 27, 17, 392.05952193218263, 2015, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (27, 80, 17, 739.38622546353668, 1996, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (28, 70, 17, 1117.6115382079088, 1995, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (29, 4, 17, 1724.4138818813553, 1994, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (30, 33, 17, 1487.3054751601562, 2006, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (31, 75, 17, 1707.7454355115749, 1996, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (32, 36, 17, 299.76740400296046, 2002, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (33, 58, 17, 1560.7518244351968, 1995, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (34, 38, 17, 900.83725140469016, 2004, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (35, 79, 17, 1667.9292980897842, 1995, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (36, 70, 17, 1653.921570467726, 2016, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (37, 1, 17, 984.47819751895884, 1999, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (38, 34, 17, 761.89537754370622, 1991, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (39, 33, 17, 1675.8466678093405, 1990, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (40, 68, 17, 760.85977757389639, 2018, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (41, 88, 17, 358.30872336323779, 2018, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (42, 46, 17, 570.632783961777, 2006, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (43, 9, 17, 1597.2830520930154, 2001, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (44, 79, 17, 251.58246338906815, 1997, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (45, 89, 17, 928.49431602679851, 2019, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (46, 56, 17, 387.59791589695863, 1992, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (47, 62, 17, 1262.5556836196015, 2019, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (48, 69, 17, 1458.5079697233196, 2012, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (49, 44, 17, 1458.7823354912839, 2014, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (50, 7, 17, 914.34417055656388, 2007, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (51, 37, 17, 1426.295989857193, 2014, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (52, 76, 17, 215.70787775130378, 2006, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (53, 35, 17, 1050.8136474764037, 1997, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (54, 78, 17, 769.33040598841876, 2007, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (55, 58, 17, 343.4135989953827, 2001, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (56, 85, 17, 1360.5262801798647, 2018, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (57, 95, 17, 641.49330586264534, 2003, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (58, 26, 17, 603.15006068123046, 2009, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (59, 2, 17, 717.03936379265008, 2004, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (60, 100, 17, 845.86790243436951, 1996, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (61, 100, 17, 83.1062468155782, 1991, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (62, 71, 17, 379.47948015270731, 1990, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (63, 54, 17, 421.70191203323282, 2003, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (64, 21, 17, 316.53987444776106, 2004, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (65, 91, 17, 1800.9121174928323, 2017, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (66, 73, 17, 298.4955098007319, 2008, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (67, 94, 17, 135.51177742682015, 2003, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (68, 70, 17, 1362.9320214329903, 2000, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (69, 92, 17, 847.09382841693878, 2007, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (70, 85, 17, 1622.0608640564888, 2004, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (71, 20, 17, 1166.400999373943, 2001, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (72, 19, 17, 802.59575452776437, 1994, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (73, 69, 17, 67.951146544865864, 2004, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (74, 63, 17, 10.821813722523773, 2003, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (75, 32, 17, 346.50973339868227, 2013, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (76, 80, 17, 720.4587332533946, 1996, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (77, 14, 17, 309.29701789715187, 2014, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (78, 69, 17, 1695.5680128631964, 2017, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (79, 16, 17, 1233.3274163460951, 2003, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (80, 4, 17, 1374.8377428272916, 2017, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (81, 66, 17, 1129.5038383125811, 2016, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (82, 11, 17, 1280.8782557402169, 2004, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (83, 27, 17, 1658.8292027166249, 2000, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (84, 98, 17, 810.06971132479134, 2006, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (85, 97, 17, 61.00948530296305, 2011, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (86, 100, 17, 1492.0375577602711, 2009, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (87, 2, 17, 1248.9537565265566, 1994, 3)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (88, 81, 17, 791.421418446778, 2007, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (89, 81, 17, 557.42365240930746, 1993, 5)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (90, 94, 17, 307.40301790991936, 1996, 6)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (91, 75, 17, 1012.4282646050808, 2002, 7)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (92, 76, 17, 381.32813683772838, 2010, 8)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (93, 33, 17, 44.856013751056054, 2007, 9)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (94, 33, 17, 829.978765374971, 2013, 10)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (95, 68, 17, 677.75353075831822, 2016, 11)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (96, 18, 17, 1978.8292432105307, 2017, 12)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (97, 92, 17, 148.93087192854418, 1993, 1)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (98, 88, 17, 1280.7431776452545, 2016, 2)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (99, 89, 17, 450.67034589623586, 2000, 3)
GO
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (100, 16, 17, 629.99880622606679, 2001, 4)
INSERT [dbo].[Payroll] ([PayrollId], [TicketCollectorId], [TotalGrossSalary], [Bonus], [Year], [Month]) VALUES (101, 7, 11, 11, 1990, 12)
SET IDENTITY_INSERT [dbo].[Payroll] OFF
SET IDENTITY_INSERT [dbo].[TicketCollector] ON 

INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (1, 10, 78, N'Vincent', N'Flowers', CAST(N'2019-05-02' AS Date), CAST(N'1981-06-16' AS Date), 12788, CAST(N'2022-11-26' AS Date), 1, N'91693050154183813965816123', 2, 2)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (2, 4, 95, N'Mandy', N'Richards', CAST(N'2021-01-13' AS Date), CAST(N'1990-09-20' AS Date), 9591, CAST(N'2021-05-03' AS Date), 2, N'29117908915609954049393828', 1, 3)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (3, 9, 77, N'Sally', N'Kaufman', CAST(N'2021-06-08' AS Date), CAST(N'1967-06-22' AS Date), 686, CAST(N'2023-03-28' AS Date), 3, N'88446083003628590736685218', 4, 4)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (4, 8, 142, N'Jo', N'Bowen', CAST(N'2021-05-03' AS Date), CAST(N'1990-06-30' AS Date), 1119, CAST(N'2020-05-07' AS Date), 4, N'82629952947952695032080309', 3, 5)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (5, 10, 54, N'Brett', N'Schultz', CAST(N'2021-11-08' AS Date), CAST(N'1960-09-28' AS Date), 61621, CAST(N'2019-05-29' AS Date), 1, N'89323869047477554387409018', 6, 6)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (6, 6, 61, N'Lawrence', N'Romero', CAST(N'2019-02-10' AS Date), CAST(N'1995-05-21' AS Date), 77564, CAST(N'2022-11-24' AS Date), 2, N'39222976262409254855552502', 5, 1)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (7, 1, 71, N'Jim', N'Cortez', CAST(N'2022-04-08' AS Date), CAST(N'1965-06-12' AS Date), 71283, CAST(N'2019-12-19' AS Date), 3, N'77930423981540029297824415', 8, 2)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (8, 1, 78, N'Mary', N'Ochoa', CAST(N'2019-02-05' AS Date), CAST(N'1977-09-23' AS Date), 2777, CAST(N'2022-03-06' AS Date), 4, N'08672979833198627230452331', 7, 3)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (9, 10, 4, N'Kerrie', N'Newman', CAST(N'2020-08-03' AS Date), CAST(N'1977-06-30' AS Date), 64487, CAST(N'2023-08-12' AS Date), 1, N'35341421430957119509829728', 10, 4)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (10, 9, 33, N'Noel', N'Benitez', CAST(N'2020-04-20' AS Date), CAST(N'1985-08-16' AS Date), 6283, CAST(N'2021-08-04' AS Date), 2, N'85624154458267719637333282', 9, 5)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (11, 10, 98, N'Zachary', N'Murray', CAST(N'2022-06-10' AS Date), CAST(N'1981-01-17' AS Date), 33345, CAST(N'2019-06-03' AS Date), 3, N'51562294580670275133211008', 12, 6)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (12, 5, 29, N'Cameron', N'Lowery', CAST(N'2021-02-16' AS Date), CAST(N'1967-09-13' AS Date), 9346, CAST(N'2024-03-31' AS Date), 4, N'14234109389596212996706714', 11, 1)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (13, 10, 99, N'Mike', N'Allen', CAST(N'2021-11-16' AS Date), CAST(N'1972-02-10' AS Date), 9401, CAST(N'2023-09-09' AS Date), 1, N'84945418935557198653699911', 14, 2)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (14, 2, 105, N'Wallace', N'Gentry', CAST(N'2020-01-16' AS Date), CAST(N'1989-09-13' AS Date), 30107, CAST(N'2023-12-06' AS Date), 2, N'30842931534418838734861815', 13, 3)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (15, 1, 118, N'Hector', N'Daniels', CAST(N'2022-07-10' AS Date), CAST(N'1980-04-11' AS Date), 28029, CAST(N'2024-11-18' AS Date), 3, N'18402427808251556414586017', 16, 4)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (16, 3, 127, N'Catherine', N'Ortiz', CAST(N'2021-11-16' AS Date), CAST(N'1969-02-19' AS Date), 96779, CAST(N'2022-07-22' AS Date), 4, N'37902792302108192948330449', 15, 5)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (17, 5, 126, N'Melvin', N'Clay', CAST(N'2019-05-24' AS Date), CAST(N'1977-05-13' AS Date), 93869, CAST(N'2021-02-26' AS Date), 1, N'52239579990656915421539316', 18, 6)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (18, 8, 59, N'Linda', N'Camacho', CAST(N'2020-01-02' AS Date), CAST(N'1993-12-01' AS Date), 49052, CAST(N'2019-08-31' AS Date), 2, N'39746253916362919239231401', 17, 1)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (19, 8, 116, N'Marshall', N'Duffy', CAST(N'2022-05-31' AS Date), CAST(N'1994-05-15' AS Date), 90720, CAST(N'2024-08-09' AS Date), 3, N'61382254925439390806952917', 20, 2)
INSERT [dbo].[TicketCollector] ([TicketCollectorId], [CompanyId], [ControlScheduleId], [Name], [Surname], [MedicalExamValidity], [BirthDate], [LicenseNumber], [TrainingValidity], [JobStatusId], [BankAccountNumber], [ColleagueTicketCollectorId], [ContractTypeId]) VALUES (20, 2, 87, N'Helen', N'Thornton', CAST(N'2021-12-10' AS Date), CAST(N'1958-10-03' AS Date), 50962, CAST(N'2024-05-19' AS Date), 4, N'79824449162410709479984069', 19, 3)
SET IDENTITY_INSERT [dbo].[TicketCollector] OFF
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (1, N'Malcolm', N'PW5WZDHK', 1, N'23577', N'oaugp.yykm@jiaxufo.yxqxkj.org', N'870741403')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (2, N'Rebekah', N'653U9GR2', 2, N'48567', N'sxgflu755@rodzgh.org', N'289094585')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (3, N'Jessica', N'15DFVCYU', 3, N'86663', N'hwpvoq313@emfyzo.org', N'312752033')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (4, N'Zachary', N'92L315EN', 4, N'84875', N'fgsp34@aabk-q.com', N'162781881')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (5, N'Phillip', N'47U742CZ', 1, N'25786', N'dfaj034@bita.bpxffj.net', N'237003341')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (6, N'Rachel', N'Z81M2XOZ', 2, N'68107', N'mbgwj.pocluww@nzuhov.net', N'758087421')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (7, N'Krystal', N'Q91TX5U8', 3, N'45976', N'bnjkter.hxhyezr@lfhesf.net', N'117296612')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (8, N'Kristian', N'733YGLMM', 4, N'50262', N'rgpkdqg.vlbvk@hoypoj.csfio-.net', N'566340316')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (9, N'Shanna', N'UU1B3WTZ', 1, N'82813', N'drjm012@jdgnmbvrx.gcvhfl.com', N'952735829')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (10, N'Ralph', N'IM0OF2WO', 2, N'25705', N'grxz34@leirno.net', N'657910551')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (11, N'test', N'test123', 1, N'456456789', N'eaabc@bcd.pl', N'786292123')
INSERT [dbo].[UserLogin] ([LoginId], [Login], [Password], [PermissionId], [PhoneNumber], [Email], [PESEL]) VALUES (12, N'test27', N'27test123', 1, N'777888999', N'2test@test.pl', N'545678909')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
SET IDENTITY_INSERT [meta].[CompanyName] ON 

INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (1, N'Snails Meat  Enterprise', N'025-22-7806', N'39711778174292')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (2, N'Shell  Poultry  S.A.', N'453-24-5185', N'78546399847310')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (3, N'Shell  Fish z.o.o.', N'787-12-3488', N'07419327174866')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (4, N'Confections Snails Inc.', N'555-22-0718', N'48734230063087')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (5, N'Cereals Cereals  S.A.', N'237-88-2779', N'36857787364146')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (6, N'Beverages Grain Inc.', N'545-23-6687', N'53329867536635')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (7, N'Produce Cereals Corp.', N'903-24-6016', N'33064800895047')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (8, N'Meat Beverages Inc.', N'414-46-8614', N'09380076757832')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (9, N'Produce Meat  Enterprise', N'798-91-3607', N'04283017234242')
INSERT [meta].[CompanyName] ([CompanyNameId], [CompanyName], [NationalBusinessRegistryNumber], [TaxNumber]) VALUES (10, N'Shell  Beverages  z.o.o.', N'549-72-4771', N'82043634445720')
SET IDENTITY_INSERT [meta].[CompanyName] OFF
SET IDENTITY_INSERT [meta].[ComplaintStatus] ON 

INSERT [meta].[ComplaintStatus] ([ComplaintStatusId], [ComplaintStatus]) VALUES (1, N'pending')
INSERT [meta].[ComplaintStatus] ([ComplaintStatusId], [ComplaintStatus]) VALUES (2, N'approved')
INSERT [meta].[ComplaintStatus] ([ComplaintStatusId], [ComplaintStatus]) VALUES (3, N'rejected')
SET IDENTITY_INSERT [meta].[ComplaintStatus] OFF
SET IDENTITY_INSERT [meta].[ContractType] ON 

INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (1, N'Full time', 8, 47, 2000)
INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (2, N'Freelancer', 0, 15, 2150)
INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (3, N'Seasonal', 16, 25, 2300)
INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (4, N'Part time', 13, 43, 2450)
INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (5, N'Temporary contract', 6, 39, 2600)
INSERT [meta].[ContractType] ([ContractTypeId], [ContractType], [Commission], [FineQuota], [BaseGrossSalary]) VALUES (6, N'Zero hour contract', 0, 45, 2750)
SET IDENTITY_INSERT [meta].[ContractType] OFF
SET IDENTITY_INSERT [meta].[DocumentType] ON 

INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (1, N'ID card')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (2, N'Driving license')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (3, N'Students card')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (4, N'Passport')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (5, N'Citzenship certificate')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (6, N'Birth certificate')
INSERT [meta].[DocumentType] ([DocumentTypeId], [DocumentType]) VALUES (7, N'Marriage certificate')
SET IDENTITY_INSERT [meta].[DocumentType] OFF
SET IDENTITY_INSERT [meta].[FineType] ON 

INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (1, N'unproper behaviour', 300)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (2, N'no ticket', 480)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (3, N'wrong area', 299)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (4, N'other', 432)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (5, N'ticket at home', 490)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (6, N'wrong ticket', 429)
INSERT [meta].[FineType] ([FineTypeId], [FineType], [FineAmount]) VALUES (7, N'ticket expired', 357)
SET IDENTITY_INSERT [meta].[FineType] OFF
SET IDENTITY_INSERT [meta].[JobStatus] ON 

INSERT [meta].[JobStatus] ([JobStatusId], [JobStatus]) VALUES (1, N'sick leave')
INSERT [meta].[JobStatus] ([JobStatusId], [JobStatus]) VALUES (2, N'vacation')
INSERT [meta].[JobStatus] ([JobStatusId], [JobStatus]) VALUES (3, N'suspended')
INSERT [meta].[JobStatus] ([JobStatusId], [JobStatus]) VALUES (4, N'working')
SET IDENTITY_INSERT [meta].[JobStatus] OFF
SET IDENTITY_INSERT [meta].[MeanOfTansport] ON 

INSERT [meta].[MeanOfTansport] ([MeanOfTransportId], [TransportName]) VALUES (1, N'Bus')
INSERT [meta].[MeanOfTansport] ([MeanOfTransportId], [TransportName]) VALUES (2, N'River boat')
INSERT [meta].[MeanOfTansport] ([MeanOfTransportId], [TransportName]) VALUES (3, N'Ropeway wagon')
INSERT [meta].[MeanOfTansport] ([MeanOfTransportId], [TransportName]) VALUES (4, N'Tram')
INSERT [meta].[MeanOfTansport] ([MeanOfTransportId], [TransportName]) VALUES (5, N'Subway')
SET IDENTITY_INSERT [meta].[MeanOfTansport] OFF
SET IDENTITY_INSERT [meta].[PaymentStatus] ON 

INSERT [meta].[PaymentStatus] ([PaymentStatusId], [PaymentStatus]) VALUES (1, N'pending')
INSERT [meta].[PaymentStatus] ([PaymentStatusId], [PaymentStatus]) VALUES (2, N'overdue')
INSERT [meta].[PaymentStatus] ([PaymentStatusId], [PaymentStatus]) VALUES (3, N'accepted')
SET IDENTITY_INSERT [meta].[PaymentStatus] OFF
SET IDENTITY_INSERT [meta].[PermissionType] ON 

INSERT [meta].[PermissionType] ([PermissionId], [PermissionType]) VALUES (1, N'OfficeWorker')
INSERT [meta].[PermissionType] ([PermissionId], [PermissionType]) VALUES (2, N'TicketController')
INSERT [meta].[PermissionType] ([PermissionId], [PermissionType]) VALUES (3, N'Admin')
INSERT [meta].[PermissionType] ([PermissionId], [PermissionType]) VALUES (4, N'Passenger')
INSERT [meta].[PermissionType] ([PermissionId], [PermissionType]) VALUES (15, N'test')
SET IDENTITY_INSERT [meta].[PermissionType] OFF
SET IDENTITY_INSERT [meta].[Region] ON 

INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (1, N'NE-CH')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (2, N'CO-KS')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (3, N'IA-JX')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (4, N'ID-DT')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (5, N'NE-OP')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (6, N'MO-KC')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (7, N'CA-AV')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (8, N'RI-XK')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (9, N'OR-RW')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (10, N'OK-ED')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (11, N'WV-VR')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (12, N'NY-CW')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (13, N'SD-YQ')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (14, N'GA-FT')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (15, N'CO-UR')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (16, N'MD-YJ')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (17, N'IA-SH')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (18, N'ID-ML')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (19, N'FL-DN')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (20, N'AZ-PY')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (21, N'NV-EN')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (22, N'MT-HS')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (23, N'SD-PF')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (24, N'NE-XR')
INSERT [meta].[Region] ([RegionId], [RegionName]) VALUES (25, N'KY-BO')
SET IDENTITY_INSERT [meta].[Region] OFF
/****** Object:  Index [PK_Accounts]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [PK_Accounts] PRIMARY KEY NONCLUSTERED 
(
	[AccountsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CompanyId]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [PK_CompanyId] PRIMARY KEY NONCLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Complaint]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Complaint] ADD  CONSTRAINT [PK_Complaint] PRIMARY KEY NONCLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ControlSchedule]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[ControlSchedule] ADD  CONSTRAINT [PK_ControlSchedule] PRIMARY KEY NONCLUSTERED 
(
	[ControlScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Fine]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Fine] ADD  CONSTRAINT [PK_Fine] PRIMARY KEY NONCLUSTERED 
(
	[FineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Passenger]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Passenger] ADD  CONSTRAINT [PK_Passenger] PRIMARY KEY NONCLUSTERED 
(
	[PassengerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Payroll]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [PK_Payroll] PRIMARY KEY NONCLUSTERED 
(
	[PayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TicketCollector]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[TicketCollector] ADD  CONSTRAINT [PK_TicketCollector] PRIMARY KEY NONCLUSTERED 
(
	[TicketCollectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_UserLogin]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [PK_UserLogin] PRIMARY KEY NONCLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CompanyName]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[CompanyName] ADD  CONSTRAINT [PK_CompanyName] PRIMARY KEY NONCLUSTERED 
(
	[CompanyNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Pk_ComplaintStatus]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[ComplaintStatus] ADD  CONSTRAINT [Pk_ComplaintStatus] PRIMARY KEY NONCLUSTERED 
(
	[ComplaintStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ContractType]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[ContractType] ADD  CONSTRAINT [PK_ContractType] PRIMARY KEY NONCLUSTERED 
(
	[ContractTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DocumentTyp]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[DocumentType] ADD  CONSTRAINT [PK_DocumentTyp] PRIMARY KEY NONCLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FineType]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[FineType] ADD  CONSTRAINT [PK_FineType] PRIMARY KEY NONCLUSTERED 
(
	[FineTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_JobStatus]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[JobStatus] ADD  CONSTRAINT [PK_JobStatus] PRIMARY KEY NONCLUSTERED 
(
	[JobStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MeanOfTansport]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[MeanOfTansport] ADD  CONSTRAINT [PK_MeanOfTansport] PRIMARY KEY NONCLUSTERED 
(
	[MeanOfTransportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PaymentStatus]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[PaymentStatus] ADD  CONSTRAINT [PK_PaymentStatus] PRIMARY KEY NONCLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PermissionType]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[PermissionType] ADD  CONSTRAINT [PK_PermissionType] PRIMARY KEY NONCLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Region]    Script Date: 20.12.2018 06:50:57 ******/
ALTER TABLE [meta].[Region] ADD  CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [FK_Accounts_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Company]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [FK_Company_CompanyName] FOREIGN KEY([CompanyNameId])
REFERENCES [meta].[CompanyName] ([CompanyNameId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyName]
GO
ALTER TABLE [dbo].[Complaint]  WITH NOCHECK ADD  CONSTRAINT [FK_Complaint_ComplaintStatus] FOREIGN KEY([ComplaintStatusId])
REFERENCES [meta].[ComplaintStatus] ([ComplaintStatusId])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_ComplaintStatus]
GO
ALTER TABLE [dbo].[Complaint]  WITH NOCHECK ADD  CONSTRAINT [FK_Complaint_Passenger] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[Passenger] ([PassengerId])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_Passenger]
GO
ALTER TABLE [dbo].[Complaint]  WITH NOCHECK ADD  CONSTRAINT [FK_Complaint_TicketCollector] FOREIGN KEY([TicketCollectorId])
REFERENCES [dbo].[TicketCollector] ([TicketCollectorId])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_TicketCollector]
GO
ALTER TABLE [dbo].[ControlSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_ControlSchedule_MeanOfTransport] FOREIGN KEY([MeanOfTransportId])
REFERENCES [meta].[MeanOfTansport] ([MeanOfTransportId])
GO
ALTER TABLE [dbo].[ControlSchedule] CHECK CONSTRAINT [FK_ControlSchedule_MeanOfTransport]
GO
ALTER TABLE [dbo].[ControlSchedule]  WITH NOCHECK ADD  CONSTRAINT [FK_ControlSchedule_Region] FOREIGN KEY([RegionId])
REFERENCES [meta].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[ControlSchedule] CHECK CONSTRAINT [FK_ControlSchedule_Region]
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_FineType] FOREIGN KEY([FineTypeId])
REFERENCES [meta].[FineType] ([FineTypeId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_FineType]
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_Passenger] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[Passenger] ([PassengerId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Passenger]
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [meta].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_PaymentStatus]
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_TicketCollector] FOREIGN KEY([TicketCollectorId])
REFERENCES [dbo].[TicketCollector] ([TicketCollectorId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_TicketCollector]
GO
ALTER TABLE [dbo].[Passenger]  WITH NOCHECK ADD  CONSTRAINT [FK_Passenger_DocumentType] FOREIGN KEY([DocumentTypeId])
REFERENCES [meta].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_DocumentType]
GO
ALTER TABLE [dbo].[Payroll]  WITH NOCHECK ADD  CONSTRAINT [FK_Payroll_TicketCollector] FOREIGN KEY([TicketCollectorId])
REFERENCES [dbo].[TicketCollector] ([TicketCollectorId])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_TicketCollector]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH NOCHECK ADD  CONSTRAINT [FK_TicketColl_ContractType] FOREIGN KEY([ContractTypeId])
REFERENCES [meta].[ContractType] ([ContractTypeId])
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [FK_TicketColl_ContractType]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH NOCHECK ADD  CONSTRAINT [FK_TicketCollector_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [FK_TicketCollector_Company]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH NOCHECK ADD  CONSTRAINT [FK_TicketCollector_ControlSchedule] FOREIGN KEY([ControlScheduleId])
REFERENCES [dbo].[ControlSchedule] ([ControlScheduleId])
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [FK_TicketCollector_ControlSchedule]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH NOCHECK ADD  CONSTRAINT [FK_TicketCollector_JobStatus] FOREIGN KEY([JobStatusId])
REFERENCES [meta].[JobStatus] ([JobStatusId])
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [FK_TicketCollector_JobStatus]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH NOCHECK ADD  CONSTRAINT [FK_TicketCollector_TicketCollector] FOREIGN KEY([ColleagueTicketCollectorId])
REFERENCES [dbo].[TicketCollector] ([TicketCollectorId])
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [FK_TicketCollector_TicketCollector]
GO
ALTER TABLE [dbo].[UserLogin]  WITH NOCHECK ADD  CONSTRAINT [FK_UserLogin_PermissionType] FOREIGN KEY([PermissionId])
REFERENCES [meta].[PermissionType] ([PermissionId])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_PermissionType]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [CHK_Accounts_month] CHECK  (([Month]>=(1) AND [Month]<=(12)))
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [CHK_Accounts_month]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [CHK_Accounts_year] CHECK  (([Year]>(1950) AND [Year]<(2020)))
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [CHK_Accounts_year]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CHK_Company] CHECK  (([BuildingNumber]>=(1) AND [BuildingNumber]<=(300)))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CHK_Company]
GO
ALTER TABLE [dbo].[ControlSchedule]  WITH CHECK ADD  CONSTRAINT [CHK_ControlSchedule] CHECK  (([Month]>=(1) AND [Month]<=(12)))
GO
ALTER TABLE [dbo].[ControlSchedule] CHECK CONSTRAINT [CHK_ControlSchedule]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [CHK_Passenger_birth] CHECK  (([BirthDate]>'1900-01-01' AND [BirthDate]<'2000-01-01'))
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [CHK_Passenger_birth]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [CHK_Passenger_building] CHECK  (([BuildingNumber]>=(1) AND [BuildingNumber]<=(300)))
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [CHK_Passenger_building]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [CHK_Payroll_month] CHECK  (([Month]>=(1) AND [Month]<=(12)))
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [CHK_Payroll_month]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [CHK_Payroll_year] CHECK  (([Year]>(1950) AND [Year]<(2020)))
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [CHK_Payroll_year]
GO
ALTER TABLE [dbo].[TicketCollector]  WITH CHECK ADD  CONSTRAINT [CHK_TicketCollector] CHECK  (([BirthDate]>'1900-01-01' AND [BirthDate]<'2000-01-01'))
GO
ALTER TABLE [dbo].[TicketCollector] CHECK CONSTRAINT [CHK_TicketCollector]
GO
ALTER TABLE [meta].[ContractType]  WITH CHECK ADD  CONSTRAINT [CHK_ContractType_commision] CHECK  (([Commission]>=(0) AND [Commission]<=(100)))
GO
ALTER TABLE [meta].[ContractType] CHECK CONSTRAINT [CHK_ContractType_commision]
GO
ALTER TABLE [meta].[ContractType]  WITH CHECK ADD  CONSTRAINT [CHK_ContractType_quota] CHECK  (([FineQuota]>=(10) AND [FineQuota]<=(100)))
GO
ALTER TABLE [meta].[ContractType] CHECK CONSTRAINT [CHK_ContractType_quota]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'#1 - successfull
#2 - pending
#3 - rejected' , @level0type=N'SCHEMA',@level0name=N'meta', @level1type=N'TABLE',@level1name=N'ComplaintStatus', @level2type=N'COLUMN',@level2name=N'ComplaintStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'#1 - working
#2 - vacation
#3 - suspended
' , @level0type=N'SCHEMA',@level0name=N'meta', @level1type=N'TABLE',@level1name=N'JobStatus', @level2type=N'COLUMN',@level2name=N'JobStatus'
GO
USE [master]
GO
ALTER DATABASE [bd2] SET  READ_WRITE 
GO
