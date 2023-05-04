   select produk.*, jenis_produk.nama as jenis from jenis_produk inner join produk
    -> on produk.jenis_produk_id = jenis_produk.id;
  
  select p.*, j.nama as jenis from jenis_produk j inner join produk p on p.jenis_produk_id =j.id;

  create view detail_produk_vw as
    -> select p.*, j.nama as jenis from jenis_produk j inner join produk p on p.jenis_produk_id = j.id;

    select * from detail_produk_vw;

    create view tampil_produk as select nama from produk;

    select * from tampil_produk;

    show full tables;

  start transaction; 

  insert into pesanan(tanggal, total, pelanggan_id)  values
    -> (2023-02-01,200000,1);

  commit;

  select * from pesanan;

  start transaction;

  delete from pesanan;

  rollback;

  select * from pesanan;

  start transaction;

  savepoint update_tanggal;

  update pesanan set tanggal='2023-03-03' where id=1;
  
   select * from pesanan;

   commit;

   DELIMITER $$

   select * from produk$$

   create procedure showproduk()
   begin
   select nama,harga_beli,harga_jual from produk;
   end $$

    call showproduk()$$


  
--   Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
 create procedure inputpelanggans()
    -> begin
    -> select nama_pelanggan, kode, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat from pelanggan;
    -> end
    -> $$
-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
create procedure showPelanggans()
    -> begin
    -> select id, nama_pelanggan, kode, jk, email, kartu_id, alamat from pelanggan;
    -> end
    -> $$

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
create procedure inputproduks()
    -> begin
    -> select kode, nama, harga_beli, harga_jual, stok, min_stok from produk;
    -> end
    -> $$
-- Buat fungsi showProduk(), setelah itu panggil fungsinya
 create procedure showproduks()
    -> begin
    -> select nama, harga_beli, harga_jual from produk;
    -> end
    -> $$

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
create procedure totalPesanan()
     begin
     select pelanggan_id, total, tanggal from pesanan;
     end
     $$
-- tampilkan seluruh pesanan dari semua pelanggan
     call totalPesanan()$$
-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
create view pesanan_produk_vw as
    -> select p.*, p.nama as pesanan from pelanggan p inner join produk p on p.pelanggan_id = p.id;


