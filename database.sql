

CREATE TABLESPACE nicholas_06977
datafile 'D:\PRATIKUM SMT 4\MODUL 1\nicholas_06977.dbf'
size 30M;



CREATE USER nicholassumardi_06977
IDENTIFIED BY nicholas
DEFAULT TABLESPACE nicholas_06977
QUOTA 30M ON nicholas_06977;



GRANT ALL PRIVILEGES TO nicholassumardi_06977;


conn nicholassumardi_06977/nicholas

create table cabang_06977
(
id_cabang          INTEGER         not null,
nama_cabang        VARCHAR2(50),
nama_jalan         VARCHAR2(50),
constraint PK_cabang primary key (id_cabang)
);



create table pegawai_06977
(
id_pegawai         INTEGER         not null,
nama_pegawai       VARCHAR2(50),
password           VARCHAR2(50),
constraint PK_pegawai primary key (id_pegawai)
);



create table pesanan_06977
(
id_pesanan         INTEGER         not null,
no_pesanan         NUMBER(9),
constraint PK_pesanan primary key (id_pesanan)
);

Table created.

create table menu_06977
(
id_menu            INTEGER         not null,
nama_menu          VARCHAR2(50),
harga              NUMBER(9),
constraint PK_menu primary key (id_menu)
);



create table pembayaran_06977
(
id_pembayaran      INTEGER         not null,
bayar              NUMBER(9),
kembalian          NUMBER(9),
quantity           NUMBER(9),
total              NUMBER(9),
constraint PK_pembayaran primary key (id_pembayaran)
);



create table detailpembelian_06977
(
id_pesanan         INTEGER         not null,
id_menu            INTEGER         not null
);



alter table pegawai_06977 add(id_cabang INTEGER);



alter table pesanan_06977 add(id_pegawai INTEGER);



alter table pembayaran_06977 add(id_pegawai INTEGER);


alter table pesanan_06977 add(id_pembayaran INTEGER);



alter table pembayaran_06977 add(id_pesanan INTEGER);



alter table pegawai_06977
add constraint FK_id_cabang FOREIGN KEY(id_cabang)
references cabang_06977 (id_cabang);



alter table pesanan_06977
add constraint FK_id_pegawai FOREIGN KEY(id_pegawai)
references pegawai_06977(id_pegawai);



alter table pembayaran_06977
add constraint FK_id_pegawai2 FOREIGN KEY(id_pegawai)
references pegawai_06977(id_pegawai);



alter table detailpembelian_06977
add constraint FK_id_pesanan FOREIGN KEY(id_pesanan)
references pesanan_06977(id_pesanan)
add constraint FK_id_menu FOREIGN KEY(id_menu)
references menu_06977(id_menu);



alter table pesanan_06977
add constraint FK_id_pembayaran FOREIGN KEY(id_pembayaran)
references pembayaran_06977(id_pembayaran);



alter table pembayaran_06977
add constraint FK_id_pesanan2 FOREIGN KEY(id_pesanan)
references pesanan_06977(id_pesanan);



create sequence id_cabang
minvalue 1
maxvalue 9999
start with 1
increment by 1
cache 20;




alter table pegawai_06977 rename column password to password_06977;



alter table pegawai_06977
ADD CONSTRAINT unique_nama UNIQUE (nama_pegawai);



alter table menu_06977 modify(nama_menu VARCHAR(40));




create sequence id_cabang
minvalue 1
maxvalue 9999
start with 6
increment by 1
cache 20;

create sequence id_pegawai
minvalue 1
maxvalue 9999
start with 6
increment by 1
cache 20;

create sequence id_menu
minvalue 1
maxvalue 9999
start with 6
increment by 1
cache 20;


create sequence id_pesanan
minvalue 1
maxvalue 9999
start with 6
increment by 1
cache 20;

create sequence id_pembayaran
minvalue 1
maxvalue 9999
start with 6
increment by 1
cache 20;



