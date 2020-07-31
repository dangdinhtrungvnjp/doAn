CREATE DATABASE BT1
USE BT1
CREATE TABLE NhanVien(
	ID int,
	Tuoi int,
	HoTen nvarchar(50),
	GioiTinh nvarchar(50),
	CapBac nvarchar(50)
	CONSTRAINT PK_NV PRIMARY KEY(ID)
)
-- tao 10 nam
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('1','25','Nguyen Van A1','nam',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('2','25','Nguyen Van A2','nam',2)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('3','25','Nguyen Van A3','nam',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('4','25','Nguyen Van A4','nam',4)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('5','25','Nguyen Van A5','nam',5)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('6','25','Nguyen Van A6','nam',6)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('7','25','Nguyen Van A7','nam',7)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('8','25','Nguyen Van A8','nam',8)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('9','25','Nguyen Van A9','nam',9)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('10','25','Nguyen Van A10','nam',10)

--tao 10 nu
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('11','25','Nguyen Thi B1','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('12','25','Nguyen Thi B2','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('13','25','Nguyen Thi B3','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('14','25','Nguyen Thi B4','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('15','25','Nguyen Thi B5','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('16','25','Nguyen Thi B6','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('17','25','Nguyen Thi B7','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('18','25','Nguyen Thi B8','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('19','25','Nguyen Thi B9','nu',1)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('20','25','Nguyen Thi B10','nu',1)

--tao them 10 nu
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('21','25','Nguyen Thi C1','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('22','25','Nguyen Thi C2','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('23','25','Nguyen Thi C3','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('24','25','Nguyen Thi C4','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('25','25','Nguyen Thi C5','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('26','25','Nguyen Thi C6','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('27','25','Nguyen Thi C7','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('28','25','Nguyen Thi C8','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('29','25','Nguyen Thi C9','nu',3)
INSERT INTO NhanVien(ID,Tuoi,HoTen,GioiTinh,CapBac) VALUES('30','25','Nguyen Thi C10','nu',3)

SELECT ID,Tuoi,HoTen,GioiTinh,CapBac
FROM NhanVien
where GioiTinh='nu'

SELECT * FROM NhanVien 
ORDER BY Id
OFFSET 2 ROWS -- sau khi sắp xếp thì bỏ qua 2 giá trị đầu
FETCH NEXT 4 ROWS ONLY;-- chỉ lấy 4 id tiếp theo



SELECT * FROM NhanVien where GioiTinh='%s' ORDER BY Id OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY
-- trang 1
SELECT * FROM NhanVien 
where GioiTinh='nam'
ORDER BY Id
OFFSET 0 ROWS -- sau khi sắp xếp thì bỏ qua 2 giá trị đầu
FETCH NEXT 4 ROWS ONLY;-- chỉ lấy 4 id tiếp theo

-- trang 2
SELECT * FROM NhanVien 
ORDER BY Id
OFFSET 4 ROWS -- sau khi sắp xếp thì bỏ qua 2 giá trị đầu
FETCH NEXT 4 ROWS ONLY;-- chỉ lấy 4 id tiếp theo

--trang 3
SELECT * FROM NhanVien 
ORDER BY Id
OFFSET 8 ROWS -- sau khi sắp xếp thì bỏ qua 2 giá trị đầu
FETCH NEXT 4 ROWS ONLY;-- chỉ lấy 4 id tiếp theo


USE [master]
GO
CREATE DATABASE [BT1]
GO
USE [BT1]
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
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau]) VALUES (N'dsoft', N'123')

SELECT *
FROM NguoiDung