USE [SocialNetworkApp]
GO
ALTER TABLE [dbo].[Reaction] DROP CONSTRAINT [FK__Reaction__Userna__286302EC]
GO
ALTER TABLE [dbo].[Reaction] DROP CONSTRAINT [FK__Reaction__Articl__29572725]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK__Notificat__Email__398D8EEE]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK__Notificat__Artic__38996AB5]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK__Comment__Usernam__24927208]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK__Comment__Article__25869641]
GO
ALTER TABLE [dbo].[Article] DROP CONSTRAINT [FK__Article__Usernam__173876EA]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 09/28/2020 6:19:58 PM ******/
DROP TABLE [dbo].[Reaction]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 09/28/2020 6:19:58 PM ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09/28/2020 6:19:58 PM ******/
DROP TABLE [dbo].[Comment]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 09/28/2020 6:19:58 PM ******/
DROP TABLE [dbo].[Article]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 09/28/2020 6:19:58 PM ******/
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 09/28/2020 6:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [varchar](70) NOT NULL,
	[Password] [varchar](65) NOT NULL,
	[Fullname] [varchar](100) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[Status] [varchar](12) NOT NULL,
	[Image] [varchar](500) NOT NULL CONSTRAINT [Def]  DEFAULT ('https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E'),
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 09/28/2020 6:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [varchar](6) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Image] [varchar](500) NULL,
	[Date] [date] NOT NULL,
	[Username] [varchar](70) NOT NULL,
	[Status] [varchar](10) NOT NULL CONSTRAINT [yes]  DEFAULT ('active'),
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09/28/2020 6:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [varchar](10) NOT NULL,
	[Content] [varchar](1000) NOT NULL,
	[Date] [date] NOT NULL,
	[Username] [varchar](70) NOT NULL,
	[ArticleID] [varchar](6) NOT NULL,
	[Status] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 09/28/2020 6:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [varchar](10) NOT NULL,
	[Content] [varchar](200) NOT NULL,
	[notiTime] [datetime] NOT NULL,
	[Status] [varchar](7) NOT NULL DEFAULT ('Unread'),
	[ArticleID] [varchar](6) NOT NULL,
	[EmailGet] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 09/28/2020 6:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reaction](
	[ReactionID] [varchar](10) NOT NULL,
	[Status] [varchar](8) NOT NULL,
	[Date] [date] NOT NULL,
	[Username] [varchar](70) NOT NULL,
	[ArticleID] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'adminvippro123@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Nguyen Van Admin', N'admin', N'new', N'https://pm1.narvii.com/7684/22b267dabb1e175d90adcc43e8e781afe0f1a6car1-348-379v2_uhq.jpg')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'beiuleagueoflegend@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Batolomeo Kuma', N'member', N'active', N'https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'beiumegaman@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Dio Brando', N'member', N'new', N'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'canbo_deptrai_2phai@gmail.com', N'e6e70fd8a62b7398f803ffbc5486360ac6bcf12d287a2c7f636baa8c25bfaa05', N'Can Bo den tu FBI', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'dinhsonhoang@gmail.com', N'3e27af50cc4af5a0ee25f5ebfb0a0c33599d2768f4fe8a42d3cbf1ab1646ed83', N'Dinh Son Hoang', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119137631_796006967632971_5531985519109227954_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=iacFA2_iix0AX_9235K&_nc_ht=scontent.fdad3-3.fna&oh=2d0c8870d94ea6bb800eb000ee5262fb&oe=5F896627')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'hieudinh003@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Dinh Nhu Hieu', N'member', N'active', N'https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.15752-9/119485568_1181188105704979_2079054393905716953_n.jpg?_nc_cat=107&_nc_sid=b96e70&_nc_ohc=4i_Wm5tg10YAX8c-GRl&_nc_ht=scontent.fsgn5-1.fna&oh=8692b9e8ad491d14339e686285114aa9&oe=5F85CCAC')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'hoinhanh@gmail.com', N'b666833915e2c248c1323d7cca32982ea9f3c34c361b4a666588d443e0276ed9', N'Anh Mong', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119219284_356184622177962_5874665426398472444_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=cFMbXeYgyV4AX_SOexn&_nc_ht=scontent.fsgn5-2.fna&oh=60664c3397d926ea0c38db184d996862&oe=5F87653D')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'huavinhkhang@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Hua Vinh Khang', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'Huydeptrai@gmail.com', N'c8c3a52bf9e9d96b3b7367194ae33438aeae09010180d052ae06a63e7ce371dd', N'Huy dep trai vcl', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119483185_1324268751260297_2007792813609689869_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=jjbsqFiYByIAX83cWk5&_nc_ht=scontent.fdad3-3.fna&oh=9a45d803692adbb2cef5ee4397d8d121&oe=5F85EA0B')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'huydeptrai123@gmail.com', N'84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', N'Huy dep traiiii', N'member', N'new', N'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'khanghvse140097@fpt.edu.vn', N'50dae959e75dc95693a13dbf9f62c63bb8c4b92b69d0a6ecba62033bffd78336', N'Hua Vinh Khang', N'member', N'active', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119483185_1324268751260297_2007792813609689869_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=jjbsqFiYByIAX83cWk5&_nc_ht=scontent.fdad3-3.fna&oh=9a45d803692adbb2cef5ee4397d8d121&oe=5F85EA0B')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'khanghvse140097@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Hua Vinh Khang', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119219284_356184622177962_5874665426398472444_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=cFMbXeYgyV4AX_SOexn&_nc_ht=scontent.fsgn5-2.fna&oh=60664c3397d926ea0c38db184d996862&oe=5F87653D')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'khoilda@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'vaizcloz', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119219284_356184622177962_5874665426398472444_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=cFMbXeYgyV4AX_SOexn&_nc_ht=scontent.fsgn5-2.fna&oh=60664c3397d926ea0c38db184d996862&oe=5F87653D')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'khoildase140074@fpt.edu.vn', N'9af480c6730586c0e4a2c5c2b9ccc7fc5fcc7be835c67154830793837dabe2c', N'Le Dat Anh Khoi', N'member', N'new', N'https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'khoildase140074@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Le Dat Anh Khoi', N'member', N'new', N'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.15752-9/119144695_2734798146837817_3217152471037283505_n.jpg?_nc_cat=100&_nc_sid=b96e70&_nc_ohc=ElbgKSZZUw8AX-xw7Rj&_nc_ht=scontent.fsgn5-5.fna&oh=c8a74c0a63efa973c225f4716d5774e3&oe=5F85C894')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'lamhauhuong@fpt.edu.vn', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Lam Hau Huong', N'member', N'new', N'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'meomeo@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'tan thai', N'member', N'new', N'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'ngotanduc410@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Ngo Tan Duc', N'member', N'active', N'https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.15752-9/119485568_1181188105704979_2079054393905716953_n.jpg?_nc_cat=107&_nc_sid=b96e70&_nc_ohc=4i_Wm5tg10YAX8c-GRl&_nc_ht=scontent.fsgn5-1.fna&oh=8692b9e8ad491d14339e686285114aa9&oe=5F85CCAC')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'nguyenthienlong@gmail.com', N'109540a898071aaa80b63a5491a6183196e9cf27c386a8daeee75789f360a856', N'Nguyen Thien Long', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'rockettrung254@gmail.com', N'fe5445da682564e025038175c3ee141fd8ac22428f19f0260c77e1b3b25674a0', N'Nguyen Duc Trung', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'soulmarx57@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'Afghanistan', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'test123123@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumTwo', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testaccount@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumOne', N'member', N'new', N'https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum3@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumThree', N'member', N'new', N'https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum4@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumFour', N'member', N'new', N'https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum5@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumFive', N'member', N'new', N'https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.15752-9/119485568_1181188105704979_2079054393905716953_n.jpg?_nc_cat=107&_nc_sid=b96e70&_nc_ohc=4i_Wm5tg10YAX8c-GRl&_nc_ht=scontent.fsgn5-1.fna&oh=8692b9e8ad491d14339e686285114aa9&oe=5F85CCAC')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum6@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumSix', N'member', N'new', N'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.15752-9/119235307_315753942845399_1769069052757878237_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=Q86k2LdHyNwAX9g4YIC&_nc_ht=scontent.fsgn5-3.fna&oh=f369d193d77b9f62ad1b30e82ed5099c&oe=5F88DFD4')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum7@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumSeven', N'member', N'new', N'https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'testernum8@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TesterNumEight', N'member', N'new', N'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.15752-9/119235307_315753942845399_1769069052757878237_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=Q86k2LdHyNwAX9g4YIC&_nc_ht=scontent.fsgn5-3.fna&oh=f369d193d77b9f62ad1b30e82ed5099c&oe=5F88DFD4')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'trinhquochao130120@gmail.com', N'175fd6ea12a8d24bb5300ca64fea2fecdac061de32337b3342b94e7f1f4c3433', N'Tran Duc Bo', N'member', N'new', N'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'trunghung.nguyen98@gmail.com', N'b16f5aa1d82889fa93c8d26593b8d1fffdd51ddd8846dc3d175244d084695345', N'Nguyen Trung Hung', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'truongquoclap@gmail.com', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'TacoocaT', N'member', N'new', N'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.15752-9/119235307_315753942845399_1769069052757878237_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=Q86k2LdHyNwAX9g4YIC&_nc_ht=scontent.fsgn5-3.fna&oh=f369d193d77b9f62ad1b30e82ed5099c&oe=5F88DFD4')
