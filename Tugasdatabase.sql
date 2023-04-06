-- 1. MemMembuat Database 
create database dbpos;
-- 2. Masuk kedalam Database
use dbpos;
-- 3.	Membuat table kartu
 create table kartu(
     id int auto_increment primary key,
     kode varchar(6) unique,
     nama varchar(30) not null,
     diskon double,
     iuran double);

-- 4.	Membuat table pelanggan
 create table pelanggan(
     id int auto_increment primary key,
     kode varchar(10) unique,
     nama varchar(45),
     jk char(1),
     tmp_lahir varchar(30),
     tgl_lahir date,
     email varchar(45),
     kartu_id int not null references kartu(id));

-- 5.	Membuat table pesanan
 create table pesanan(
     id int not null auto_increment primary key,
     tanggal date,
     total double,
     pelanggan_id int not null references pelanggan(id));

-- 6.	Membuat table Pembayaran
 create table pembayaran(
     id int not null auto_increment primary key,
     nokuitansi varchar(10) unique,
     tanggal date,
     jumlah double,
     ke int,
     pesanan_id int not null references pesanan(id));
-- 7.	Membuat table Jenis_produk
 create table jenis_produk(
     id int not null auto_increment primary key,
     nama varchar(45));

-- 8. Membuat table produk
 create table produk(
     id int auto_increment primary key,
     kode varchar(10) unique,
     nama varchar(45),
     harga_beli double,
     harga_jual double,
     stok int(11),
     min_stok int(11),
     jenis_produk_id int not null references jenis_produk(id));;

    --  9. Membuat table pesanan_items
    create table pesanan_items(
     id int auto_increment primary key,
     qty int(11),
     harga double,
     jk char(1),
     produk_id int not null references produk(id),
     pesanan_id int not null references pesanan(id));

    --  10. Membuat table vendor

     create table vendor(
     id int auto_increment primary key,
     nomor varchar(4) unique,
     nama varchar(40) not null,
     kota varchar(30) not null,
     kontak varchar(30) not null);

-- 11. Membuat table pembelian
 create table pembelian(
     id int auto_increment primary key,
     tanggal date,
     nama varchar(10),
     jumlah int(11),
     harga double,
     stok int(11),
     min_stok int(11),
     produk_id int not null references produk(id),
     vendor_id int not null references vendor(id));

--  12. Menambah kolom alamat pada tabel pelanggan
alter table pelanggan 
add column if not exists
alamat varchar(40);

-- 13. nama kolum pada suatu tabel pelanggan
alter table pelanggan
change nama nama_pelanggan varchar(45) not null unique;

-- 14. Merubah type data pada tabel pelanggan
alter table pelanggan
modify nama_pelanggan varchar(50)
after id;