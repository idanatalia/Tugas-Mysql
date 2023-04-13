-- Masuk kedalam Database
use dbtoko1;

-- Melihat Tabel
show tables;

-- Untuk menampilkan struktur type data pada tabel pelanggan
desc pelanggan;

-- Membuat Data pada tabel Pelanggan
INSERT INTO pelanggan (nama_pelanggan,kode,jk,tmp_lahir,tgl_lahir,email,kartu_id,alamat) VALUES
    -> ('Ida','001','P','Sepinggan','2002-12-20','idanataliasinaga20@gmail.com',100001,'Medan');

-- Menambah Data  pata tabel Pelanggan
INSERT INTO pelanggan (nama_pelanggan,kode,jk,tmp_lahir,tgl_lahir,email,kartu_id,alamat) VALUES
    -> ('Agnes','002','P','Marindal','2000-04-05','agnescecilia99@gmail.com',100002,'Surabaya'),
    -> ('Gunawan','003','L','Riau','2000-01-26','gunawansbr16@gmail.com',100003,'Riau'),
    -> ('Merida','004','P','Bekasi','1999-11-26','merida@gmail.com',100004,'Bekasi'),
    -> ('Ando','005','L','Tanggerang','2003-10-03','andofransiscogmail.com',100005,'Jakarta');

-- Melihat Data pada Tabel Pelanggan
select * from pelanggan;

-- Menambah Data pada tabel Pelanggan
INSERT INTO pelanggan (nama_pelanggan,kode,jk,tmp_lahir,tgl_lahir,email,kartu_id,alamat) VALUES
    -> ('Vani','006','P','Yogyakarta','2001-06-12','vanikusuma00@gmail.com',100006,'Yogyakarta'),
    -> ('Ripaldo','007','L','Padang','2002-05-12','ripaldo@gmail.com',100007,'Padang'),
    -> ('Agus','008','L','Jambi','2003-09-22','agustino@gmail.com',100008,'Jambi');

-- Melihat Data pada Tabel Pelanggan
select * from pelanggan;

-- Menambah Data pada tabel Pelanggan
INSERT INTO pelanggan (nama_pelanggan,kode,jk,tmp_lahir,tgl_lahir,email,kartu_id,alamat) VALUES
    -> ('Paula','009','P','Cempaka','2001-04-09','paula12@gmail.com',100009,'Medan'),
    -> ('Riko Syahputra','010','L','Riau','2001-06-13','riko@gmail.com',100010,'Riau');

-- Melihat Data pada Tabel Pelanggan
select * from pelanggan;

-- Untuk menampilkan struktur type data pada tabel Jenis_produk
desc jenis_produk;

-- Membuat Data tabel jenis_produk
INSERT INTO jenis_produk (nama) VALUES
    -> ('Buku'),
    -> ('Pulpen'),
    -> ('Papan Tulis');

-- Melihat Data pada tabel jenis_produk
select * from jenis_produk;

update pelanggan set nama_pelanggan='Nurhayani' where id=4;

-- Melihat Data pada tabel pelanggan
select * from pelanggan;

update pelanggan set tmp_lahir='Bekasi' where nama_pelanggan='Ripaldo';

-- Melihat Data pada tabel pelanggan
select * from pelanggan;
-- Untuk menampilkan struktur type data pada tabel produk
desc produk;

INSERT INTO produk (kode,nama,harga_beli,harga_jual,stok,min_stok,jenis_produk_id) VALUES
    -> ('0001','Buku',40000,50000,10,5,1);

-- Melihat Data pada tabel jenis_produk
select * from produk;

INSERT INTO produk (kode,nama,harga_beli,harga_jual,stok,min_stok,jenis_produk_id) VALUES
    -> ('0002','Pulpen',30000,50000,30,10,2),
    -> ('0003','Papan Tulis',73000,100000,20,10,3),
    -> ('0004','Meja Belajar',250000,300000,10,3,4),
    -> ('0005','Kamus',150000,200000,10,7,6);

-- Melihat Data pada tabel jenis_produk
select * from produk;

update produk set kode='B001' where id=1;
update produk set kode='KM001' where id=2;
update produk set kode='M001' where id=3;
update produk set kode='T001' where id=4;
update produk set kode='TK001' where id=5;
update produk set kode='TR001' where id=6;

-- Melihat Data pada tabel jenis_produk
select * from produk;


----------------------------------------------------------------------------------------------------

-- 2.	Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
select * from produk order by harga_jual desc;

-- 3.	Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
select kode,nama_pelanggan,tmp_lahir,tgl_lahir from pelanggan;

-- 4.	Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
select * from pelanggan limit 2 offset 4;

-- 5.	Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
select * from pelanggan where tmp_lahir='Jakarta';

-- 6.	Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
select kode,nama_pelanggan,tmp_lahir,tgl_lahir from pelanggan order by tgl_lahir desc;

----------------------------------------------------------------------------------------------

-- 1.	Tampilkan data produk yang stoknya 3 dan 10
select * from produk where stok=3 or stok=10;

-- 2.	Tampilkan data produk yang harga jualnya kurang dari 500 ribu tetapi lebih dari 50 ribu
select * from produk where harga_jual < 500000 and harga_jual > 50000;

-- 3.	Tampilkan data produk yang harus segera ditambah stoknya
select * from produk where min_stok > stok;

-- 4.	Tampilkan data pelanggan mulai dari yang paling muda
 select * from pelanggan order by tgl_lahir desc;

--  5.	Tampilkan data pelanggan yang lahirnya di jakarta dan gendernya perempuan 
select * from pelanggan WHERE tmp_lahir='Jakarta' and jk='P';

-- 6.	Tampilkan data pelanggan yang ID nya 2, 4 dan 6
select * from pelanggan where id in (2,4,6);

-- 7.	7.	Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
select * from produk where harga_jual >= 500000 AND harga_jual<= 6000000;
 

------------------------------------------------------------------------------------------------------
-- 1.	Tampilkan produk yang kode awalnya huruf K dan huruf M
select * from produk where kode like 'K%' or kode like 'M%';

-- 2.	Tampilkan produk yang kode awalnya bukan huruf M
select * from produk where not kode like'M%';

select * from produk order by harga_beli desc limit 2;

-- 3.	Tampilkan produk-produk televisi
 select * from produk where nama='televisi';

-- 4.	Tampilkan pelanggan mengandung huruf 'SA'
select * from pelanggan where nama_pelanggan like '%SA%';

-- 5.	Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘

select * from pelanggan where not alamat='jakarta' and not alamat like'%yo%';

-- 6.	Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
select * from pelanggan where nama_pelanggan like'_A%';

---------------------------------------------------------------------------------------------------------
-- 1.	Tampilkan 2 data produk termahal
select * from produk order by harga_beli desc limit 2;

-- 2.	Tampilkan produk yang paling murah
select min(harga_beli) from produk;
select min(harga_jual) from produk;

-- 3.	Tampilkan produk yang stoknya paling banyak
select max(stok) from produk;

-- 4.	Tampilkan dua produk yang stoknya paling sedikit
select min(stok) from produk;

-- 5.	Tampilkan pelanggan yang paling muda
select * from pelanggan order by tgl_lahir desc limit 1;
-- 6.	Tampilkan pelanggan yang paling tua
select * from pelanggan order by tgl_lahir asc limit 1;

