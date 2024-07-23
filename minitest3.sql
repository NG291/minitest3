create database minitest3;
use  minitest3;
CREATE TABLE VatTu (
    id INT AUTO_INCREMENT UNIQUE,
    Ma_VT VARCHAR(50),
    Ten_VT VARCHAR(50),
    Don_Vi_Tinh VARCHAR(3),
    Gia DOUBLE,
    PRIMARY KEY (Ma_VT)
);
CREATE TABLE Tonkho (
    id INT AUTO_INCREMENT UNIQUE,
    Ma_VT VARCHAR(50),
    so_luong_dau INT,
    Tong_so_luong_nhap INT,
    Tong_so_luong_xuat INT,
    FOREIGN KEY (Ma_VT) REFERENCES VatTu (Ma_VT)
);
CREATE TABLE NhaCungCap (
    id INT AUTO_INCREMENT UNIQUE,
    Ma_Nha_Cung_Cap VARCHAR(50),
    Ten_Nha_Cung_Cap VARCHAR(50),
    Dia_Chi VARCHAR(50),
    DienThoai VARCHAR(10) UNIQUE,
    PRIMARY KEY (Ma_Nha_Cung_Cap)
);
CREATE TABLE DonDH (
    id INT AUTO_INCREMENT UNIQUE,
    Ma_DH VARCHAR(50),
    Ngay_DH DATE NOT NULL,
    Ma_Nha_Cung_Cap VARCHAR(50),
    PRIMARY KEY (MD_DH),
    FOREIGN KEY (Ma_Nha_Cung_Cap) REFERENCES NhaCungCap (Ma_Nha_Cung_Cap)
);
CREATE TABLE PhieuNhap (
    id INT AUTO_INCREMENT UNIQUE,
    So_Phieu_Nhap VARCHAR(50),
    Ngay_Nhap DATE,
    Ma_DH VARCHAR(50),
    PRIMARY KEY (So_Phieu_Nhap),
    FOREIGN KEY (So_DH) REFERENCES DonDH (Ma_DH)
);
CREATE TABLE PhieuXuat (
    id INT AUTO_INCREMENT UNIQUE,
    So_Phieu_Xuat VARCHAR(50),
    Ngay_Xuat DATE,
    Ten_kH VARCHAR(50),
    PRIMARY KEY (So_Phieu_Xuat)
);
CREATE TABLE CTDonHang (
    id INT AUTO_INCREMENT,
    Ma_DH VARCHAR(50),
    Ma_VT VARCHAR(50),
    So_luong_Dat INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (Ma_DH) REFERENCES DonDH (Ma_DH),
    FOREIGN KEY (Ma_VT) REFERENCES VatTu (Ma_VT)
); 
CREATE TABLE CTPhieuNhap (
    id INT AUTO_INCREMENT,
    So_Phieu_Nhap VARCHAR(50),
    Ma_VT VARCHAR(50),
    Don_Gia_Nhap DOUBLE,
    GhiChu VARCHAR(250),
    primary key (id),
    FOREIGN KEY (So_Phieu_Nhap) REFERENCES PhieuNhap (So_Phieu_Nhap),
    FOREIGN KEY (Ma_VT) REFERENCES VatTu (Ma_VT)
);
alter table ctphieuNhap add COLUMN So_luong_Nhap int;
CREATE TABLE CTPhieuXuat (
    id INT AUTO_INCREMENT,
    So_Phieu_Xuat VARCHAR(50),
    Ma_VT VARCHAR(50),
    So_Luong_Xuat INT,
    Don_Gia_Xuat DOUBLE,
    Ghichu VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (So_Phieu_Xuat) REFERENCES PhieuXuat (So_Phieu_Xuat),
    FOREIGN KEY (Ma_VT) REFERENCES VatTu (Ma_VT)
);
##################################################################################
INSERT INTO VatTu (Ma_VT,Ten_VT,Don_Vi_Tinh,Gia) VALUES
('VT101', 'Flying Car', 'c', 10000),
('VT102', 'Jet Pack', 'c', 15000),
('VT103', 'Hoverboard', 'c', 8000),
('VT104', 'Teleportation Device', 'c', 20000),
('VT105', 'Invisibility Cloak', 'c', 12000),
('VT106', 'Laser Gun', 'c', 5000),
('VT107', 'Time Machine', 'c', 30000),
('VT108', 'Anti-Gravity Boots', 'c', 7000),
('VT109', 'Nano Suit', 'c', 25000),
('VT110', 'Quantum Computer', 'c', 35000);

INSERT INTO TonKho (Ma_VT, so_luong_dau, Tong_so_luong_nhap , Tong_so_luong_xuat) VALUES
('VT101', 20, 3, 4),
('VT102', 15, 5, 2),
('VT103', 10, 2, 1),
('VT101', 25, 8, 6),
('VT105', 30, 10, 7);

