USE [master]
GO
CREATE DATABASE [JavaEE_Example]
GO
USE [JavaEE_Example]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau]) VALUES (N'admin', N'123')
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau]) VALUES (N'fpt', N'123')

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nvarchar](20) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNTT', N'Khoa Công nghệ thông tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Hoa', N'Khoa Hóa')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Ly', N'Khoa Lý')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'Toan', N'Khoa Toán')

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MSV] [nvarchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [int] NULL,
	[MaKhoa] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MSV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051010565', N'Lý Lê Bằng', 1, N'Toan')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051016523', N'Trần Anh Tuấn', 1, N'Toan')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051036666', N'Lê Lan Anh', 0, N'Hoa')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051037777', N'Đặng Thúy Nga', 0, N'Ly')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051070388', N'Nguyễn Văn A', 1, N'CNTT')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051070584', N'Trần Văn Long', 1, N'CNTT')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [GioiTinh], [MaKhoa]) VALUES (N'1051072354', N'Lê Văn Nam', 1, N'CNTT')

ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Khoa]
GO