insert into cabang_06977 values (1, 'Wakaka', 'Boboh');
insert into cabang_06977 values (2, 'Wikiki', 'Rungkut');



insert all
into cabang_06977 values (3, 'Wehehe', 'Peneleh')
into cabang_06977 values (4, 'Wuhuhu', 'Penjaringan')
into cabang_06977 values (5, 'Wohoho', 'Waru')
select 1 from dual;


insert into cabang_06977 values (id_cabang.NEXTVAL, 'Weieiei', 'Rungkut');
insert into cabang_06977 values (id_cabang.NEXTVAL, 'Wohoho', 'Waru');
insert into cabang_06977 values (id_cabang.NEXTVAL, 'Wowowo', 'Wiyung');
insert into cabang_06977 values (id_cabang.NEXTVAL, 'Wehehe', 'Peneleh');
insert into cabang_06977 values (id_cabang.NEXTVAL, 'Wuhuhu', 'Penjaringan');



insert into pegawai_06977 values (1, 'Adi', '12345', '1');
insert into pegawai_06977 values (2, 'Bima', '23451', '2');


insert all
into pegawai_06977 values (3, 'Nico', '34512', '3')
into pegawai_06977 values (4, 'Zen', '45123', '4')
into pegawai_06977 values (5, 'Restu', '51234', '5')
select 1 from dual;


insert into pegawai_06977 values (id_pegawai.NEXTVAL, 'Daffa', '123456', '6');
insert into pegawai_06977 values (id_pegawai.NEXTVAL, 'Kezia', '234561', '7');
insert into pegawai_06977 values (id_pegawai.NEXTVAL, 'Supriadi', '345612', '8');
insert into pegawai_06977 values (id_pegawai.NEXTVAL, 'Jess', '456123', '9');
insert into pegawai_06977 values (id_pegawai.NEXTVAL, 'Limit', '561234', '10');



insert into menu_06977 values (1, 'Sate', '17000');
insert into menu_06977 values (2, 'Ayam Geprek', '15000');



insert all
into menu_06977 values (3, 'Sego Campur', '16000')
into menu_06977 values (4, 'Mochacino', '12000')
into menu_06977 values (5, 'Lemon Tea', '11000')
select 1 from dual;


insert into menu_06977 values (id_menu.NEXTVAL, 'Lontong', '2000');
insert into menu_06977 values (id_menu.NEXTVAL, 'Sambalado', '20000');
insert into menu_06977 values (id_menu.NEXTVAL, 'Terong', '5000');
insert into menu_06977 values (id_menu.NEXTVAL, 'Brambang', '500');
insert into menu_06977 values (id_menu.NEXTVAL, 'Lele', '10000');



insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (1, '1', '1');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (2, '2', '2');



insert all
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (3, '3', '3')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (4, '4', '4')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (5, '5', '5')
select 1 from dual;



insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (id_pesanan.NEXTVAL, '6', '6');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (id_pesanan.NEXTVAL, '7', '7');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (id_pesanan.NEXTVAL, '8', '8');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (id_pesanan.NEXTVAL, '9', '9');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (id_pesanan.NEXTVAL, '10', '10');



insert into pembayaran_06977 values (1, '20000', '3000', '1', '17000', '1', '1');
insert into pembayaran_06977 values (2, '35000', '5000', '2', '30000', '2', '2');


insert all
into pembayaran_06977 values (3, '50000', '2000', '3', '48000', '3', '3')
into pembayaran_06977 values (4, '61000', '1000', '4', '60000', '4', '4')
into pembayaran_06977 values (5, '70000', '4000', '5', '66000', '5', '5')
select 1 from dual;


