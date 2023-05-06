
 create table pesanan
     (id int auto_increment primary key,
     kd_produk varchar(10),
     qty int,
     harga varchar(50),
     id_pelanggan int (11));

-- pelanggan memesan didalam table pesanan
INSERT INTO pesanan (kd_produk,qty,harga,id_pelanggan) VALUES
    ('B001',3, 5000, 1),
    ('MB001',2, 5000, 3),
    ('P001',4, 5000, 1),
    ('PT001',1, 5000, 2);

-- dilanjutkan dengan proses pembayaran di table pembayaran
 create table pembayaran
     (id int auto_increment primary key,
     kd_produk varchar(10),
     qty int,
     harga varchar(50),
     id_pelanggan int (11),
     total varchar (50),
     keterangan varchar(50)
     );    

-- didalam table pembayaran tambahkan kolom status_pembayaran
     ALTER TABLE pembayaran ADD COLUMN status_pembayaran varchar(100); 

-- jika pesanan sudah dibayar maka status pembayaran akan berubah menjadi lunas 
-- Buatkan trigger dari skenario diatas, tambahkan kolom-kolom yang di perlukan untuk kebutuhan trigger 
delimiter $$
 create trigger status_pembayaran before insert on pembayaran
    for each row
    begin
    declare harga varchar(50);
    declare total int;
    declare sisa_pembayaran int;
    select total into harga from pesanan where id = new.pesanan_id;
    select sum(jumlah) into total from pembayaran where pesanan_id = new.pesanan_id;
    set sisa_pembayaran = harga - total;
    if sisa_pembayaran <= 0 then
    update pembayaran set status_pembayaran = 'Lunas' where id = new.id;
    else
    update pembayaran set status_pembayaran = 'Belum Lunas' where id = new.id;
    end if;
    end;
    $$

delimiter ;