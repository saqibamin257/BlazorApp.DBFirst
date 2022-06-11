USE [BlazorApp]
GO
/****** Object:  Table [dbo].[post]    Script Date: 06/11/2022 1:38:27 PM ******/
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
/****** Object:  Table [dbo].[userdetails]    Script Date: 06/11/2022 1:38:27 PM ******/
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
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([blogid], [title], [creationDate], [postBody], [publishedDate], [status], [isDeleted]) VALUES (1, N'Fruit Blog', CAST(N'2022-06-11' AS Date), N'Fruits are very important in Human Life', CAST(N'2022-06-11' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
SET IDENTITY_INSERT [dbo].[userdetails] ON 

INSERT [dbo].[userdetails] ([userid], [username], [address], [cellnumber], [emailid]) VALUES (1, N'Saqib', N'Karachi', N'3251', N'saqib@gmail.com')
INSERT [dbo].[userdetails] ([userid], [username], [address], [cellnumber], [emailid]) VALUES (2, N'Amjad', N'Liyari', N'00715', N'amjad@gmail.com')
SET IDENTITY_INSERT [dbo].[userdetails] OFF
GO
