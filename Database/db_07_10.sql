USE [QL_thuexe]
GO
/****** Object:  Table [dbo].[ApplicationGroups]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.ApplicationGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRoleGroups]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoleGroups](
	[GroupId] [int] NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ApplicationRoleGroups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRoles]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](250) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserClaims]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserClaims] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserGroups]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserGroups](
	[UserId] [nvarchar](128) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserGroups] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserLogins]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserRoles]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUsers]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[BirthDay] [smallint] NULL,
	[Email] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Gioitinh] [nvarchar](3) NULL,
 CONSTRAINT [PK_dbo.ApplicationUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chucvu]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chucvu](
	[Macv] [nvarchar](3) NOT NULL,
	[Tencv] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHUCVU] PRIMARY KEY CLUSTERED 
(
	[Macv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dangkyxe]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dangkyxe](
	[Sttphieu] [nvarchar](10) NOT NULL,
	[Sttxe] [nvarchar](3) NOT NULL,
	[Ngaysd] [date] NOT NULL,
	[Tugio] [tinyint] NOT NULL,
	[Dengio] [tinyint] NULL,
 CONSTRAINT [PK_tbl_dangkyxe] PRIMARY KEY CLUSTERED 
(
	[Sttphieu] ASC,
	[Sttxe] ASC,
	[Ngaysd] ASC,
	[Tugio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dinhgia]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dinhgia](
	[Mahangxe] [nvarchar](1) NOT NULL,
	[Manv] [nvarchar](3) NOT NULL,
	[Thang] [smallint] NOT NULL,
	[Nam] [smallint] NOT NULL,
	[Giathue] [smallmoney] NULL,
 CONSTRAINT [PK_tbl_dinhgia] PRIMARY KEY CLUSTERED 
(
	[Mahangxe] ASC,
	[Manv] ASC,
	[Thang] ASC,
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_hangxe]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_hangxe](
	[Mahangxe] [nvarchar](1) NOT NULL,
	[Diengiai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_hangxe] PRIMARY KEY CLUSTERED 
(
	[Mahangxe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_khach]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_khach](
	[Maso] [nvarchar](5) NOT NULL,
	[Hotenkhach] [nvarchar](50) NULL,
	[Sodt] [nvarchar](10) NULL,
	[Socmnd] [nvarchar](10) NULL,
	[Gioitinh] [nvarchar](3) NULL,
 CONSTRAINT [PK_tbl_khach] PRIMARY KEY CLUSTERED 
(
	[Maso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_laplichxe]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_laplichxe](
	[Manv] [nvarchar](3) NOT NULL,
	[Sttxe] [nvarchar](3) NOT NULL,
	[Ngaydukien] [date] NOT NULL,
	[Tugio] [tinyint] NOT NULL,
	[Dengio] [tinyint] NULL,
 CONSTRAINT [PK_tbl_laplichxe_1] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC,
	[Sttxe] ASC,
	[Ngaydukien] ASC,
	[Tugio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_nhanvien]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_nhanvien](
	[Manv] [nvarchar](3) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Gioitinh] [nvarchar](3) NULL,
	[Namsinh] [smallint] NULL,
	[Sodt] [nvarchar](10) NULL,
	[Macv] [nvarchar](3) NULL,
 CONSTRAINT [PK_NHANVIEN_1] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phatsinhxe]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phatsinhxe](
	[Sttps] [smallint] NOT NULL,
	[Sttphieu] [nvarchar](10) NULL,
	[Soxedkcu] [nvarchar](3) NULL,
	[Soxethay] [nvarchar](3) NULL,
 CONSTRAINT [PK_tbl_phatsinhxe] PRIMARY KEY CLUSTERED 
(
	[Sttps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phieudk]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phieudk](
	[Sttphieu] [nvarchar](10) NOT NULL,
	[Ngayghi] [date] NULL,
	[Manv] [nvarchar](3) NULL,
	[Maso] [nvarchar](5) NULL,
 CONSTRAINT [PK_tbl_phieudk] PRIMARY KEY CLUSTERED 
(
	[Sttphieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_xe]    Script Date: 10/8/2020 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_xe](
	[Sttxe] [nvarchar](3) NOT NULL,
	[Banso] [nvarchar](10) NULL,
	[Hieuxe] [nvarchar](20) NULL,
	[Mahangxe] [nvarchar](1) NULL,
 CONSTRAINT [PK_tbl_xe] PRIMARY KEY CLUSTERED 
(
	[Sttxe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApplicationGroups] ON 

INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (1, N'Admin', N'Ban quản trị')
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (13, N'Giám đốc', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (14, N'Kế toán', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (15, N'Nhân viên', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (16, N'Nhân viên bán vé', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (17, N'Phó giám đốc', NULL)
SET IDENTITY_INSERT [dbo].[ApplicationGroups] OFF
GO
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (1, N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (1, N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (1, N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (1, N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (1, N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (13, N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (14, N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (15, N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (16, N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL)
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId], [Note]) VALUES (17, N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL)
GO
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'2e0dd04b-9ac9-49f0-bb8d-4d14adde4dbb', N'Admin', NULL, N'IdentityRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'4792958a-a426-4dc9-98a7-258f18b3a075', N'KeToan', N'Kế toán', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'4fabc406-3264-43bd-97d2-4d8543c1fe98', N'PhoGiamDoc', N'Phó giám đốc', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', N'NhanVien', N'Nhân viên', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', N'NhanVienBanve', N'Nhân viên bán vé', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'ce94e04d-1ea2-4f66-a996-0380f3257c11', N'GiamDoc', N'Giám đốc', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'd637e6ab-4a01-4e82-b156-86ff72e78280', N'User', NULL, N'IdentityRole')
GO
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'4b738db3-af07-43bc-97d4-278473e51fb7', 13, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 1, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 13, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 14, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 15, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 16, NULL)
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId], [Note]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', 17, NULL)
GO
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'03a39ac2-7a75-4775-9846-69ffd80169d3', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'07d22b77-2bc9-4066-b0f4-98cc02ca935e', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'07d22b77-2bc9-4066-b0f4-98cc02ca935e', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'07d22b77-2bc9-4066-b0f4-98cc02ca935e', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'07d22b77-2bc9-4066-b0f4-98cc02ca935e', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'07d22b77-2bc9-4066-b0f4-98cc02ca935e', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0b28ba02-ad03-4590-afef-fa281416797f', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0d4cac2b-1d7c-4a0e-a1f1-a5d3bcdd4ab9', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0d4cac2b-1d7c-4a0e-a1f1-a5d3bcdd4ab9', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0d4cac2b-1d7c-4a0e-a1f1-a5d3bcdd4ab9', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'07be8b35-688a-4456-a43c-2c1c9feeede0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'4173d74e-e3e2-4448-a648-12c88d5d4520', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'abee49e4-bb3e-4aeb-96f7-171de1d83081', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0fd05d1f-d0ab-41d9-acd8-2a2afe672841', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10fd9511-2783-4292-a366-8415e079f63a', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2157e6e5-f62f-4270-bcc5-8c68bc2f0f5c', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'27ada48c-be1d-42d9-b23c-175016b726bf', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'29f67400-e295-4736-8728-33e5a9ffd393', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'29f67400-e295-4736-8728-33e5a9ffd393', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'29f67400-e295-4736-8728-33e5a9ffd393', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'29f67400-e295-4736-8728-33e5a9ffd393', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'29f67400-e295-4736-8728-33e5a9ffd393', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2a6fd265-5c98-4a04-a02d-05870485064f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2b96f56d-0725-4404-9bb6-7fa11c44e33b', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2b96f56d-0725-4404-9bb6-7fa11c44e33b', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2b96f56d-0725-4404-9bb6-7fa11c44e33b', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2b96f56d-0725-4404-9bb6-7fa11c44e33b', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2f89a7ab-5947-4608-9fd0-fb7e648e9788', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'2f89a7ab-5947-4608-9fd0-fb7e648e9788', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3163d278-a3dc-4181-a9be-7b163f46b4ae', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'369e48c4-e6af-4719-a5df-1c9753dbef14', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'38166eae-6896-49d3-b00a-95e21a698786', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'38166eae-6896-49d3-b00a-95e21a698786', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'38166eae-6896-49d3-b00a-95e21a698786', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'38166eae-6896-49d3-b00a-95e21a698786', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'38166eae-6896-49d3-b00a-95e21a698786', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'39cff308-1f7b-4992-9c78-f2b3d93fcfd6', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'40d57515-ea41-406d-95be-7e11da437050', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'40d57515-ea41-406d-95be-7e11da437050', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
GO
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42fcf790-890f-4994-93fc-ecf1a34c6be9', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'48a830ea-140f-4ba4-9b70-225b1443d025', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'48a830ea-140f-4ba4-9b70-225b1443d025', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'48a830ea-140f-4ba4-9b70-225b1443d025', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'49a05802-c34f-45b2-bff9-7c534a0b74c3', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4a7cacc1-2539-40d3-a8f9-e6c8981e9a2f', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4b738db3-af07-43bc-97d4-278473e51fb7', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'56e3b624-72e2-49b9-a3d9-8a5bcf3e7c24', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'56e3b624-72e2-49b9-a3d9-8a5bcf3e7c24', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'56e3b624-72e2-49b9-a3d9-8a5bcf3e7c24', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'56e3b624-72e2-49b9-a3d9-8a5bcf3e7c24', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ce48061-e40a-42e5-850b-e9e39a17add4', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ce48061-e40a-42e5-850b-e9e39a17add4', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ce48061-e40a-42e5-850b-e9e39a17add4', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ce48061-e40a-42e5-850b-e9e39a17add4', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ce48061-e40a-42e5-850b-e9e39a17add4', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5ffb879a-74e4-4037-bc6b-0a682138ceed', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'69814e87-3fdf-4a45-b0df-09d9b8bd29a8', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'69814e87-3fdf-4a45-b0df-09d9b8bd29a8', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'69814e87-3fdf-4a45-b0df-09d9b8bd29a8', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'69814e87-3fdf-4a45-b0df-09d9b8bd29a8', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7295329d-3045-463b-b9f8-53fe1dd34f08', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'744c1624-56f3-45d3-858c-7e6c0b23a885', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'07be8b35-688a-4456-a43c-2c1c9feeede0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'4173d74e-e3e2-4448-a648-12c88d5d4520', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'abee49e4-bb3e-4aeb-96f7-171de1d83081', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
GO
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'814297af-e508-44cc-a349-f8655f353499', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'814297af-e508-44cc-a349-f8655f353499', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'814297af-e508-44cc-a349-f8655f353499', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'814297af-e508-44cc-a349-f8655f353499', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8259e50e-0035-4d9a-bc76-e04fd54b572c', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8259e50e-0035-4d9a-bc76-e04fd54b572c', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8259e50e-0035-4d9a-bc76-e04fd54b572c', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8259e50e-0035-4d9a-bc76-e04fd54b572c', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8259e50e-0035-4d9a-bc76-e04fd54b572c', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c1d445b-b59c-4325-9c54-a47b2dbe0e4d', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c1d445b-b59c-4325-9c54-a47b2dbe0e4d', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c1d445b-b59c-4325-9c54-a47b2dbe0e4d', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c1d445b-b59c-4325-9c54-a47b2dbe0e4d', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c1d445b-b59c-4325-9c54-a47b2dbe0e4d', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c46baa5-f2f7-4b40-b171-fd51b3c103f9', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c46baa5-f2f7-4b40-b171-fd51b3c103f9', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c46baa5-f2f7-4b40-b171-fd51b3c103f9', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c46baa5-f2f7-4b40-b171-fd51b3c103f9', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8c46baa5-f2f7-4b40-b171-fd51b3c103f9', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8e9534ff-37ac-41d5-a73d-656c8d50caaa', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8e9534ff-37ac-41d5-a73d-656c8d50caaa', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8e9534ff-37ac-41d5-a73d-656c8d50caaa', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8e9534ff-37ac-41d5-a73d-656c8d50caaa', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'8e9534ff-37ac-41d5-a73d-656c8d50caaa', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'92a1b8e5-c339-4344-991b-71e8fbfa8f8f', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'92a1b8e5-c339-4344-991b-71e8fbfa8f8f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'92a1b8e5-c339-4344-991b-71e8fbfa8f8f', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'92a1b8e5-c339-4344-991b-71e8fbfa8f8f', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'93da7613-b895-4726-8c55-4e9dba763f8e', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'96b8adc4-4c76-4d9f-b62b-a92ef7e0eb6a', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'99199f59-883a-4e6c-b5f5-05490482d409', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9c9f159a-a40d-453f-b970-fdcc7f01f70d', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9e9a5c9d-989e-4f73-b963-029cc8fcdf4a', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'9f2d954c-1da5-49f1-a966-79dc363563ae', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a0bc1bec-acf4-4690-b3aa-7b4ae4c03f84', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'a23dba00-5d88-4574-a51a-b58845a9c986', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'2e0dd04b-9ac9-49f0-bb8d-4d14adde4dbb', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'd637e6ab-4a01-4e82-b156-86ff72e78280', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ad61b3f8-4662-4c9d-8699-d1fc1d087e3e', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ae9440c0-9d32-4047-841e-1dfc678ce475', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ae9440c0-9d32-4047-841e-1dfc678ce475', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ae9440c0-9d32-4047-841e-1dfc678ce475', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ae9440c0-9d32-4047-841e-1dfc678ce475', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b4794d39-8d93-4459-8a28-156985e5fe64', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b4794d39-8d93-4459-8a28-156985e5fe64', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b7b1c73a-4ff5-4662-9bca-05e3b53ee4fa', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b7b1c73a-4ff5-4662-9bca-05e3b53ee4fa', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b7b1c73a-4ff5-4662-9bca-05e3b53ee4fa', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b7b1c73a-4ff5-4662-9bca-05e3b53ee4fa', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b7b1c73a-4ff5-4662-9bca-05e3b53ee4fa', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bc313043-fd5a-4b65-8acc-55d0f85c4bb1', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bd041095-0ebf-460c-822b-e02e636836c7', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'be4cc594-e19e-4848-b340-a131d0c9e60f', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
GO
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'bfe984a8-096a-4163-84da-103368d9ae5f', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c49c86d7-9421-4cf6-bdd9-3eb0ffe2518b', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c786ba85-bd49-4093-a8cd-4e9d226a2351', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c786ba85-bd49-4093-a8cd-4e9d226a2351', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c786ba85-bd49-4093-a8cd-4e9d226a2351', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c830eef4-5b76-407d-9843-e480ebead41e', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'cba8157d-7319-4215-899b-ae8738b3e003', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'cba8157d-7319-4215-899b-ae8738b3e003', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'cba8157d-7319-4215-899b-ae8738b3e003', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'cba8157d-7319-4215-899b-ae8738b3e003', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'da22fb92-3c89-47f2-b15e-e916e903eee6', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'da22fb92-3c89-47f2-b15e-e916e903eee6', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'da22fb92-3c89-47f2-b15e-e916e903eee6', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'da22fb92-3c89-47f2-b15e-e916e903eee6', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'da22fb92-3c89-47f2-b15e-e916e903eee6', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'dc12399f-c591-4f1e-abac-4c6eb0ab66d7', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'dd768b97-5ad5-41ce-a25b-c884635c1176', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'dd768b97-5ad5-41ce-a25b-c884635c1176', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'dd768b97-5ad5-41ce-a25b-c884635c1176', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'dd768b97-5ad5-41ce-a25b-c884635c1176', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e2cf1bfa-41de-4d92-ae82-8ab3b3f1be74', N'fb7b7b45-a892-473f-a73a-e8899f73ebf8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'095dd76b-f3a2-4eb9-95b4-98591d803fff', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'36206a07-6025-4492-b210-d15f8571075e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'535939b8-f52b-4846-b95b-645a6729c0da', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6ab0d56-b67b-4947-8656-5139dbb71912', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e6fde517-a32f-4ec3-a419-2c17f05cfab6', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'e8e50678-2618-4621-af84-e3002581f901', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ed4e17cf-2885-4311-beda-06ad7b85e4e3', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ed4e17cf-2885-4311-beda-06ad7b85e4e3', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ed4e17cf-2885-4311-beda-06ad7b85e4e3', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ed4e17cf-2885-4311-beda-06ad7b85e4e3', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'ed4e17cf-2885-4311-beda-06ad7b85e4e3', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f150c01d-d64d-42e4-b99f-96ac89006f56', N'520651d6-67a6-488d-aa9c-c61900596f35', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f150c01d-d64d-42e4-b99f-96ac89006f56', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'03c68f75-97fe-416b-af31-7019240c7c3e', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'07be8b35-688a-4456-a43c-2c1c9feeede0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
GO
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'33764621-b1f5-498e-92af-79e46675f4cc', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'3a0ec146-a428-423c-896d-bea8ea18e1d0', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'4173d74e-e3e2-4448-a648-12c88d5d4520', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'4792958a-a426-4dc9-98a7-258f18b3a075', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'4a056641-22a4-4a3a-9f6c-23405a17a6c2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'4fabc406-3264-43bd-97d2-4d8543c1fe98', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'838cd2db-f5e3-4981-9999-c5489a145263', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'8747cd30-dc6a-4ac9-86dc-593655365122', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'abee49e4-bb3e-4aeb-96f7-171de1d83081', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'b4e05adc-3485-41fe-8703-b3efb15f8b5f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'b501b330-7f60-48da-8c85-8dfdbc3e2b14', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'c427bb1f-4806-4131-b01b-3eecefb49400', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'c4353d29-f39c-4859-8949-d44315e74e56', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'c723ce89-e509-4f5a-8273-685f3c14c3b2', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'ce94e04d-1ea2-4f66-a996-0380f3257c11', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'e9c55747-6019-488d-860f-6a36350537f1', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'f7548b8f-3c2d-48a3-a5d5-b573b177b0ed', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f70e0f93-f109-488a-b570-03a3c2a1f3ae', N'fb0e2107-dcf3-48b3-9f2c-b6710dcdcd3c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'2ddded44-f75a-4e30-94c1-b558eee85150', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'4c940bc9-0d22-4d0b-8f4e-58a37a925cd4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'f8007115-8f77-43a8-b965-a2ed7673c7a8', N'c900368b-e966-4a23-9723-723695a67cac', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'fcfeac1e-e87a-45c2-8416-7d8fc44eac7e', N'0765f36e-4b97-4564-b6ac-0171e7ed4382', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'fcfeac1e-e87a-45c2-8416-7d8fc44eac7e', N'0db0f35c-1ba7-4e3d-ba4b-3540d67708c8', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'fcfeac1e-e87a-45c2-8416-7d8fc44eac7e', N'801d635d-4481-4f28-888c-195b32c5bab8', NULL, NULL)
GO
INSERT [dbo].[ApplicationUsers] ([Id], [FullName], [Address], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gioitinh]) VALUES (N'4b738db3-af07-43bc-97d4-278473e51fb7', N'Trần Văn Trường', NULL, NULL, N'truong@gmail.com', 0, N'ABcMlnRkBst2EduK7LOf152+UxZWXQnye8Esy3YKBq+IJi8XvEKzxnRLPBnkr13cIQ==', N'd7db158f-c41c-49ef-bf51-0b02ae7851bf', N'0832127407', 0, 0, NULL, 0, 0, N'001', N'Nam')
INSERT [dbo].[ApplicationUsers] ([Id], [FullName], [Address], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gioitinh]) VALUES (N'7c70f855-34e1-4057-b7c2-c68a61e510f2', N'admin', N'ăd', 2000, N'admin@mail.com', 1, N'ANCok8mZcFu/X2bvIMFZziILalCRa+OV340TAKgzxj6frmYIJffayyd8RKq3sPgo9Q==', N'97593689-8b61-47e8-a90d-adc576fa7c39', N'21313', 0, 0, NULL, 1, 0, N'admin', N'Nam')
GO
INSERT [dbo].[tbl_dangkyxe] ([Sttphieu], [Sttxe], [Ngaysd], [Tugio], [Dengio]) VALUES (N'0000000001', N'002', CAST(N'2020-10-07' AS Date), 7, 5)
GO
INSERT [dbo].[tbl_hangxe] ([Mahangxe], [Diengiai]) VALUES (N'A', N'Hạng A')
INSERT [dbo].[tbl_hangxe] ([Mahangxe], [Diengiai]) VALUES (N'B', N'Hạng B')
INSERT [dbo].[tbl_hangxe] ([Mahangxe], [Diengiai]) VALUES (N'C', N'Hạng C')
GO
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00001', N'Nguyễn Hà Ngọc Trân', N'0123456789', N'2132353463', N'Nữ')
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00002', N'Nguyễn Vĩnh Nam', N'0735234231', N'3242343654', N'Nam')
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00003', N'Đỗ Kim Kha', N'0123456789', N'1234234234', N'Nữ')
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00004', N'Trương Thị Ngọc Thuận', N'0452342432', N'2131231231', N'Nữ')
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00005', N'Vũ Thị Ngọc Ngân', N'0873442342', N'3232565467', N'Nữ')
INSERT [dbo].[tbl_khach] ([Maso], [Hotenkhach], [Sodt], [Socmnd], [Gioitinh]) VALUES (N'00006', N'Bùi Hoàng Trung', N'0531242432', N'2342575776', N'Nam')
GO
INSERT [dbo].[tbl_nhanvien] ([Manv], [Hoten], [Gioitinh], [Namsinh], [Sodt], [Macv]) VALUES (N'001', N'Trần Văn Trường', N'Nam', NULL, N'0832127407', NULL)
GO
INSERT [dbo].[tbl_phieudk] ([Sttphieu], [Ngayghi], [Manv], [Maso]) VALUES (N'0000000001', CAST(N'2020-10-07' AS Date), N'001', N'00003')
GO
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'001', N'68A12345', N'Bugatti', N'B')
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'002', N'68A22345', N'Mec', N'A')
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'003', N'69A32345', N'Audi', N'C')
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'004', N'69A12321', N'Toyota', N'A')
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'005', N'68A12122', N'Bentley', N'B')
INSERT [dbo].[tbl_xe] ([Sttxe], [Banso], [Hieuxe], [Mahangxe]) VALUES (N'006', N'69A1236', N'BMW', N'A')
GO
ALTER TABLE [dbo].[ApplicationRoles] ADD  DEFAULT ('') FOR [Discriminator]
GO
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroups_GroupId]
GO
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ApplicationRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationRoles_RoleId]
GO
ALTER TABLE [dbo].[ApplicationUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserClaims] CHECK CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroups_GroupId]
GO
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationUsers_UserId]
GO
ALTER TABLE [dbo].[ApplicationUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserLogins] CHECK CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[ApplicationRoles] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id]
GO
ALTER TABLE [dbo].[tbl_dangkyxe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_dangkyxe_tbl_phieudk] FOREIGN KEY([Sttphieu])
REFERENCES [dbo].[tbl_phieudk] ([Sttphieu])
GO
ALTER TABLE [dbo].[tbl_dangkyxe] CHECK CONSTRAINT [FK_tbl_dangkyxe_tbl_phieudk]
GO
ALTER TABLE [dbo].[tbl_dangkyxe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_dangkyxe_tbl_xe] FOREIGN KEY([Sttxe])
REFERENCES [dbo].[tbl_xe] ([Sttxe])
GO
ALTER TABLE [dbo].[tbl_dangkyxe] CHECK CONSTRAINT [FK_tbl_dangkyxe_tbl_xe]
GO
ALTER TABLE [dbo].[tbl_dinhgia]  WITH CHECK ADD  CONSTRAINT [FK_tbl_dinhgia_tbl_hangxe] FOREIGN KEY([Mahangxe])
REFERENCES [dbo].[tbl_hangxe] ([Mahangxe])
GO
ALTER TABLE [dbo].[tbl_dinhgia] CHECK CONSTRAINT [FK_tbl_dinhgia_tbl_hangxe]
GO
ALTER TABLE [dbo].[tbl_dinhgia]  WITH CHECK ADD  CONSTRAINT [FK_tbl_dinhgia_tbl_nhanvien] FOREIGN KEY([Manv])
REFERENCES [dbo].[tbl_nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[tbl_dinhgia] CHECK CONSTRAINT [FK_tbl_dinhgia_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_laplichxe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_laplichxe_tbl_nhanvien] FOREIGN KEY([Manv])
REFERENCES [dbo].[tbl_nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[tbl_laplichxe] CHECK CONSTRAINT [FK_tbl_laplichxe_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_laplichxe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_laplichxe_tbl_xe] FOREIGN KEY([Sttxe])
REFERENCES [dbo].[tbl_xe] ([Sttxe])
GO
ALTER TABLE [dbo].[tbl_laplichxe] CHECK CONSTRAINT [FK_tbl_laplichxe_tbl_xe]
GO
ALTER TABLE [dbo].[tbl_nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvien_tbl_chucvu] FOREIGN KEY([Macv])
REFERENCES [dbo].[tbl_chucvu] ([Macv])
GO
ALTER TABLE [dbo].[tbl_nhanvien] CHECK CONSTRAINT [FK_tbl_nhanvien_tbl_chucvu]
GO
ALTER TABLE [dbo].[tbl_phatsinhxe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phatsinhxe_tbl_phieudk2] FOREIGN KEY([Sttphieu])
REFERENCES [dbo].[tbl_phieudk] ([Sttphieu])
GO
ALTER TABLE [dbo].[tbl_phatsinhxe] CHECK CONSTRAINT [FK_tbl_phatsinhxe_tbl_phieudk2]
GO
ALTER TABLE [dbo].[tbl_phieudk]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phieudk_tbl_khach] FOREIGN KEY([Maso])
REFERENCES [dbo].[tbl_khach] ([Maso])
GO
ALTER TABLE [dbo].[tbl_phieudk] CHECK CONSTRAINT [FK_tbl_phieudk_tbl_khach]
GO
ALTER TABLE [dbo].[tbl_phieudk]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phieudk_tbl_nhanvien] FOREIGN KEY([Manv])
REFERENCES [dbo].[tbl_nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[tbl_phieudk] CHECK CONSTRAINT [FK_tbl_phieudk_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_xe]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xe_tbl_hangxe1] FOREIGN KEY([Mahangxe])
REFERENCES [dbo].[tbl_hangxe] ([Mahangxe])
GO
ALTER TABLE [dbo].[tbl_xe] CHECK CONSTRAINT [FK_tbl_xe_tbl_hangxe1]
GO
