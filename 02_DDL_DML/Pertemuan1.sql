CREATE TABLE filmm (
    id_film CHAR(4),
    judul VARCHAR2(250),
    tahun CHAR(4),
    harga NUMBER
);

SELECT * FROM filmm;

INSERT INTO filmm (
    id_film,
    judul, 
    tahun, 
    harga
) VALUES ( '0001',
           'Fall',
           2020,
           30000 );
           
           
INSERT INTO filmm VALUES ('0002', 'The end', 2021, 100000);

DESC filmm;
           