INSERT INTO NhaCungCap (Ma_Nha_Cung_Cap, Ten_Nha_Cung_Cap,Dia_Chi,DienThoai) VALUES
('NCC001', 'Vinamilk USA', 'number 10, Haland Strt, NY, USA', '0948844900'),
('NCC002', 'Nestle Canada', '12 Queen Street, Toronto, Canada', '9051234567'),
('NCC003', 'Danone France', '34 Rue de la Paix, Paris, France', '3312345679');

INSERT INTO DonDH  (Ma_DH, Ngay_DH , Ma_Nha_Cung_Cap) VALUES
('ORD001', '2012-12-01','NCC001'),
('ORD002', '2013-11-01','NCC002'),
('ORD003', '2014-10-01','NCC003'),
('ORD004', '2015-9-01','NCC001'),
('ORD005', '2016-8-01','NCC002');

INSERT INTO PhieuXuat ( So_Phieu_Xuat, Ngay_Xuat, Ten_kH ) VALUES
('SPX001', '2012-05-08', 'Nguyen'),
('SPX002', '2013-06-15', 'Phong'),
('SPX003', '2014-07-20', 'Chien');
INSERT INTO PhieuNhap (So_Phieu_Nhap , Ngay_Nhap, Ma_DH) VALUES
('SPN001','2012-08-08', 'ORD001'),
('SPN002',' 2013-09-10','ORD005' ),
('SPN003','2014-10-15', 'ORD004');
INSERT INTO CTDonHang (Ma_DH ,Ma_VT, So_luong_Dat) VALUES
('ORD001', 'VT101', 7),
('ORD002', 'VT102', 5),
('ORD004', 'VT103', 12),
('ORD003', 'VT104', 8),
('ORD002', 'VT105', 15);
INSERT INTO CTPhieuNhap(So_Phieu_Nhap, Ma_VT,Don_Gia_Nhap, GhiChu, So_luong_Nhap ) VALUES
('SPN001', 'VT104', 8, 'Something funny happened during unpacking!',12),
('SPN002', 'VT102', 10, 'Our delivery team made a dance party with your package!',13),
('SPN003', 'VT103',7, 'The package was so excited it almost jumped out of the truck!',14),
('SPN001', 'VT104',9, 'We added extra bubble wrap for some popping fun!',15),
('SPN003', 'VT105',12, 'Your shipment is practicing its stand-up comedy!',16),
('SPN002', 'VT106',6, 'We think your package might be telling jokes!',13);

INSERT INTO CTPhieuXuat (So_Phieu_Xuat,Ma_VT, So_luong_Xuat, Don_Gia_Xuat, GhiChu) VALUES
('SPX001', 'VT101', 8, 8.5, 'Something funny happened during packing!'),
('SPX002', 'VT102', 10, 7.0, 'The goods might come with a surprise dance move!'),
('SPX003', 'VT103', 5, 9.2, 'We added extra stickers just for fun!'),
('SPX001', 'VT104', 12, 6.5, 'Your items are practicing their juggling skills!'),
('SPX002', 'VT105', 7, 8.0, 'Expect a package that might sing!'),
('SPX003', 'VT106', 9, 8.7, 'Your shipment decided to take a scenic route!');
INSERT INTO CTPhieuXuat (So_Phieu_Xuat,Ma_VT, So_luong_Xuat, Don_Gia_Xuat, GhiChu) VALUES
('SPX001', 'VT101', 9, 10, 'Something funny happened during packing!');
# Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
    SELECT 
        So_Phieu_Nhap,
        Ma_VT,
        So_Luong_Nhap,
        Don_Gia_Nhap,
        So_Luong_Nhap * Don_Gia_Nhap AS Thanh_tien_Nhap
    FROM
        CTPhieuNhap;
