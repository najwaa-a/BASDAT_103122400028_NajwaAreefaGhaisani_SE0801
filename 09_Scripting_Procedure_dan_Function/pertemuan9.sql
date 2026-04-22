SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;

-----------------------------------------------------

create or replace procedure cetak as 
    d varchar2(10);
begin
    d := q'(coba lagi)';
    DBMS_OUTPUT.PUT_LINE(d);
END;
/
-- knp pakek gris miring krn emng default nya bgtu. 

EXEC cetak;
EXECUTE cetak;

-----------------------------------------------------

-- 1. Parameter IN: mengirim nilai ke procedure
create or replace procedure sapa (nama in varchar2) as
begin
    DBMS_OUTPUT.PUT_LINE('Halo, ' || nama || '!'); -- 'nama' adalah nama parameter nya
END;
/

EXEC sapa('Budi');
EXEC sapa('siti');

-----------------------------------------------------

-- 2. Parameter OUT mengambil nilai ke procedure

create or replace procedure hitung_luas_persegi (
    sisi in number, 
    luas out number
) AS 
BEGIN
    luas := sisi * sisi;
END;
/

-- panggil procedure dengan OUT parameter
DECLARE 
    hasil NUMBER;
BEGIN
    hitung_luas_persegi(7, hasil);
    DBMS_OUTPUT.PUT_LINE('Luas persegi sisi 7 = ' || hasil);
END;
/

-----------------------------------------------------

--3. Parameter IN OUT: Kirim dan terima kembali nilai

create or replace procedure format_phone
    (phone_num in out varchar2) is
begin
    phone_num := '('|| substr(phone_num, 1, 3) || ')' ||
                    substr(phone_num, 4, 3) || '-' ||
                    substr(phone_num,7);
end format_phone;
/

-- panggil  procedure IN OUT
declare 
    phone varchar2(13) := '234676NAJ';
begin
    format_phone(phone);
    DBMS_OUTPUT.PUT_LINE(phone);
    -- Output: (234)234-NAJ
end;
/
-----------------------------------------------
-- PASSING PARAMETER

-- procedure untuk demo passing parameter
create or replace procedure add_dept (
    name in varchar2, 
    loc in number
) as 
begin
    DBMS_OUTPUT.PUT_LINE('Dept: ' || name || ', loc: ' || loc);
end;
/

-- 1. Positional: urutan sesuai definisi
EXECUTE add_dept('EDUCATION', 2400);

-- 2. Named(pakai): untuk spesifikasi nama
EXECUTE add_dept(loc=>2400, name=>'EDUCATION');

-- 3. Combination: gabungan positional dan named
EXECUTE add_dept('EDUCATION', loc=>2400);

------------------------------------------------------------
-- PROCEDURE DALAM PROCEDURE

-- Procedure 1: cetak angka 1 sampai x
create or replace procedure cetak_angka (x in integer) as 
    j integer;
begin
    for j in 1..x loop
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(j));
    end loop;
end;
/

-- procedure 2: memanggil procedure di atas
create or replace procedure panggil as
begin   
    cetak_angka(5);
end;
/

EXECUTE cetak_angka;

EXECUTE panggil;

---------------------------------------------
------  FUNCTION: Langsung mengembalikan nilai (pakai return)
-- Function tanpa parameter
create or replace function tulis
return varchar2 as
begin
    return 'Hello Hello';
end;
/

-- panggil function
select tulis from dual;
execute DBMS_OUTPUT.PUT_LINE(tulis);




