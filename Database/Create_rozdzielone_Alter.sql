USE [dev]
GO
/****** Object:  User [a]    Script Date: 17.12.2018 20:16:34 ******/
CREATE USER [a] FOR LOGIN [a] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [b]    Script Date: 17.12.2018 20:16:34 ******/
CREATE USER [b] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
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
/****** Object:  Schema [dict]    Script Date: 17.12.2018 20:16:34 ******/
CREATE SCHEMA [dict]
GO
/****** Object:  Schema [meta]    Script Date: 17.12.2018 20:16:34 ******/
CREATE SCHEMA [meta]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[Complaint]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[ControlSchedule]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[Fine]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[Passenger]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [dbo].[Payroll]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[PayrollId] [int] IDENTITY(1,1) NOT NULL,
	[TicketCollectorId] [int] NOT NULL,
	[ContractTypeId] [int] NOT NULL,
	[TotalGrossSalary] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCollector]    Script Date: 17.12.2018 20:16:34 ******/
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
	[ColleagueTicketCollectorId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [meta].[CompanyName]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [meta].[ComplaintStatus]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[ComplaintStatus](
	[ComplaintStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[ContractType]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [meta].[DocumentType]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[DocumentType](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[FineType]    Script Date: 17.12.2018 20:16:34 ******/
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
/****** Object:  Table [meta].[JobStatus]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[JobStatus](
	[JobStatusId] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[MeanOfTansport]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[MeanOfTansport](
	[MeanOfTransportId] [int] IDENTITY(1,1) NOT NULL,
	[TransportName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[PaymentStatus]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatus] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[PermissionType]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[PermissionType](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionType] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [meta].[Region]    Script Date: 17.12.2018 20:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [meta].[Region](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NOT NULL
) ON [PRIMARY]







/****** Object:  Index [PK_Accounts]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [PK_Accounts] PRIMARY KEY NONCLUSTERED 
(
	[AccountsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CompanyId]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [PK_CompanyId] PRIMARY KEY NONCLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Complaint]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Complaint] ADD  CONSTRAINT [PK_Complaint] PRIMARY KEY NONCLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ControlSchedule]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[ControlSchedule] ADD  CONSTRAINT [PK_ControlSchedule] PRIMARY KEY NONCLUSTERED 
(
	[ControlScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Fine]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Fine] ADD  CONSTRAINT [PK_Fine] PRIMARY KEY NONCLUSTERED 
(
	[FineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Passenger]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Passenger] ADD  CONSTRAINT [PK_Passenger] PRIMARY KEY NONCLUSTERED 
(
	[PassengerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Payroll]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [PK_Payroll] PRIMARY KEY NONCLUSTERED 
(
	[PayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TicketCollector]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[TicketCollector] ADD  CONSTRAINT [PK_TicketCollector] PRIMARY KEY NONCLUSTERED 
(
	[TicketCollectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_UserLogin]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [PK_UserLogin] PRIMARY KEY NONCLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CompanyName]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[CompanyName] ADD  CONSTRAINT [PK_CompanyName] PRIMARY KEY NONCLUSTERED 
(
	[CompanyNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Pk_ComplaintStatus]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[ComplaintStatus] ADD  CONSTRAINT [Pk_ComplaintStatus] PRIMARY KEY NONCLUSTERED 
(
	[ComplaintStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ContractType]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[ContractType] ADD  CONSTRAINT [PK_ContractType] PRIMARY KEY NONCLUSTERED 
(
	[ContractTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DocumentTyp]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[DocumentType] ADD  CONSTRAINT [PK_DocumentTyp] PRIMARY KEY NONCLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FineType]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[FineType] ADD  CONSTRAINT [PK_FineType] PRIMARY KEY NONCLUSTERED 
(
	[FineTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_JobStatus]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[JobStatus] ADD  CONSTRAINT [PK_JobStatus] PRIMARY KEY NONCLUSTERED 
(
	[JobStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MeanOfTansport]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[MeanOfTansport] ADD  CONSTRAINT [PK_MeanOfTansport] PRIMARY KEY NONCLUSTERED 
(
	[MeanOfTransportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PaymentStatus]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[PaymentStatus] ADD  CONSTRAINT [PK_PaymentStatus] PRIMARY KEY NONCLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PermissionType]    Script Date: 17.12.2018 20:16:36 ******/
ALTER TABLE [meta].[PermissionType] ADD  CONSTRAINT [PK_PermissionType] PRIMARY KEY NONCLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Region]    Script Date: 17.12.2018 20:16:36 ******/
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
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [meta].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_PaymentStatus]
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD  CONSTRAINT [FK_Fine_Passenger] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[Passenger] ([PassengerId])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Passenger]
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
ALTER TABLE [dbo].[Payroll]  WITH NOCHECK ADD  CONSTRAINT [FK_Payroll_ContractType] FOREIGN KEY([ContractTypeId])
REFERENCES [meta].[ContractType] ([ContractTypeId])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_ContractType]
GO
ALTER TABLE [dbo].[Payroll]  WITH NOCHECK ADD  CONSTRAINT [FK_Payroll_TicketCollector] FOREIGN KEY([TicketCollectorId])
REFERENCES [dbo].[TicketCollector] ([TicketCollectorId])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_TicketCollector]
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
