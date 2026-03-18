Drop table A cascade CONSTRAINTS;
CREATE TABLE A (
    Nama VARCHAR(50),
    Keahlian VARCHAR(50)
);

Drop table B cascade CONSTRAINTS;
CREATE TABLE B (
    NIP VARCHAR(10),
    No_Telp VARCHAR(20)
);


INSERT ALL 
    INTO A (Nama, Keahlian) VALUES ('Adit', 'Java')
    INTO A (Nama, Keahlian) VALUES ('Yusuf', 'C++')
    INTO A (Nama, Keahlian) VALUES ('Geriska', 'Oracle')
SELECT * FROM dual;

INSERT ALL
    INTO B (NIP, No_Telp) VALUES('11101', '087821391145')
    INTO B (NIP, No_Telp) VALUES('11102', '081220830014')
    INTO B (NIP, No_Telp) VALUES('11103', '081220830015')
SELECT * FROM DUAL;

select * from A;
select * from B;
--- najwa areefa ghaisani - 103122400028 ---
------------------------------------
-- 1. Cross Join 
select * from A
cross join B;

Drop table member cascade CONSTRAINTS;
CREATE TABLE member (
    idmember VARCHAR(10) PRIMARY KEY,
    nmMember VARCHAR(50) NOT NULL
);

Drop table transaksi cascade CONSTRAINTS;
CREATE TABLE transaksi (
    idmember VARCHAR(10) NOT NULL,
    tgltransaksi VARCHAR(20) NOT NULL
);



INSERT ALL
    INTO member (idmember, nmMember) VALUES ('ME0001', 'Anastasya AA')
    INTO member (idmember, nmMember) VALUES ('ME0002', 'Deni Dermawan')
    INTO member (idmember, nmMember) VALUES ('ME0003', 'Muh Mukifatul')
    INTO member (idmember, nmMember) VALUES ('ME0005', 'Fandi Arfandi')
SELECT * FROM dual;

INSERT ALL
    INTO transaksi (idmember, tgltransaksi) VALUES ('ME0001', '03-APR-14')
    INTO transaksi (idmember, tgltransaksi) VALUES ('ME0002', '03-APR-14')
    INTO transaksi (idmember, tgltransaksi) VALUES ('ME0003', '18-MAY-14')
    INTO transaksi (idmember, tgltransaksi) VALUES ('ME0005', '02-JUL-14')
SELECT * FROM dual;

select * from member;
select * from transaksi;

--------------------
--- 2. Natural Join
select * from member
natural join transaksi;

--- najwa areefa ghaisani - 103122400028 ---
--------------------
--- 3. Join Using
select * 
from member
join transaksi using (idmember);

select idmember, nmMember, tgltransaksi
from member
join transaksi
using (idmember);

--------------------
--- 4. Join On

select member.idmember, nmMember, tgltransaksi
from member
join transaksi
on (member.idmember = transaksi.idmember);
-----------------------------------------------------------------------
 
CREATE TABLE supervisor (
    nip          VARCHAR(10) PRIMARY KEY,
    nmsupervisor VARCHAR(50) NOT NULL,
    thn_masuk    INT
);

CREATE TABLE pengiriman (
    nip      VARCHAR(10),
    idprod   VARCHAR(10),
    iddist   VARCHAR(10),
    nip_spv  VARCHAR(10)
);


INSERT ALL 
    INTO supervisor (nip, nmsupervisor, thn_masuk) VALUES ('SUP001', 'Amita',         2010)
    INTO supervisor (nip, nmsupervisor, thn_masuk) VALUES ('SUP002', 'Anto Wijaya',   2010)
    INTO supervisor (nip, nmsupervisor, thn_masuk) VALUES ('SUP003', 'Candra Ano',    2011)
    INTO supervisor (nip, nmsupervisor, thn_masuk) VALUES ('SUP004', 'Farkhan Dani',  2012)
    INTO supervisor (nip, nmsupervisor, thn_masuk) VALUES ('SUP005', 'Zafira Annisa', 2013)
SELECT * FROM dual;

INSERT ALL 
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP001', '000007', 'DIS004')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP001', '000001', 'DIS001')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP002', '000002', 'DIS001')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP003', '000005', 'DIS005')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP003', '000003', 'DIS002')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP005', '000006', 'DIS002')
    INTO pengiriman (nip, idprod, iddist) VALUES ('SUP005', '000004', 'DIS003')
SELECT * FROM dual;

--- najwa areefa ghaisani - 103122400028 ---
--------------------------------------------------
 -- 6. Left outer join
select * from pengiriman
left join supervisor using(nip);

desc pengiriman;

------------------------------
-- 7. Right outer join

select * from pengiriman
right outer join supervisor using(nip);
order by idprod asc;

commit;

------------------------------
-- 8. Full Outer Join 

select *  
from pengiriman full outer join supervisor using(nip); 


----------------------------------------------------------------------
Drop table mahasiswa cascade CONSTRAINTS;
CREATE TABLE mahasiswa (
    nama  VARCHAR(50),
    nilai INT
);

CREATE TABLE grade_nilai (
    grade       CHAR(1),
    batas_bawah INT,
    batas_atas  INT
);

INSERT ALL
    INTO mahasiswa (nama, nilai) VALUES ('Galuh',   86)
    INTO mahasiswa (nama, nilai) VALUES ('Dada',   54)
    INTO mahasiswa (nama, nilai) VALUES ('Mediani', 44)
    INTO mahasiswa (nama, nilai) VALUES ('Ananda',   90)
SELECT * FROM dual;


INSERT ALL
    INTO grade_nilai (grade, batas_bawah, batas_atas) VALUES('A', 81, 100)
    INTO grade_nilai (grade, batas_bawah, batas_atas) VALUES('B', 61,  80)
    INTO grade_nilai (grade, batas_bawah, batas_atas) VALUES('C', 41,  60)
    INTO grade_nilai (grade, batas_bawah, batas_atas) VALUES('D', 21,  40)
    INTO grade_nilai (grade, batas_bawah, batas_atas) VALUES('E',  0,  20)
SELECT * FROM dual;

select * from mahasiswa;
select * from grade_nilai;
--- najwa areefa ghaisani - 103122400028 ---

---------------------------
-- 9. Non-Equijoin
SELECT m. Nama, m.Nilai, g.Grade 
FROM mahasiswa m, Grade_Nilai g 
WHERE m.Nilai BETWEEN g.Batas_Bawah AND g.Batas_Atas ; 


commit;
 
