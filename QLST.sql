CREATE DATABASE QLSieuThi
USE QLSieuThi

drop table LoaiSP
Create table LoaiSP(
MaLoai char(10) primary key,
TenLoai nvarchar(50)

)
Create table SanPham(
MaSP char(10) primary key,
TenSP nvarchar(50),
HinhThucDongGoi nvarchar(50),
GiaTien money,
SoLuongTon int,
MaLoai char(10) references LoaiSP(MaLoai)
)
Create table HoaDon(
MaHD char(10) primary key,
NgayLap date,
TongTien money,
MaKH char(10) references KhachHang(MaKH),
MaNV char(10) references NhanVien(MaNV)
)
Create table KhachHang(
MaKH char(10) primary key,
HoTen nvarchar(50),
DiaChi nvarchar(50),
DienThoai int,
NamSinh date
)
Create table NhanVien(
MaNV char(10) primary key,
HoTen nvarchar(50),
DiaChi nvarchar(50),
NamSinh date
)
Create table CTHoaDon(
MaHD char(10) references HoaDon(MaHD),
MaSP char(10) references SanPham(MaSP),
SoLuong int,
GiaBan money,
 primary key (MaHD,MaSP)

)
---------
CREATE PROC ThemNhanVien( @MaNV char(10),
@HoTen nvarchar(50),
@DiaChi nvarchar(50),
@NamSinh date )
AS
begin
INSERT INTO NhanVien(MaNV,HoTen,DiaChi,NamSinh)
VALUES(@MaNV,@HoTen,@DiaChi,@NamSinh)
end

CREATE PROC SP_XoaPB
(
  @MaPB char(10)
)
AS
DELETE PhongBan
WHERE maPhong= @MaPB;

CREATE PROC SP_SuaPB
(
@MaPB char(10),
@TenPB nvarchar(50)
)
AS
UPDATE PhongBan
SET tenPhong = @TenPB
WHERE maPhong= @MaPB;