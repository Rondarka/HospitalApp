USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 27.03.2022 21:31:29 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Код врача] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Паспорт] [bigint] NOT NULL,
	[Специальность] [nvarchar](50) NOT NULL,
	[Номер участка] [int] NOT NULL,
 CONSTRAINT [PK_Врач] PRIMARY KEY CLUSTERED 
(
	[Код врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Номер карты] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
	[СНИЛС] [nvarchar](50) NOT NULL,
	[Полис] [bigint] NOT NULL,
	[Номер участка] [int] NOT NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[Номер карты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reception]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reception](
	[Номер приема] [int] IDENTITY(1,1) NOT NULL,
	[Код врача] [int] NOT NULL,
	[Дата приема] [date] NOT NULL,
	[Время приема] [time](7) NOT NULL,
	[is active] [int] NOT NULL,
 CONSTRAINT [PK_Прием] PRIMARY KEY CLUSTERED 
(
	[Номер приема] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[Номер записи] [int] IDENTITY(1,1) NOT NULL,
	[Номер приема] [int] NOT NULL,
	[Номер карты] [int] NOT NULL,
	[Код сотрудника] [int] NOT NULL,
 CONSTRAINT [PK_Записи] PRIMARY KEY CLUSTERED 
(
	[Номер записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[Номер участка] [int] IDENTITY(1,1) NOT NULL,
	[Название участка] [nvarchar](50) NOT NULL,
	[Адрес участка] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Номер участка] PRIMARY KEY CLUSTERED 
(
	[Номер участка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 27.03.2022 21:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[Код сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](50) NOT NULL,
	[Номер участка] [int] NOT NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Код врача], [ФИО], [Дата рождения], [Адрес], [Паспорт], [Специальность], [Номер участка]) VALUES (3, N'Айдулина Айша Вахаевна', CAST(N'1963-07-12' AS Date), N'Коломна', 3421234846, N'Терапия', 1)
INSERT [dbo].[Doctor] ([Код врача], [ФИО], [Дата рождения], [Адрес], [Паспорт], [Специальность], [Номер участка]) VALUES (6, N'Тамбовцев Виктор Петрович', CAST(N'1971-10-07' AS Date), N'Коломна', 4616283127, N'Педиатрия', 1)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Номер карты], [ФИО], [Дата рождения], [Адрес], [Телефон], [СНИЛС], [Полис], [Номер участка]) VALUES (3, N'Малышев Александр Павлович', CAST(N'1993-07-12' AS Date), N'ул. Петрозаводская д. 5 кв. 14', N'+7(916)412-51-65', N'10580681142', 8072434024419636, 1)
INSERT [dbo].[Patient] ([Номер карты], [ФИО], [Дата рождения], [Адрес], [Телефон], [СНИЛС], [Полис], [Номер участка]) VALUES (4, N'Минкова Алина Владимировна', CAST(N'1994-06-05' AS Date), N'ул. Огоньково д. 11 кв. 7', N'+7(977)264-62-19', N'98069065557', 5388015280012042, 1)
INSERT [dbo].[Patient] ([Номер карты], [ФИО], [Дата рождения], [Адрес], [Телефон], [СНИЛС], [Полис], [Номер участка]) VALUES (5, N'Водов Николай Петрович', CAST(N'1989-09-18' AS Date), N'ул. Аникино д. 15 кв. 4', N'+7(985)192-21-42', N'14460914051', 5636489498894662, 1)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Reception] ON 

INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (2, 3, CAST(N'2022-03-10' AS Date), CAST(N'11:20:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (4, 3, CAST(N'2022-03-13' AS Date), CAST(N'15:40:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (6, 3, CAST(N'2022-03-10' AS Date), CAST(N'11:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (9, 3, CAST(N'2022-03-12' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (11, 6, CAST(N'2022-03-14' AS Date), CAST(N'21:00:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (13, 3, CAST(N'2022-03-12' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (14, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:04:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (15, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:08:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (16, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:12:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (17, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:16:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (18, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (19, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:24:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (20, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:28:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (21, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:32:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (22, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:36:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (23, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (24, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:44:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (25, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:48:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (26, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:52:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (27, 6, CAST(N'2022-03-12' AS Date), CAST(N'17:56:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (28, 6, CAST(N'2022-03-12' AS Date), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (29, 3, CAST(N'2022-03-13' AS Date), CAST(N'13:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (30, 3, CAST(N'2022-03-13' AS Date), CAST(N'13:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (31, 3, CAST(N'2022-03-13' AS Date), CAST(N'13:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (32, 3, CAST(N'2022-03-13' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (33, 3, CAST(N'2022-03-13' AS Date), CAST(N'14:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (34, 3, CAST(N'2022-03-13' AS Date), CAST(N'14:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (35, 3, CAST(N'2022-03-13' AS Date), CAST(N'14:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (36, 3, CAST(N'2022-03-13' AS Date), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (37, 6, CAST(N'2022-03-13' AS Date), CAST(N'11:10:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (38, 6, CAST(N'2022-03-13' AS Date), CAST(N'11:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (39, 6, CAST(N'2022-03-13' AS Date), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (40, 6, CAST(N'2022-03-13' AS Date), CAST(N'11:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (41, 6, CAST(N'2022-03-13' AS Date), CAST(N'11:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (42, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (43, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (44, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (45, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (46, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (47, 6, CAST(N'2022-03-13' AS Date), CAST(N'12:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (48, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (49, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (50, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (51, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (52, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (53, 6, CAST(N'2022-03-13' AS Date), CAST(N'13:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (54, 6, CAST(N'2022-03-13' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (55, 3, CAST(N'2022-03-15' AS Date), CAST(N'14:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (56, 3, CAST(N'2022-03-15' AS Date), CAST(N'14:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (57, 3, CAST(N'2022-03-15' AS Date), CAST(N'14:30:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (58, 3, CAST(N'2022-03-15' AS Date), CAST(N'14:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (59, 3, CAST(N'2022-03-15' AS Date), CAST(N'14:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (60, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (61, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (62, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (63, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:30:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (64, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (65, 3, CAST(N'2022-03-15' AS Date), CAST(N'15:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (66, 3, CAST(N'2022-03-15' AS Date), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (67, 3, CAST(N'2022-03-16' AS Date), CAST(N'11:15:00' AS Time), 0)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (68, 3, CAST(N'2022-03-16' AS Date), CAST(N'11:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (69, 3, CAST(N'2022-03-16' AS Date), CAST(N'11:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (70, 3, CAST(N'2022-03-16' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (71, 3, CAST(N'2022-03-16' AS Date), CAST(N'12:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (72, 3, CAST(N'2022-03-16' AS Date), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (73, 3, CAST(N'2022-03-16' AS Date), CAST(N'12:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (74, 3, CAST(N'2022-03-16' AS Date), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (75, 3, CAST(N'2022-03-17' AS Date), CAST(N'12:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (76, 3, CAST(N'2022-03-17' AS Date), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (77, 3, CAST(N'2022-03-17' AS Date), CAST(N'12:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (78, 3, CAST(N'2022-03-17' AS Date), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (79, 3, CAST(N'2022-03-17' AS Date), CAST(N'13:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (80, 3, CAST(N'2022-03-17' AS Date), CAST(N'13:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (81, 3, CAST(N'2022-03-17' AS Date), CAST(N'13:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (82, 3, CAST(N'2022-03-17' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (83, 3, CAST(N'2022-03-18' AS Date), CAST(N'16:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (84, 3, CAST(N'2022-03-18' AS Date), CAST(N'16:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (85, 3, CAST(N'2022-03-18' AS Date), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (86, 3, CAST(N'2022-03-18' AS Date), CAST(N'17:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (87, 3, CAST(N'2022-03-18' AS Date), CAST(N'17:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (88, 3, CAST(N'2022-03-18' AS Date), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (89, 6, CAST(N'2022-03-15' AS Date), CAST(N'14:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (90, 6, CAST(N'2022-03-15' AS Date), CAST(N'14:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (91, 6, CAST(N'2022-03-15' AS Date), CAST(N'14:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (92, 6, CAST(N'2022-03-15' AS Date), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (93, 6, CAST(N'2022-03-15' AS Date), CAST(N'15:15:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (94, 6, CAST(N'2022-03-15' AS Date), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (95, 6, CAST(N'2022-03-15' AS Date), CAST(N'15:45:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (96, 6, CAST(N'2022-03-15' AS Date), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (97, 6, CAST(N'2022-03-17' AS Date), CAST(N'08:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (98, 6, CAST(N'2022-03-17' AS Date), CAST(N'08:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (99, 6, CAST(N'2022-03-17' AS Date), CAST(N'08:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (100, 6, CAST(N'2022-03-17' AS Date), CAST(N'08:40:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (101, 6, CAST(N'2022-03-17' AS Date), CAST(N'08:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (102, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (103, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:10:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (104, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:20:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (105, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:30:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (106, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:40:00' AS Time), 1)
GO
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (107, 6, CAST(N'2022-03-17' AS Date), CAST(N'09:50:00' AS Time), 1)
INSERT [dbo].[Reception] ([Номер приема], [Код врача], [Дата приема], [Время приема], [is active]) VALUES (108, 6, CAST(N'2022-03-17' AS Date), CAST(N'10:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Reception] OFF
GO
SET IDENTITY_INSERT [dbo].[Records] ON 

INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (1, 2, 3, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (2, 9, 4, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (4, 13, 5, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (5, 9, 4, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (6, 21, 3, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (7, 37, 4, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (8, 57, 3, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (9, 60, 5, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (10, 63, 4, 1)
INSERT [dbo].[Records] ([Номер записи], [Номер приема], [Номер карты], [Код сотрудника]) VALUES (11, 67, 5, 1)
SET IDENTITY_INSERT [dbo].[Records] OFF
GO
SET IDENTITY_INSERT [dbo].[Sites] ON 

INSERT [dbo].[Sites] ([Номер участка], [Название участка], [Адрес участка]) VALUES (1, N'КЦРБ', N'г. Коломна, ул. Октябрьской Революции, д. 318')
SET IDENTITY_INSERT [dbo].[Sites] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([Код сотрудника], [ФИО], [Должность], [Номер участка], [Логин], [Пароль]) VALUES (1, N'Бондарь Алексей Никитич', N'Регистратура', 1, N'regist1', N'regist1')
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Врач_Номер участка] FOREIGN KEY([Номер участка])
REFERENCES [dbo].[Sites] ([Номер участка])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Врач_Номер участка]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_Номер участка] FOREIGN KEY([Номер участка])
REFERENCES [dbo].[Sites] ([Номер участка])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Пациент_Номер участка]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Врач] FOREIGN KEY([Код врача])
REFERENCES [dbo].[Doctor] ([Код врача])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Врач]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Записи_Пациент] FOREIGN KEY([Номер карты])
REFERENCES [dbo].[Patient] ([Номер карты])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Записи_Пациент]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Записи_Прием] FOREIGN KEY([Номер приема])
REFERENCES [dbo].[Reception] ([Номер приема])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Записи_Прием]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Записи_Сотрудники] FOREIGN KEY([Код сотрудника])
REFERENCES [dbo].[Worker] ([Код сотрудника])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Записи_Сотрудники]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Номер участка] FOREIGN KEY([Номер участка])
REFERENCES [dbo].[Sites] ([Номер участка])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Сотрудники_Номер участка]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