insert into pembayaran_06977 values (id_pembayaran.NEXTVAL, '100000', '10000', '6', '90000', '6', '6');
insert into pembayaran_06977 values (id_pembayaran.NEXTVAL, '135000', '11000', '7', '124000', '7', '7');
insert into pembayaran_06977 values (id_pembayaran.NEXTVAL, '150000', '12000', '8', '148000', '8', '8');
insert into pembayaran_06977 values (id_pembayaran.NEXTVAL, '140000', '13000', '9', '127000', '9', '9');
insert into pembayaran_06977 values (id_pembayaran.NEXTVAL, '170000', '14000', '10', '156000', '10', '10');




insert into detailpembelian_06977 values ('1', '1');
insert into detailpembelian_06977 values ('2', '2');


insert all
into detailpembelian_06977 values ('3', '3')
into detailpembelian_06977 values ('4', '4')
into detailpembelian_06977 values ('5', '5')
into detailpembelian_06977 values ('6', '6')
into detailpembelian_06977 values ('7', '7')
into detailpembelian_06977 values ('8', '8')
into detailpembelian_06977 values ('9', '9')
into detailpembelian_06977 values ('10', '10')
select 1 from dual;


select * from menu_06977;
update menu_06977 set harga = harga/2;
select * from menu_06977;


select * from pesanan_06977;

UPDATE pesanan_06977 set id_pembayaran = '1' where id_pesanan = 1;

UPDATE pesanan_06977 set id_pembayaran = '2' where id_pesanan = 2;

UPDATE pesanan_06977 set id_pembayaran = '3' where id_pesanan = 3;

UPDATE pesanan_06977 set id_pembayaran = '4' where id_pesanan = 4;

UPDATE pesanan_06977 set id_pembayaran = '5' where id_pesanan = 5;

select * from pesanan_06977;


select * from pegawai_06977;

update pegawai_06977 set nama_pegawai = 'Kiki' where nama_pegawai like '%Ad%';

update pegawai_06977 set nama_pegawai = 'Dika' where nama_pegawai like '%Bim%';

update pegawai_06977 set nama_pegawai = 'Dumbo' where nama_pegawai like '%N%';

update pegawai_06977 set nama_pegawai = 'Wika' where nama_pegawai like '%Z%';

update pegawai_06977 set nama_pegawai = 'Wesley' where nama_pegawai like '%Res%';

select * from pegawai_06977;


select * from pembayaran_06977;

update pembayaran_06977 set kembalian = '1000' where (id_pembayaran = 1 OR id_pegawai = 1) AND id_pesanan = 1;

update pembayaran_06977 set kembalian = '2000' where (id_pembayaran = 2 OR id_pegawai = 2) AND id_pesanan = 2;

update pembayaran_06977 set kembalian = '3000' where (id_pembayaran = 3 OR id_pegawai = 3) AND id_pesanan = 3;

update pembayaran_06977 set kembalian = '4000' where (id_pembayaran = 4 OR id_pegawai = 4) AND id_pesanan = 4;

update pembayaran_06977 set kembalian = '5000' where (id_pembayaran = 5 OR id_pegawai = 5) AND id_pesanan = 5;

select * from pembayaran_06977;


select * from pembayaran_06977;

delete from pembayaran_06977 where id_pembayaran >= 8 AND kembalian < 13000;

delete from pembayaran_06977 where quantity < 10 AND id_pembayaran BETWEEN 9 AND 10;

delete from pembayaran_06977 where id_pembayaran = 6 OR total = 90000;

select * from pembayaran_06977;




SAVEPOINT savepoint_01;

select * from menu_06977;

update menu_06977 SET nama_menu = 'Kambing', harga = '23000' WHERE id_menu = 3;

select * from menu_06977;


COMMIT;



ROLLBACK TO savepoint_01;

ROLLBACK;



SELECT * FROM menu_06977
ORDER BY harga ASC;


select nama_jalan from cabang_06977 GROUP BY nama_jalan;






insert all
into cabang_06977 values (11,'Wohoho', 'Waru')
into cabang_06977 values (12,'Wikiki', 'Rungkut')
into cabang_06977 values (13,'Wuhuhu', 'Penjaringan')
into cabang_06977 values (14,'Weieiei', 'Rungkut')
into cabang_06977 values (15,'Wehehe', 'Peneleh')
select 1 from dual;



