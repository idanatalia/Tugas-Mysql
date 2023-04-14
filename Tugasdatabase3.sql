use dbtoko1;
select * from  produk;

select kode,nama,stok,
    -> case
    -> when stok >= 3 then 'cukup'
    -> else 'kurang'
    -> end as keterangan
    -> from produk;
    
     select * from produk;
 
 
select * from jenis_produk;

desc jenis_produk;

select
    -> case
    -> when jenis_produk_id = 1 then 'Buku'
    -> when jenis_produk_id = 2 then 'Pulpen'
    -> when jenis_produk_id = 3 then 'Papan Tulis'
    -> when jenis_produk_id = 4 then 'Meja Belajar'
    -> when jenis_produk_id = 5 then 'Kamus'
    -> when jenis_produk_id = 6 then 'Kursi'
    -> when jenis_produk_id = 7 then 'Televisi'
    -> end as kategori, sum(stok) as jumlah from produk group by jenis_produk_id;

select jenis_produk_id, sum(stok) as total_stok from produk group by jenis_produk_id;

select jenis_produk_id, sum(stok) as total_stok from produk group by jenis_produk_id;

update jenis_produk set keterangan = 'Tersedia' where id=1;

update jenis_produk set keterangan = 'Tersedia' where id=2,

update jenis_produk set keterangan = 'Tidak Tersedia' where id=3,

update jenis_produk set keterangan = 'Tersedia' where id=4,

update jenis_produk set keterangan = 'Tersedia' where id=5,

update jenis_produk set keterangan = 'Tidak Tersedia' where id=6,

update jenis_produk set keterangan = 'Tersedia' where id=7;

select stok, count(stok) as jml_stok from produk
    -> group by stok having sum(stok) > 2;



select * from jenis_produk;

select * from produk;
-- 1.	Tampilkan produk yang asset nya diatas 20jt
select * from produk where harga_beli * stok > 20000000; 

-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
select sum(stok - min_stok) as selisih from produk;

-- 3.	Tampilkan total asset produk secara keseluruhan
select sum(stok) as total_asset from produk;

-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
select * from pelanggan where year(tgl_lahir) between 1999 and 2004;

-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
select * from pelanggan where year(tgl_lahir) = 1998;

-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
 select * from pelanggan where month(tgl_lahir) = 08;

-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
select nama_pelanggan,tmp_lahir,tgl_lahir,(year(now())-year(tgl_lahir)) as umur from pelanggan;

-----------------------------------------------------------------------------------------------------------------------------------


-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
select sum(year(tgl_lahir)=1998) as jumlah from pelanggan;

-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
SELECT count(nama_pelanggan)  as jumlah from pelanggan WHERE tmp_lahir='jakarta' AND jk='P';

-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
select count(stok) as jumlah from produk where harga_jual <10000;

-- 4.	Ada berapa produk yang mempunyai kode awal K
select count(kode) as jumlah from produk where kode like'K%'; 

-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
select avg(harga_jual) as rata_rata from produk where harga_jual >1000000;

-- 6.	Tampilkan jumlah stok yang paling besar
select max(stok) as jumlah_stok from produk;

-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
select sum(min_stok < stok ) as jumlah from produk;

-- 8.	Berapa total asset dari keseluruhan produk
select sum(stok) as total_asset from produk;

---------------------------------------------------------------------------------------------------------------------

-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
select id,nama,stok,
case 
when stok > min_stok then 'stok aman'
else 'segera belanja'
end as informasi from produk; 

-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
select id,nama_pelanggan,(year(now())-year(tgl_lahir)) as umur,
case
when (year(now())-year(tgl_lahir))<17 then "muda"
when  (year(now())-year(tgl_lahir)) between 17 and 55 then 'dewasa'
else 'tua'
end as kategori_umur
from pelanggan;

-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
select 
id, kode, nama , case(kode) when 'TV01' then 'DVD Player' 
when 'K001' then 'Rice Cooker' 
else 'Tidak Ada' end as bonus from produk;
--------------------------------------------------------------------------------------------------------------------

-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
select tmp_lahir, count(*) as jumlah from pelanggan group by tmp_lahir;

-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
select jenis_produk_id, count(*) as jumlah from produk group by jenis_produk_id;

-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
select kode, nama_pelanggan, jk, year(now()) - year(tgl_lahir) as umur from pelanggan where year(now()) - year(tgl_lahir) < (select avg(year(now()) - year(tgl_lahir)) from pelanggan);

-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
select kode, nama, stok, harga_jual from produk where harga_jual > (select avg(harga_jual) from produk);

-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
select nama_pelanggan, kartu_id as kartu from pelanggan where kartu_id in (select id from kartu where iuran> 90000);

-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
select kode, nama, stok, harga_jual from produk where harga_jual < (select avg(harga_jual) from produk);

-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
select nama_pelanggan, kartu_id as kartu from pelanggan where kartu_id in (select id from kartu where diskon > 0.03);