INSERT [dbo].[Account] ([Email], [Password], [Fullname], [Role], [Status], [Image]) VALUES (N'tthinh..2128@gmail.com', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'AAAAAAAA', N'member', N'new', N'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'1', N'Buon buon di kiem quan an', N'Hom nay toi buon qua cac bac a, toi cu bi crush phu hoai, nen quyet dinh di kiem gi do an, may bac co the suggest cho toi duoc khong!', NULL, CAST(N'2020-09-17' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'10', N'About the Imposter!', N'I know that someone in us is an Imposter! Find him/her before we get killed!', N'https://i.ytimg.com/vi/F5O0HJkpzvs/sddefault.jpg', CAST(N'2020-09-19' AS Date), N'lamhauhuong@fpt.edu.vn', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'11', N'About Pokemon', N'I just got a mega Charizard X! I''m so lucky !!!!', N'https://images-na.ssl-images-amazon.com/images/I/71jovvIO44L._AC_SX425_.jpg', CAST(N'2020-09-19' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'12', N'First Upload By Phone!', N'This is my first upload by phone! I hope it will work', N'https://giphy.com/gifs/loosekeys-animation-animated-26u4cqVR8dsmedTJ6', CAST(N'2020-09-19' AS Date), N'huavinhkhang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'13', N'First Upload By Phone!', N'I will upload this article by phone, I hope it will work!', N'https://preview.pixlr.com/images/800wm/100/1/1001466400.jpg', CAST(N'2020-09-19' AS Date), N'huavinhkhang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'14', N'First Upload By Phone!', N'I will upload this article by phone, I hope it will work!', N'https://preview.pixlr.com/images/800wm/100/1/1001466400.jpg', CAST(N'2020-09-19' AS Date), N'huavinhkhang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'15', N'Reflection', N'Who is that girl I see, staring straight back at me?
Why is my reflection someone I don''t know?
I won''t pretend that I''m someone else all the time
When will my reflection show who I am inside?', N'', CAST(N'2020-09-19' AS Date), N'hoinhanh@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'16', N'About RapViet', N'Yesterday, I watched RapViet and I felt like the whole team of Karik didn''t make me disappointed. For real, especially the team of 2 members G.Ducky and Tez with the emotional vibe. Beside, I loved the 3-member team-up, too. MCK has a perfect auto-tune voice, Duy Andy with the beatbox style and the full-bass voice of Yuno Bigboy, they made the show went crazy! I hope next week team of Suboi will make the show goes boom boom!', N'https://scontent-sin6-1.xx.fbcdn.net/v/t1.15752-9/119735743_650469532337174_7674539393527898065_n.png?_nc_cat=107&_nc_sid=ae9488&_nc_ohc=UA4fwBKGaWgAX-lS6uG&_nc_ht=scontent-sin6-1.xx&oh=5a5aca2f6e6691f923a815f1d85d7d27&oe=5F8C32BF', CAST(N'2020-09-20' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'17', N'Bo Tr?n chào c? nhà, MEO MEO!!!!!', N'MÈO MÉO MEO MÈO MEOOOO!!!!!!!!!!!!!!!!', N'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Duwof7pnQf3Y&psig=AOv', CAST(N'2020-09-20' AS Date), N'trinhquochao130120@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'18', N'??!', N'???????!??????????????????~~ =)))', N'https://imgur.com/NZwVX7A', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'19', N'??!', N'??,?????!??????????????????~~ =))', N'https://i.imgur.com/NZwVX7A.jpg', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'2', N'C# Programing', N'Hello guys, I vae a problem with C#, I don''t know how to import a program. Please help me!', NULL, CAST(N'2020-09-17' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'20', N'List Of Lo-fi Songs', N'https://www.youtube.com/watch?v=MGsXCzzDqN0', N'', CAST(N'2020-09-21' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'21', N'How to come down the vent', N'Hey guys, im new here, how to use the vent like Huong-san ?', N'http://localhost:8084/J3LP00010/MainController', CAST(N'2020-09-21' AS Date), N'truongquoclap@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'22', N'a', N'a', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'23', N'a', N'a', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'24', N'1', N'1', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'25', N'a', N'a', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'26', N'2', N'3', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'27', N'About Pokemon', N'a', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'28', N'About Pokémon', N'123', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'29', N'How to master Javascript?', N'Hello!', N'', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'3', N'I lost my pet !', N'Yesterday, I took my dog for a walk. After an hour, i couldn''t see where it was!', NULL, CAST(N'2020-09-10' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'30', N'About Jojo part 6: Stone Ocean', N'I think Stone Ocean maybe the Jojo part that has a very special ending, the ending that no one can think to. I highly recommend to enjoy the Manga and i am waiting for the anime of part 6!', N'https://vignette.wikia.nocookie.net/ninjajojos-bizarre-adventure/images/5/5c/Cc00f547f2572837c42c50115e853dc2c6248ba9.jpg/revision/latest?cb=20200531201619', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'31', N'About me!', N'Kono Dio daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'https://thumbs.gfycat.com/AnchoredTornAzurewingedmagpie-small.gif', CAST(N'2020-09-24' AS Date), N'beiumegaman@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'32', N'Kono Dio Da', N'Road Roller DAAAAAAAAAAAAAAAAA', N'https://steamuserimages-a.akamaihd.net/ugc/517134120375366901/CD038CB4A8C23327235E188DB536936B22E9459E/', CAST(N'2020-09-24' AS Date), N'beiumegaman@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'33', N'hold my midle leg', N'sfsdfsd', N'', CAST(N'2020-09-24' AS Date), N'meomeo@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'34', N'My document', N'asfqwasf', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2F280x280_RS%2Fb8%2F0b%2Fa2%2Fb80ba23a34b9d2ed881e3c72fb0117fc.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fhauhuynh13102003%2F&tbnid=cLkY0AzgK3FO-M&vet=12ahUKEwjvnYfl84HsAhVMYpQKHcYoBQkQMygDegUIARCDAQ..i&docid=A3lfLwU2KuhyiM&w=280&h=280&q=boku%20no%20pico&hl=vi&client=opera-gx&ved=2ahUKEwjvnYfl84HsAhVMYpQKHcYoBQkQMygDegUIARCDAQ', CAST(N'2020-09-24' AS Date), N'meomeo@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'35', N'J4F', N'*Le me when I see a round and beautiful soul =))) ', N'https://i.ytimg.com/vi/MkmBNw1_jFw/maxresdefault.jpg', CAST(N'2020-09-24' AS Date), N'trunghung.nguyen98@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'36', N'Happy Funeral!', N'Tèo tèo téo teo teo tèo tèo tèo téo teo teo tèo', N'https://mcnewsmd1.keeng.net/netnews/archive/images/2020041716/tinngan_041209_539490760_0wap_320.jpg', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'37', N'About Rap Viet Part 2', N'Yesterday, I watched RapViet. I felt a little disappointed when Ginger has been eliminated from Suboi team. In my own opinion, Dat dope shouldn''t be kept, I don''t like his voice!', N'', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'38', N'Let''s Sleep', N'This Afternoon i feel so bruh, I want to sleep', N'', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'39', N'I want to sleep', N'My course makes me tired :( I want to sleep!', N'', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'4', N'I am going to get married', N'I am wondering what will happen after i get married, any help?', NULL, CAST(N'2020-09-18' AS Date), N'dinhsonhoang@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'40', N'One Two Three', N'4 5 6', N'', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'41', N'Test #1', N'This is the first test', N'', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'42', N'Test #2', N'This is the second test!', N'', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'43', N'Test by me', N'...', N'', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'44', N'Bo Tr?n cum back!!!!!!', N'Hello c? nhà, l?i là Bo dây', N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFze6TGFBA7JVHbSiaeexJQMQisGpFcmLGug&usqp=CAU', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'45', N'Bo Tr?n cum back!!!!!!', N'Bo dã tr? l?i!!!!!!!', N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFze6TGFBA7JVHbSiaeexJQMQisGpFcmLGug&usqp=CAU', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'46', N'C?m th?y bu?n!!!!!!', N'Bo dang hình Bo có nude hay gì dâu mà QTV xóa bài. K? này Bo ph?i lên ti?ng d? d?u tranh giành l?y công b?ng cho Bo. M?i ngu?i ?ng h? Bo nhé mèo méo meo!!!!!!!!!!!
#CatLivesMatter', N'', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'47', N'Duc dep trai', N'Dep trai vl', N'', CAST(N'2020-09-28' AS Date), N'ngotanduc410@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'48', N'Hello Guys', N'I''m new here. Yorosiku Onegaisimasu.', N'https://pbs.twimg.com/profile_images/1194381268630343686/vRWysPfd.jpg', CAST(N'2020-09-28' AS Date), N'beiuleagueoflegend@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'5', N'I am so sad today with Among Us!', N'Today, I played Among Us with my crews. For no reason, they always voted me as a Imposter although I didn''t! I need HELP!', NULL, CAST(N'2020-09-18' AS Date), N'lamhauhuong@fpt.edu.vn', N'deleted')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'6', N'How wonderful you are!', N'Yes, you are wonderful, cute and beautiful. Day by day, I feel like i have been into you more and more!', N'https://stickershop.line-scdn.net/stickershop/v1/product/1414210/LINEStorePC/main.png;compress=true', CAST(N'2020-09-18' AS Date), N'nguyenthienlong@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'7', N'Vietnamese Westside food is awesome!', N'Yesterday, I went to Long An, my hometown, I ate a lot of food. But one of my favorite is Banh Xeo. It was so good that I ate a lot!', N'https://cdn.cet.edu.vn/wp-content/uploads/2019/11/banh-xeo-mien-bac.jpg', CAST(N'2020-09-19' AS Date), N'huavinhkhang@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'8', N'Donna Donna ', N'On a wagon bound for market
There''s a calf with a mournful eye.
High above him there''s a swallow
Winging swiftly through the sky.
 