insert all
into pegawai_06977 values (11,'Aldi', '11111',11)
into pegawai_06977 values (12,'Rupi', '22222',12)
into pegawai_06977 values (13,'Yupi', '33333',13)
into pegawai_06977 values (14,'Sinjay', '44444',14)
into pegawai_06977 values (15,'Sendi', '55555',15)
select 1 from dual;



insert all
into menu_06977 values (11,'Sate', '30000')
into menu_06977 values (12,'Mochacino', '50000')
into menu_06977 values (13,'Sego Campur','40000')
into menu_06977 values (14,'Ayam Geprek','50000')
into menu_06977 values (15,'Lemon Tea','50000')
select 1 from dual;




insert all
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (11,'11', '11')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (12,'12', '12')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (13,'13','13')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (14,'14','14')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (15,'15','15')
select 1 from dual;



insert all
into pembayaran_06977 values (11, '150000', '4000', '11', '148000', '11', '11')
into pembayaran_06977 values (12, '550000', '5000', '12', '148000', '12', '12')
into pembayaran_06977 values (13, '150000', '6000', '13', '148000', '13', '13')
into pembayaran_06977 values (14, '161000', '8000', '14', '160000', '14', '14')
into pembayaran_06977 values (15, '170000', '4000', '15', '166000', '15', '15')
select 1 from dual;



insert all
into detailpembelian_06977 values ('11', '11')
into detailpembelian_06977 values ('12', '12')
into detailpembelian_06977 values ('13', '13')
into detailpembelian_06977 values ('14', '14')
into detailpembelian_06977 values ('15', '15')
select 1 from dual;



SELECT nama_menu, MAX(harga) AS TERBANYAK, MIN(harga) AS TERENDAH FROM menu_06977 GROUP BY nama_menu;



SELECT id_pembayaran, count(id_pembayaran) AS banyak_transaksi from pembayaran_06977 where id_pembayaran = 10 AND id_pesanan = 10 GROUP BY id_pembayaran;



SELECT nama_menu, SUM(harga) AS total_harga FROM menu_06977 WHERE nama_menu LIKE 'Sate' GROUP BY nama_menu;



SELECT AVG(harga) AS rata2harga FROM menu_06977 WHERE nama_menu LIKE 'Sate';



SELECT id_pesanan AS TRANSAKSI_TERENDAH_TERTINGGI FROM pembayaran_06977 WHERE id_pembayaran = (SELECT id_pembayaran FROM pembayaran_06977 WHERE total = (SELECT MAX(total) FROM pembayaran_06977)) OR id_pembayaran = (SELECT id_pembayaran FROM pembayaran_06977 WHERE total = (SELECT MIN(total) FROM pembayaran_06977));



SELECT nama_pegawai AS namapegawai,
(SELECT COUNT(*) FROM pesanan_06977 WHERE pesanan_06977.id_pegawai = pegawai_06977.id_pegawai AND pegawai_06977.id_pegawai = 3) AS jumlah_transaksi_ditangani
FROM pegawai_06977;


SELECT nama_pegawai AS nama_pegawai,
(SELECT id_pesanan FROM pembayaran_06977 WHERE id_pegawai = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai ) AS id_ditangani,
(SELECT SUM(total) FROM pembayaran_06977 WHERE id_pembayaran = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai) AS TOTAL
FROM pegawai_06977 WHERE id_pegawai = 3;



SELECT nama_pegawai AS nama_pegawai,
(SELECT id_pesanan FROM pembayaran_06977 WHERE id_pegawai = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai ) AS id_ditangani,
(SELECT AVG(total) FROM pembayaran_06977 WHERE id_pembayaran = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai) AS TOTAL
FROM pegawai_06977 WHERE id_pegawai = 3;