#  Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT AS
    SELECT 
        ctpn.So_Phieu_Nhap,
       ctpn. Ma_VT,
       vt.Ten_VT,
        ctpn.So_Luong_Nhap,
        ctpn.Don_Gia_Nhap,
        ctpn.So_Luong_Nhap * ctpn.Don_Gia_Nhap AS Thanh_Tien_Nhap
    FROM
        CTPhieuNhap as ctpn,
        VatTu as vt
    WHERE
    ctpn.Ma_VT = vt.Ma_VT;
    # Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT_PN AS
    SELECT 
	   ctpn.So_Phieu_Nhap,
	   pn.Ngay_Nhap,
	   pn.Ma_DH,
	   ctpn. Ma_VT,
       vt.Ten_VT,
	   ctpn.So_Luong_Nhap,
	   ctpn.Don_Gia_Nhap,
	   ctpn.So_Luong_Nhap * ctpn.Don_Gia_Nhap AS Thanh_Tien_Nhap
    FROM
        CTPhieuNhap as ctpn,
        VatTu as vt,
        PhieuNhap as pn
    WHERE
      ctpn.Ma_VT = vt.Ma_VT and ctpn.So_Phieu_Nhap= pn.So_Phieu_Nhap;
      # Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
    SELECT 
	   ctpn.So_Phieu_Nhap,
	   pn.Ngay_Nhap,
	   pn.Ma_DH,
       DDH.Ma_Nha_Cung_Cap,
	   ctpn. Ma_VT,
       vt.Ten_VT,
	   ctpn.So_Luong_Nhap,
	   ctpn.Don_Gia_Nhap,
	   ctpn.So_Luong_Nhap * ctpn.Don_Gia_Nhap AS Thanh_Tien_Nhap
    FROM
        CTPhieuNhap as ctpn,
        VatTu as vt,
        PhieuNhap as pn,
        DonDH as DDH
    WHERE
      ctpn.Ma_VT = vt.Ma_VT and ctpn.So_Phieu_Nhap= pn.So_Phieu_Nhap and pn.Ma_DH= DDH.Ma_DH;
      # Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
    SELECT 
        So_Phieu_Nhap,
        Ma_VT,
        So_Luong_Nhap,
        Don_Gia_Nhap,
        So_Luong_Nhap * Don_Gia_Nhap AS Thanh_tien_Nhap
    FROM
        CTPhieuNhap
        where  so_Luong_Nhap >12 ;
   
   #  Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
    SELECT 
        ctpn.So_Phieu_Nhap,
        ctpn. Ma_VT,
        vt.Ten_VT,
        ctpn.So_Luong_Nhap,
        ctpn.Don_Gia_Nhap,
        ctpn.So_Luong_Nhap * ctpn.Don_Gia_Nhap AS Thanh_Tien_Nhap
    FROM
        CTPhieuNhap as ctpn,
        VatTu as vt
    WHERE
     ctpn.Ma_VT = vt.Ma_VT and
	 vt.Don_Vi_Tinh= 'Bo';
   
    #  Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
    SELECT 
        So_Phieu_Xuat,
        Ma_VT,
        So_luong_Xuat,
        Don_Gia_Xuat,
        So_Luong_Xuat * Don_Gia_Xuat AS Thanh_Tien_Xuat
    FROM
        ctphieuxuat; 
        # Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT as
select 
		ctpx.So_Phieu_Xuat,
		vt.Ma_VT,
        vt.Ten_VT,
        ctpx.So_luong_Xuat,
        ctpx.Don_Gia_Xuat,
        ctpx.So_Luong_Xuat * ctpx.Don_Gia_Xuat AS Thanh_Tien_Xuat from  ctphieuxuat  as ctpx , vattu as vt
        where ctpx.Ma_VT= vt.Ma_VT;
        # Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
        create view vw_CTPXUAT_VT_PX as
        select 
        ctpx.So_Phieu_Xuat,
        px.Ten_KH,
		vt.Ma_VT,
        vt.Ten_VT,
        ctpx.So_luong_Xuat,
        ctpx.Don_Gia_Xuat
        from
        ctphieuxuat  as ctpx , vattu as vt, PhieuXuat as px
		WHERE ctpx.Ma_VT= vt.Ma_VT and ctpx.So_Phieu_Xuat = px.So_Phieu_Xuat;
        #. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
   
      #  Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
       DELIMITER //

CREATE PROCEDURE TongTienXuat(
    IN Ma_vtout VARCHAR(50), 
    OUT total INT
)
BEGIN
    SELECT sum( So_luong_Xuat * Don_Gia_Xuat) INTO total 
    FROM ctphieuxuat 
    WHERE Ma_VT = Ma_vtout;
END //

DELIMITER ;

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS TongTienXuat;

-- Call the procedure and store the result in the variable @total
CALL TongTienXuat('VT101', @total);

-- Select the result
SELECT @total;

SELECT * FROM ctphieuxuat WHERE Ma_VT = 'VT101';

#Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.

Delimiter //
create procedure TongSoLuongDH(
 Ma_DH_IN varchar(50),
 out total int)
begin 
select sum(ctdh.So_Luong_Dat) into total
 from ctdonhang as ctdh 
 where  ctdh.Ma_DH=Ma_DH_IN;
end //
delimiter ;
call TongSoLuongDH ('ORD002',@total);
select @total;

# Tạo SP dùng để thêm một đơn đặt hàng
DELIMITER //

CREATE PROCEDURE SETSoLuongDH(
    IN Ma_DH_IN VARCHAR(50), 
    OUT total INT,
    INOUT counter INT
)
BEGIN 
    SELECT SUM(ctdh.So_Luong_Dat + counter) INTO total
    FROM ctdonhang AS ctdh 
    WHERE ctdh.Ma_DH = Ma_DH_IN;
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS SETSoLuongDH;
SET @counter = 1;
CALL SETSoLuongDH('ORD001', @total, @counter);
SELECT @total;
SELECT @counter;