How the winds are laughing
They laugh with all their might
Laugh and laugh the whole day through
And half the summer''s night.

Donna Donna Donna Do~~na
Donna Donna Donna Do~
Donna Donna Donna Do~~na
Donna Donna Donna Do~', N'', CAST(N'2020-09-19' AS Date), N'khoildase140074@gmail.com', N'active')
INSERT [dbo].[Article] ([ArticleID], [Title], [Description], [Image], [Date], [Username], [Status]) VALUES (N'9', N'It''s the best day ever !', N'Something makes me happy!', N'https://i.pinimg.com/564x/1c/96/e5/1c96e52e1622fd7880a3b4cd61c35806.jpg', CAST(N'2020-09-19' AS Date), N'rockettrung254@gmail.com', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'1', N'Yesterday I saw a dog walking near Nguyen Van Thu Park, was that your dog?', CAST(N'2020-09-18' AS Date), N'lamhauhuong@fpt.edu.vn', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'10', N'yes', CAST(N'2020-09-21' AS Date), N'huavinhkhang@gmail.com', N'19', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'100', N'C', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'36', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'101', N'ok', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'36', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'102', N'Nice!', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'7', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'103', N'Ok', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'15', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'104', N'?', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'105', N'Gà', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'32', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'106', N'Bye :D', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'38', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'107', N'?', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'38', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'108', N'Bye', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'39', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'109', N'7 8 9', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'40', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'11', N'gud', CAST(N'2020-09-21' AS Date), N'huavinhkhang@gmail.com', N'19', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'110', N'10 11 12', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'40', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'111', N'13 14 15', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'40', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'112', N'?', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'40', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'113', N'Wryyyyyyy', CAST(N'2020-09-27' AS Date), N'beiumegaman@gmail.com', N'30', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'114', N'?', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'30', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'115', N'Hello', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'41', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'116', N'Hello', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'117', N'Nice, bro!', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'42', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'118', N'This is not a test!', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'40', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'119', N'Huy dep trai is imposter', CAST(N'2020-09-27' AS Date), N'huydeptrai123@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'12', N'yes', CAST(N'2020-09-21' AS Date), N'huavinhkhang@gmail.com', N'19', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'120', N'Vote Huy :))', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'121', N'Hé lô m?y b?n?!', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'42', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'122', N'hello Th?nh :))', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'123', N'Cmt c?a K b? xoá r :)', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'42', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'124', N'A', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'125', N'O .. :))', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'126', N'1', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'42', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'127', N'Meo Meo tang tuong tác nào!!!!!!', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'44', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'128', N'Sao chua bi ban ?', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'46', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'129', N'ALo admin', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'46', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'13', N'Vote Huong
', CAST(N'2020-09-21' AS Date), N'truongquoclap@gmail.com', N'21', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'130', N'?', CAST(N'2020-09-28' AS Date), N'khoildase140074@gmail.com', N'45', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'131', N'Hello', CAST(N'2020-09-28' AS Date), N'huavinhkhang@gmail.com', N'47', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'132', N'Yay', CAST(N'2020-09-28' AS Date), N'beiuleagueoflegend@gmail.com', N'48', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'14', N'great', CAST(N'2020-09-21' AS Date), N'truongquoclap@gmail.com', N'16', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'15', N'Hello', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'29', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'16', N'Hello
', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'17', N'Hello
', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'18', N'Hello
', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'19', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'2', N'Oh, so can you tell me where it could go? ', CAST(N'2020-09-18' AS Date), N'huavinhkhang@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'20', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'21', N'Hello
', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'22', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'13', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'23', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'13', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'24', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'13', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'25', N'Hello', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'13', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'26', N'What', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'13', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'27', N'Nice!', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'28', N'OK!', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'29', N'A', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'3', N'Maybe it could go somewhere near there? I guess', CAST(N'2020-09-20' AS Date), N'lamhauhuong@fpt.edu.vn', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'30', N'ABC', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'31', N'A', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'32', N'A', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'33', N'A', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'34', N'AB', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'35', N'Kono Dio daaaaaaaaaa!!
Roller Rola Daaaaaaaaa!!!', CAST(N'2020-09-24' AS Date), N'beiumegaman@gmail.com', N'30', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'36', N'Road Roller Daaaaaaaaaaa', CAST(N'2020-09-24' AS Date), N'beiumegaman@gmail.com', N'31', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'37', N'wtf man?
', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'33', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'38', N'i always stand by NAZI', CAST(N'2020-09-24' AS Date), N'meomeo@gmail.com', N'19', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'39', N'Wryyyyyyyyyyyyyyyyyyyyyyyy', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'32', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'4', N'I saw it in front of my door! Thank you for your help!', CAST(N'2020-09-20' AS Date), N'huavinhkhang@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'40', N'wtf bro
', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'41', N'Alo', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'32', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'42', N'A', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'43', N'what', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'44', N'is', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'45', N'up', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'46', N'hello', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'47', N'yo', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'48', N'go', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'49', N'Hello
', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'5', N'Cool!', CAST(N'2020-09-20' AS Date), N'khoildase140074@gmail.com', N'11', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'50', N'Yo', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'51', N'Hello', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'52', N'1', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'53', N'1', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'54', N'2', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'55', N'này thì bài mình ms hi?n js', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'56', N'aa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'57', N'aa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'58', N'Th?h oi, s?a trên á :)) cái du?i c?a admin :)))', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'59', N'Th?h oi, s?a trên á :)) cái du?i c?a admin :)))', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'6', N'Maybe you are the impostor! Prove yourself!', CAST(N'2020-09-20' AS Date), N'khoildase140074@gmail.com', N'10', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'60', N'aaa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'61', N'aaa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'62', N'aaa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'63', N'aaa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'64', N' :)) Th?nh th? comment bài khác nha :))', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'65', N'aaaaaa', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'66', N':)', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'67', N'a', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'68', N'b', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'69', N'a', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'7', N'Yay! It''s work!', CAST(N'2020-09-20' AS Date), N'huavinhkhang@gmail.com', N'14', N'active')
GO
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'70', N'ok', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'71', N'?', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'72', N'?
', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'73', N'ADS', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'74', N'a', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'75', N'a', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'11', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'76', N'a', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'11', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'77', N'Ua ai chet vay
', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'36', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'78', N'Tao nè', CAST(N'2020-09-26' AS Date), N'khoildase140074@gmail.com', N'36', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'79', N'Chao anh, toi dung day tu chieu
', CAST(N'2020-09-26' AS Date), N'canbo_deptrai_2phai@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'8', N'Ok, that''s nice!', CAST(N'2020-09-21' AS Date), N'lamhauhuong@fpt.edu.vn', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'80', N'Anh bi bat vi anh la niBBa 
', CAST(N'2020-09-26' AS Date), N'canbo_deptrai_2phai@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'81', N'Moi anh len giuong gap toi chieu nay', CAST(N'2020-09-26' AS Date), N'canbo_deptrai_2phai@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'82', N'????????????', CAST(N'2020-09-26' AS Date), N'canbo_deptrai_2phai@gmail.com', N'8', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'83', N'Cool ', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'84', N'Yes', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'85', N'hihi', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'86', N'Wow', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'87', N'Congrat, Bro!', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'88', N'OK', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'89', N'Yay', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'9', N'gud', CAST(N'2020-09-21' AS Date), N'huavinhkhang@gmail.com', N'19', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'90', N'So great!', CAST(N'2020-09-27' AS Date), N'lamhauhuong@fpt.edu.vn', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'91', N'OK', CAST(N'2020-09-27' AS Date), N'lamhauhuong@fpt.edu.vn', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'92', N'Woo', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'3', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'93', N'Yo', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'11', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'94', N'OK', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'95', N'?', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'96', N'A', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'8', N'active')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'97', N'Yes', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'30', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'98', N'A', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'36', N'deleted')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [Username], [ArticleID], [Status]) VALUES (N'99', N'B', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'36', N'active')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'1', N'Le Dat Anh Khoi has commented in your Article', CAST(N'2020-09-25 00:00:00.000' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'10', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:11:56.377' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'100', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 21:27:10.637' AS DateTime), N'unread', N'46', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'101', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 21:27:38.387' AS DateTime), N'unread', N'46', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'102', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-28 05:17:54.067' AS DateTime), N'unread', N'45', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'103', N'Admin has delete your article!', CAST(N'2020-09-28 05:18:36.930' AS DateTime), N'unread', N'46', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'104', N'Admin has delete your article!', CAST(N'2020-09-28 05:18:40.187' AS DateTime), N'unread', N'45', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'105', N'Hua Vinh Khang has liked your article!', CAST(N'2020-09-28 09:44:15.467' AS DateTime), N'unread', N'47', N'ngotanduc410@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'106', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-28 09:45:58.027' AS DateTime), N'read', N'47', N'ngotanduc410@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'107', N'Dinh Nhu Hieu has liked your article!', CAST(N'2020-09-28 15:42:01.910' AS DateTime), N'unread', N'47', N'ngotanduc410@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'108', N'Dinh Nhu Hieu has liked your article!', CAST(N'2020-09-28 15:42:15.047' AS DateTime), N'unread', N'47', N'ngotanduc410@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'109', N'Hua Vinh Khang has liked your article!', CAST(N'2020-09-28 16:19:49.523' AS DateTime), N'unread', N'48', N'beiuleagueoflegend@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'11', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'12', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'13', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'14', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'15', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'16', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'17', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'18', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'19', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:15:59.400' AS DateTime), N'read', N'3', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'2', N'Admin has delete your comment!', CAST(N'2020-09-26 18:37:15.917' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'20', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:54:34.593' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'21', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:54:34.593' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'22', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:54:34.593' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'23', N'Hua Vinh Khang has posted comment into his/her article!', CAST(N'2020-09-27 11:05:11.167' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'24', N'Hua Vinh Khang has posted comment into his/her article!', CAST(N'2020-09-27 11:05:11.167' AS DateTime), N'read', N'3', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'25', N'Lam Hau Huong has posted a comment into your post!', CAST(N'2020-09-27 11:06:30.897' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'26', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 11:06:30.897' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'27', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 11:06:30.897' AS DateTime), N'read', N'3', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'28', N'Lam Hau Huong has posted a comment into your post!', CAST(N'2020-09-27 11:10:07.317' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'29', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 11:10:07.317' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'3', N'Admin has delete your article!', CAST(N'2020-09-27 09:22:30.353' AS DateTime), N'read', N'37', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'30', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 11:10:07.317' AS DateTime), N'read', N'3', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'31', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 11:12:50.397' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'32', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 11:12:50.397' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'33', N'khoildase140074@gmail.com has disliked your article!', CAST(N'2020-09-27 12:12:00.897' AS DateTime), N'read', N'11', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'34', N'khoildase140074@gmail.com has liked your article!', CAST(N'2020-09-27 12:12:02.750' AS DateTime), N'read', N'11', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'35', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 12:12:07.087' AS DateTime), N'read', N'11', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'36', N'soulmarx57@gmail.com has liked your article!', CAST(N'2020-09-27 12:31:34.950' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'37', N'Admin has delete your comment!', CAST(N'2020-09-27 12:36:15.203' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'38', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 13:31:49.190' AS DateTime), N'read', N'8', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'39', N'Hua Vinh Khang has posted comment into Le Dat Anh Khoi article!', CAST(N'2020-09-27 13:31:49.190' AS DateTime), N'unread', N'8', N'canbo_deptrai_2phai@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'4', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:05:08.987' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'40', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 13:43:08.470' AS DateTime), N'read', N'8', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'41', N'Hua Vinh Khang has posted comment into Le Dat Anh Khoi article!', CAST(N'2020-09-27 13:43:08.470' AS DateTime), N'unread', N'8', N'canbo_deptrai_2phai@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'42', N'Le Dat Anh Khoi has liked your article!', CAST(N'2020-09-27 14:25:12.063' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'43', N'Le Dat Anh Khoi has liked your article!', CAST(N'2020-09-27 14:25:13.740' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'44', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 14:27:32.347' AS DateTime), N'unread', N'8', N'canbo_deptrai_2phai@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'45', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 14:27:32.347' AS DateTime), N'read', N'8', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'46', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 14:40:22.630' AS DateTime), N'read', N'30', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'47', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 14:40:22.630' AS DateTime), N'read', N'30', N'beiumegaman@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'48', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 14:47:34.503' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'49', N'Hua Vinh Khang has posted comment into his/her article!', CAST(N'2020-09-27 14:47:59.610' AS DateTime), N'read', N'36', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'5', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:06:14.553' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'50', N'Hua Vinh Khang has liked your article!', CAST(N'2020-09-27 14:48:56.103' AS DateTime), N'read', N'8', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'51', N'Le Dat Anh Khoi has liked your article!', CAST(N'2020-09-27 14:50:00.087' AS DateTime), N'read', N'36', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'52', N'Hua Vinh Khang has disliked your article!', CAST(N'2020-09-27 14:52:23.383' AS DateTime), N'read', N'8', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'53', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 14:52:47.017' AS DateTime), N'unread', N'8', N'canbo_deptrai_2phai@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'54', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 14:52:47.017' AS DateTime), N'read', N'8', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'55', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 14:57:05.023' AS DateTime), N'read', N'38', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'56', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 15:00:40.257' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'57', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 15:00:58.367' AS DateTime), N'read', N'40', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'58', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 15:01:15.950' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'59', N'Le Dat Anh Khoi has posted comment into his/her article!', CAST(N'2020-09-27 15:06:04.383' AS DateTime), N'read', N'40', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'6', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:07:34.003' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'60', N'Dio Brando has posted a comment into your post!', CAST(N'2020-09-27 16:06:46.673' AS DateTime), N'read', N'30', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'61', N'Le Dat Anh Khoi has posted a comment into your post!', CAST(N'2020-09-27 16:07:46.563' AS DateTime), N'read', N'30', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'62', N'Le Dat Anh Khoi has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 16:07:46.563' AS DateTime), N'unread', N'30', N'beiumegaman@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'63', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 16:37:50.143' AS DateTime), N'read', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'64', N'Hua Vinh Khang has liked your article!', CAST(N'2020-09-27 16:37:54.793' AS DateTime), N'read', N'41', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'65', N'TesterNumTwo has posted comment into his/her article!', CAST(N'2020-09-27 16:38:28.003' AS DateTime), N'read', N'42', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'66', N'TesterNumTwo has posted a comment into your post!', CAST(N'2020-09-27 16:39:24.280' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'67', N'TesterNumTwo has posted comment into Le Dat Anh Khoi article!', CAST(N'2020-09-27 16:39:24.280' AS DateTime), N'read', N'40', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'68', N'Nguyen Trung Hung has liked your article!', CAST(N'2020-09-27 20:21:58.937' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'69', N'Huy dep traiiii has liked your article!', CAST(N'2020-09-27 20:30:55.513' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'7', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:08:31.620' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'70', N'Huy dep traiiii has posted a comment into your post!', CAST(N'2020-09-27 20:31:09.247' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'71', N'Huy dep traiiii has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:31:09.247' AS DateTime), N'read', N'42', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'72', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 20:32:11.133' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'73', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:32:11.133' AS DateTime), N'unread', N'42', N'huydeptrai123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'74', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:32:13.510' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'75', N'AAAAAAAA has posted a comment into your post!', CAST(N'2020-09-27 20:32:56.887' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'76', N'AAAAAAAA has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:32:56.887' AS DateTime), N'read', N'42', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'77', N'AAAAAAAA has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:32:56.887' AS DateTime), N'unread', N'42', N'huydeptrai123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'78', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 20:33:53.753' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'79', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:33:53.753' AS DateTime), N'unread', N'42', N'huydeptrai123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'8', N'Lam Hau Huong has posted comment into Hua Vinh Khang article!', CAST(N'2020-09-27 10:08:31.620' AS DateTime), N'read', N'3', N'lamhauhuong@fpt.edu.vn')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'80', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:33:53.753' AS DateTime), N'read', N'42', N'tthinh..2128@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'81', N'AAAAAAAA has posted a comment into your post!', CAST(N'2020-09-27 20:35:18.727' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'82', N'AAAAAAAA has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:35:18.727' AS DateTime), N'read', N'42', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'83', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 20:36:50.437' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'84', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:36:50.437' AS DateTime), N'read', N'42', N'tthinh..2128@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'85', N'AAAAAAAA has posted a comment into your post!', CAST(N'2020-09-27 20:40:04.897' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'86', N'AAAAAAAA has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:40:04.897' AS DateTime), N'read', N'42', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'87', N'AAAAAAAA has disliked your article!', CAST(N'2020-09-27 20:41:11.863' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'88', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:41:14.103' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'89', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:41:16.307' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'9', N'khoildase140074@gmail.com has posted a comment into your post!', CAST(N'2020-09-27 10:11:56.377' AS DateTime), N'read', N'3', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'90', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:41:18.823' AS DateTime), N'read', N'40', N'khoildase140074@gmail.com')
GO
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'91', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 20:42:03.320' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'92', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:42:03.320' AS DateTime), N'read', N'42', N'tthinh..2128@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'93', N'Hua Vinh Khang has posted a comment into your post!', CAST(N'2020-09-27 20:44:02.300' AS DateTime), N'unread', N'42', N'test123123@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'94', N'Hua Vinh Khang has posted comment into TesterNumTwo article!', CAST(N'2020-09-27 20:44:02.300' AS DateTime), N'read', N'42', N'tthinh..2128@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'95', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:55:49.103' AS DateTime), N'read', N'11', N'huavinhkhang@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'96', N'AAAAAAAA has liked your article!', CAST(N'2020-09-27 20:57:57.580' AS DateTime), N'unread', N'45', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'97', N'Admin has delete your comment!', CAST(N'2020-09-27 21:08:10.703' AS DateTime), N'read', N'32', N'khoildase140074@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'98', N'Le Dat Anh Khoi has liked your article!', CAST(N'2020-09-27 21:15:44.280' AS DateTime), N'unread', N'46', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Notification] ([NotificationID], [Content], [notiTime], [Status], [ArticleID], [EmailGet]) VALUES (N'99', N'Le Dat Anh Khoi has disliked your article!', CAST(N'2020-09-27 21:15:46.290' AS DateTime), N'unread', N'46', N'trinhquochao130120@gmail.com')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'1', N'Like', CAST(N'2020-09-20' AS Date), N'lamhauhuong@fpt.edu.vn', N'3')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'10', N'Dislike', CAST(N'2020-09-20' AS Date), N'khoildase140074@gmail.com', N'5')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'11', N'Like', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'7')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'12', N'Like', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'3')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'13', N'Like', CAST(N'2020-09-20' AS Date), N'trinhquochao130120@gmail.com', N'17')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'14', N'Like', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'17')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'15', N'Like', CAST(N'2020-09-20' AS Date), N'trunghung.nguyen98@gmail.com', N'14')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'16', N'Like', CAST(N'2020-09-20' AS Date), N'trinhquochao130120@gmail.com', N'18')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'17', N'Like', CAST(N'2020-09-20' AS Date), N'huavinhkhang@gmail.com', N'19')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'18', N'Like', CAST(N'2020-09-21' AS Date), N'lamhauhuong@fpt.edu.vn', N'16')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'19', N'Dislike', CAST(N'2020-09-21' AS Date), N'lamhauhuong@fpt.edu.vn', N'8')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'2', N'Like', CAST(N'2020-09-20' AS Date), N'lamhauhuong@fpt.edu.vn', N'13')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'21', N'Nothing', CAST(N'2020-09-21' AS Date), N'khoilda@gmail.com', N'8')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'22', N'Nothing', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'7')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'23', N'Dislike', CAST(N'2020-09-21' AS Date), N'huavinhkhang@gmail.com', N'2')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'24', N'Like', CAST(N'2020-09-21' AS Date), N'truongquoclap@gmail.com', N'16')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'25', N'Dislike', CAST(N'2020-09-23' AS Date), N'lamhauhuong@fpt.edu.vn', N'29')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'26', N'Nothing', CAST(N'2020-09-24' AS Date), N'huavinhkhang@gmail.com', N'16')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'27', N'Like', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'30')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'28', N'Like', CAST(N'2020-09-24' AS Date), N'beiumegaman@gmail.com', N'30')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'29', N'Nothing', CAST(N'2020-09-24' AS Date), N'meomeo@gmail.com', N'34')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'3', N'Like', CAST(N'2020-09-20' AS Date), N'lamhauhuong@fpt.edu.vn', N'7')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'30', N'Dislike', CAST(N'2020-09-24' AS Date), N'meomeo@gmail.com', N'19')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'31', N'Like', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'35')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'32', N'Nothing', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'32')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'33', N'Nothing', CAST(N'2020-09-26' AS Date), N'huavinhkhang@gmail.com', N'36')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'34', N'Like', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'11')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'35', N'Like', CAST(N'2020-09-27' AS Date), N'soulmarx57@gmail.com', N'36')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'36', N'Like', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'36')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'37', N'Nothing', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'8')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'38', N'Nothing', CAST(N'2020-09-27' AS Date), N'test123123@gmail.com', N'41')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'39', N'Like', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'41')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'4', N'Like', CAST(N'2020-09-20' AS Date), N'lamhauhuong@fpt.edu.vn', N'11')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'40', N'Like', CAST(N'2020-09-27' AS Date), N'trunghung.nguyen98@gmail.com', N'42')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'41', N'Like', CAST(N'2020-09-27' AS Date), N'huydeptrai123@gmail.com', N'42')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'42', N'Like', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'42')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'43', N'Like', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'40')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'44', N'Like', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'44')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'45', N'Like', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'45')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'46', N'Like', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'11')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'47', N'Like', CAST(N'2020-09-27' AS Date), N'tthinh..2128@gmail.com', N'45')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'48', N'Like', CAST(N'2020-09-27' AS Date), N'trinhquochao130120@gmail.com', N'46')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'49', N'Dislike', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'46')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'5', N'Like', CAST(N'2020-09-25' AS Date), N'huavinhkhang@gmail.com', N'3')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'50', N'Like', CAST(N'2020-09-28' AS Date), N'ngotanduc410@gmail.com', N'47')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'51', N'Like', CAST(N'2020-09-28' AS Date), N'huavinhkhang@gmail.com', N'47')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'52', N'Nothing', CAST(N'2020-09-28' AS Date), N'hieudinh003@gmail.com', N'47')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'53', N'Nothing', CAST(N'2020-09-28' AS Date), N'beiuleagueoflegend@gmail.com', N'48')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'54', N'Like', CAST(N'2020-09-28' AS Date), N'huavinhkhang@gmail.com', N'48')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'6', N'Dislike', CAST(N'2020-09-27' AS Date), N'huavinhkhang@gmail.com', N'8')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'7', N'Like', CAST(N'2020-09-20' AS Date), N'khoildase140074@gmail.com', N'3')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'8', N'Like', CAST(N'2020-09-27' AS Date), N'khoildase140074@gmail.com', N'11')
INSERT [dbo].[Reaction] ([ReactionID], [Status], [Date], [Username], [ArticleID]) VALUES (N'9', N'Like', CAST(N'2020-09-20' AS Date), N'khoildase140074@gmail.com', N'10')
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([EmailGet])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Email])
GO