SELECT nama_menu
FROM menu_06977
WHERE harga < (SELECT AVG(harga) FROM menu_06977)
GROUP BY nama_menu;



SELECT id_pesanan AS ID_penunjuk FROM pembayaran_06977
WHERE id_pembayaran = (SELECT id_pembayaran FROM pembayaran_06977 WHERE total = 17000);



SELECT nama_pegawai AS nama_pegawai,
(SELECT id_pesanan FROM pembayaran_06977 WHERE id_pegawai = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai ) AS id_ditangani,
(SELECT AVG(total) FROM pembayaran_06977 WHERE id_pembayaran = 3 AND pembayaran_06977.id_pegawai = pegawai_06977.id_pegawai) AS TOTAL
FROM pegawai_06977 WHERE id_pegawai = 3;

                                                      

SELECT id_pesanan AS TRANSAKSI_TERENDAH_TERTINGGI FROM pembayaran_06977 WHERE id_pembayaran = (SELECT id_pembayaran FROM pembayaran_06977 WHERE total = (SELECT MAX(total) FROM pembayaran_06977)) OR id_pembayaran = (SELECT id_pembayaran FROM pembayaran_06977 WHERE total = (SELECT MIN(total) FROM pembayaran_06977));



insert all
into cabang_06977 values (16,'Wohoho', 'Waru')
into cabang_06977 values (17,'Wikiki', 'Rungkut')
into cabang_06977 values (18,'Wuhuhu', 'Penjaringan')
into cabang_06977 values (19,'Weieiei', 'Rungkut')
into cabang_06977 values (20,'Wehehe', 'Peneleh')
select 1 from dual;

insert all
into pegawai_06977 values (16,'Bimi', '11111',16)
into pegawai_06977 values (17,'Rini', '22222',17)
into pegawai_06977 values (18,'Upil', '33333',18)
into pegawai_06977 values (19,'Bebek', '44444',19)
into pegawai_06977 values (20,'Ali', '55555',20)
select 1 from dual;

insert all
into menu_06977 values (16,'Sate', '30000')
into menu_06977 values (17,'Mochacino', '50000')
into menu_06977 values (18,'Sego Campur','40000')
into menu_06977 values (19,'Ayam Geprek','50000')
into menu_06977 values (20,'Lemon Tea','50000')
select 1 from dual;


insert all
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (16,'16', '16')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (17,'17', '17')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (18,'18','18')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (19,'19','19')
into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (20,'20','20')
select 1 from dual;



insert all
into pembayaran_06977 values (16, '150000', '4000', '16', '148000', '16', '16')
into pembayaran_06977 values (17, '550000', '5000', '17', '148000', '17', '17')
into pembayaran_06977 values (18, '150000', '6000', '18', '148000', '18', '18')
into pembayaran_06977 values (19, '161000', '8000', '19', '160000', '19', '19')
into pembayaran_06977 values (20, '170000', '4000', '20', '166000', '20', '20')
select 1 from dual;

insert all
into detailpembelian_06977 values ('16', '16')
into detailpembelian_06977 values ('17', '17')
into detailpembelian_06977 values ('18', '18')
into detailpembelian_06977 values ('19', '19')
into detailpembelian_06977 values ('20', '20')
select 1 from dual;


select a.nama_cabang, b.nama_pegawai
from cabang_06977 a join
pegawai_06977 b
on a.id_cabang = b.id_cabang
where rownum <=20;


SELECT a.nama_cabang, b.nama_pegawai, c.no_pesanan
FROM cabang_06977 a
LEFT JOIN pegawai_06977 b ON a.id_cabang = b.id_cabang
LEFT JOIN pesanan_06977 c ON b.id_pegawai = c.id_pegawai
WHERE a.id_cabang BETWEEN (SELECT MIN(id_cabang) 
FROM cabang_06977) AND (SELECT MAX(id_cabang)
FROM cabang_06977);


