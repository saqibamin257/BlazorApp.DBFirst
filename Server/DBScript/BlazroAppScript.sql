USE [master]
GO
/****** Object:  Database [BlazorApp]    Script Date: 06/14/2022 3:58:51 PM ******/
CREATE DATABASE [BlazorApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlazorApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlazorApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlazorApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlazorApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlazorApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlazorApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlazorApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlazorApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlazorApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlazorApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlazorApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlazorApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlazorApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlazorApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlazorApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlazorApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlazorApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlazorApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlazorApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlazorApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlazorApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlazorApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlazorApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlazorApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlazorApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlazorApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlazorApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlazorApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlazorApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlazorApp] SET  MULTI_USER 
GO
ALTER DATABASE [BlazorApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlazorApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlazorApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlazorApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlazorApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlazorApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlazorApp] SET QUERY_STORE = OFF
GO
USE [BlazorApp]
GO
/****** Object:  Table [dbo].[login]    Script Date: 06/14/2022 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[userinformationid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login_1] PRIMARY KEY CLUSTERED 
(
	[userinformationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 06/14/2022 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[blogid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[creationDate] [date] NOT NULL,
	[postBody] [varchar](1000) NOT NULL,
	[publishedDate] [date] NULL,
	[status] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[blogid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 06/14/2022 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdetails](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[address] [nvarchar](500) NULL,
	[cellnumber] [nvarchar](50) NULL,
	[emailid] [nvarchar](50) NULL,
 CONSTRAINT [PK_userdetails] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userinformation]    Script Date: 06/14/2022 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userinformation](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([userinformationid], [username], [password]) VALUES (1, N'admin', N'admin123')
SET IDENTITY_INSERT [dbo].[login] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([blogid], [title], [creationDate], [postBody], [publishedDate], [status], [isDeleted]) VALUES (1, N'Fruit Blog', CAST(N'2022-06-11' AS Date), N'Fruits are very important in Human Life, Any fruit or 100% fruit juice counts as part of the Fruit Group. Fruits may be fresh, frozen, canned, or dried/dehydrated, and may be whole, cut-up, pureed, or cooked. At least half of the recommended amount of fruit should come from whole fruit, rather than 100% fruit juice.

How much fruit is needed daily?

The amount of fruit you need to eat depends on your age, sex, height, weight, and level of physical activity. For women, the amount can also depend on whether you are pregnant or breastfeeding. Find the right amount for you by getting your MyPlate Plan. For general recommendations by age, see the table below. 
What counts as a cup of fruit?

In general, 1 cup of fruit or 100% fruit juice, or ½ cup of dried fruit can be considered as 1 cup from the Fruit Group. The table below shows specific amounts that count as 1 cup of fruit towards your daily recommended intake.
', CAST(N'2022-06-11' AS Date), 1, 0)
INSERT [dbo].[post] ([blogid], [title], [creationDate], [postBody], [publishedDate], [status], [isDeleted]) VALUES (2, N'Animal Blogs', CAST(N'0022-06-10' AS Date), N'animal, (kingdom Animalia), any of a group of multicellular eukaryotic organisms (i.e., as distinct from bacteria, their deoxyribonucleic acid, or DNA, is contained in a membrane-bound nucleus). They are thought to have evolved independently from the unicellular eukaryotes. Animals differ from members of the two other kingdoms of multicellular eukaryotes, the plants (Plantae) and the fungi (Mycota), in fundamental variations in morphology and physiology. This is largely because animals have developed muscles and hence mobility, a characteristic that has stimulated the further development of tissues and organ systems.', CAST(N'2022-06-10' AS Date), 1, 0)
INSERT [dbo].[post] ([blogid], [title], [creationDate], [postBody], [publishedDate], [status], [isDeleted]) VALUES (4, N'Swimming Blog', CAST(N'2022-06-05' AS Date), N'Swimming is one of the most popular sports in Australia. Our nation is surrounded by water and swimming is one of our great passions.
As well as being fun, swimming is a great way to keep fit, stay healthy and make friends.

Swimming is a healthy activity that you can continue for a lifetime. It is a low-impact activity that has many physical and mental health benefits.

Swimming for recreation
Swimming is a great recreational activity for people of all ages. Recreational swimming can provide you with a low-impact workout and it''s a good way to relax and feel good.

Common swimming styles in recreational swimming are:
 1- breaststroke
 2- backstroke
 3- sidestroke
 4- freestyle.

', CAST(N'2022-06-05' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
SET IDENTITY_INSERT [dbo].[userdetails] ON 

INSERT [dbo].[userdetails] ([userid], [username], [address], [cellnumber], [emailid]) VALUES (1, N'Saqib', N'Karachi', N'3251', N'saqib@gmail.com')
INSERT [dbo].[userdetails] ([userid], [username], [address], [cellnumber], [emailid]) VALUES (2, N'Amjad', N'Liyari', N'00715', N'amjad@gmail.com')
SET IDENTITY_INSERT [dbo].[userdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[userinformation] ON 

INSERT [dbo].[userinformation] ([loginid], [userid], [password]) VALUES (1, N'admin', N'admin123')
SET IDENTITY_INSERT [dbo].[userinformation] OFF
GO
USE [master]
GO
ALTER DATABASE [BlazorApp] SET  READ_WRITE 
GO