insert into cabang_06977 values (21, 'Wakaka', 'Waluyo');
insert into pegawai_06977 (id_pegawai, nama_pegawai, password_06977) values (21, 'Larry', '312456');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (21, '21', '21');
insert into pegawai_06977 (id_pegawai, nama_pegawai, password_06977) values (22, 'Vaanstrong', '3124567');
insert into pesanan_06977 (id_pesanan, no_pesanan, id_pegawai) values (22, '22', '22');


SELECT a.nama_cabang,
COUNT(b.id_pegawai) AS jumlah_transaksi, c.no_pesanan
FROM cabang_06977 a
RIGHT JOIN pegawai_06977 b
ON a.id_cabang = b.id_cabang
RIGHT JOIN pesanan_06977 c
ON b.id_pegawai = c.id_pegawai
WHERE NOT c.no_pesanan = 5 AND NOT c.no_pesanan = 6
GROUP BY a.nama_cabang, c.no_pesanan;



CREATE VIEW list_cabang
AS SELECT id_cabang, nama_cabang, nama_jalan
FROM cabang_06977;

INSERT INTO list_cabang (id_cabang, nama_cabang, nama_jalan)
VALUES (25, 'Wakaka', 'Waluyo');

SELECT * FROM list_cabang;



CREATE VIEW list_transaksi_beli
AS select a.nama_cabang, b.nama_pegawai
from cabang_06977 a join
pegawai_06977 b
on a.id_cabang = b.id_cabang
where rownum <=20;


CREATE VIEW penanganan_cabang
AS SELECT a.nama_cabang, b.nama_pegawai, c.no_pesanan
FROM cabang_06977 a
LEFT JOIN pegawai_06977 b ON a.id_cabang = b.id_cabang
LEFT JOIN pesanan_06977 c ON b.id_pegawai = c.id_pegawai
WHERE a.id_cabang BETWEEN (SELECT MIN(id_cabang) 
FROM cabang_06977) AND (SELECT MAX(id_cabang)
FROM cabang_06977);


CREATE VIEW transaksi_suatu_cabang
AS SELECT a.nama_cabang,
COUNT(b.id_pegawai) AS jumlah_transaksi, c.no_pesanan
FROM cabang_06977 a
RIGHT JOIN pegawai_06977 b
ON a.id_cabang = b.id_cabang
RIGHT JOIN pesanan_06977 c
ON b.id_pegawai = c.id_pegawai
WHERE NOT c.no_pesanan = 5 AND NOT c.no_pesanan = 6
GROUP BY a.nama_cabang, c.no_pesanan;



INSERT INTO list_transaksi_beli (nama_cabang, nama_pegawai)
VALUES ('Whehe', 'Luki');

SELECT * FROM user_updatable_columns;



CREATE VIEW list_menu_06977
AS SELECT id_menu, nama_menu, harga
FROM menu_06977;


UPDATE pegawai_06977 SET id_cabang = null WHERE id_cabang >2;
DELETE FROM cabang_06977 WHERE id_cabang >2;


DROP SEQUENCE id_pegawai;

DROP SEQUENCE id_pesanan;

DROP SEQUENCE id_pembayaran;


CREATE SEQUENCE id_pegawai
minvalue 1
maxvalue 9999
start with 30
increment by 1
NOCACHE;


CREATE SEQUENCE id_pesanan
minvalue 1
maxvalue 9999
start with 150
increment by 1
NOCACHE;


CREATE SEQUENCE id_pembayaran
minvalue 1
maxvalue 9999
start with 150
increment by 1
NOCACHE;


ALTER TABLE pesanan_06977
DROP COLUMN quantity;

ALTER TABLE pesanan_06977
DROP COLUMN total;


ALTER TABLE detailpembelian_06977
ADD quantityperbarang number(9);

ALTER TABLE detailpembelian_06977
ADD totalperbarang number(38);

ALTER TABLE detailpembelian_06977
ADD quantity number(9);

ALTER TABLE detailpembelian_06977
ADD total number(38);


