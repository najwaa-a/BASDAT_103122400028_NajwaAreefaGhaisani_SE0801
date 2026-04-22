create table department (
    department_id number(4) primary key,
    department_name varchar2(30) not null, 
    manager_id number(6),
    location_id number(4)
);

drop table departmen cascade constraint;

create table employee (
    employee_id number(6) primary key,
    last_name varchar2(25) not null, 
    email varchar2(25),
    salary number(8,2),
    commision_pct number(2,2),
    hire_date date not null, 
    department_id number(4),
    constraint fk_emp_dept foreign key(department_id)
    references department(department_id)
);

create table supplier (
    supplier_id number(4) primary key,
    supplier_name varchar2(50) not null,
    contact_phone varchar2(15),
    address varchar2(100)
);

create table inventory (
    item_id number(6) primary key, 
    item_name varchar2(50) not null, 
    quantity number(6) default 0,
    department_id number(4),
    supplier_id number(4),
    constraint fk_inv_dept foreign key(department_id)
    references department(department_id),
    constraint fk_inv_supp foreign key(supplier_id)
    references supplier(supplier_id)
);

analyze table department compute statistics for table;
analyze table employee compute statistics for table;
analyze table supplier compute statistics for table;
analyze table inventory compute statistics for table;

select table_name, num_rows, blocks, empty_blocks
from user_tables
where table_name in ('DEPARTMENT', 'EMPLOYEE', 'SUPPLIER', 'INVENTORY');

select * from department;

insert into department values (1, 'administration', 200, 1700);
insert into department values (2, 'marketing', 201, 1800);
insert into department values (3, 'purchasing', 206, 1700);
insert into department values (4, 'human resources', 203, 2400);
insert into department values (5, 'shipping', 121, 1500);
insert into department values (6, 'IT', 103, 1400);
insert into department values (7, 'public relation', 204, 2700);
insert into department values (8, 'sales', 145, 2500);
insert into department values (9, 'executive', 100, 1700);
insert into department values (10, 'finance', 108, 1700);


insert into supplier values (1, 'PT Maju Mundur', '08212345678', 'Jakarta');
insert into supplier values (2, 'PT Maju Ketengah', '0823457681', 'Bandang');
insert into supplier values (3, 'PT Maju Kedepan', '08287654101', 'Semarang');
insert into supplier values (4, 'PT Makmur', '08278229873', 'Surabaya');
insert into supplier values (5, 'PT Setia Kawan', '08572832894', 'Jakarta');
insert into supplier values (6, 'PT Prima Jaya', '08827467291', 'Yogyakarta');
insert into supplier values (7, 'PT Globalisasi', '082237432749', 'Makassar');
insert into supplier values (8, 'PT Karya Jaya', '085129372239', 'Pontianak');
insert into supplier values (9, 'PT Prima Jaya', '087717239123', 'Palembang');
insert into supplier values (10, 'PT Nusantara Baya', '086729374329', 'Medan');

insert into employee values (100, 'najwa', 'najwa@co.com', 24000, null, date '2003-06-17', 9);
insert into employee values (101, 'abidah', 'abidah@co.com', 17000, null, date '2005-06-19', 9);
insert into employee values (102, 'sukma', 'sukma@co.com', 17000, null, date '2004-07-20', 9);
insert into employee values (103, 'nadia', 'nadia@co.com', 9000, null, date '2001-04-17', 6);
insert into employee values (104, 'danang', 'danang@co.com', 6000, null, date '2004-06-18', 6);
insert into employee values (105, 'geusan', 'geusan@co.com', 14000, 0.40, date '2009-06-12', 8);
insert into employee values (106, 'rasyid', 'rasyid@co.com', 13500, 0.30, date '2010-04-17', 8);
insert into employee values (107, 'abu', 'abu@co.com', 12000, 0.30, date '2005-08-15', 8);
insert into employee values (108, 'ryvanda', 'ryvanda@co.com', 11000, 0.30, date '2003-03-16', 8);
insert into employee values (109, 'ananta', 'ananta@co.com', 10500, 0.20, date '2006-03-18', 8);

insert into inventory values (1, 'Laptop Dell', 5, 6, 1);
insert into inventory values (2, 'Monitor LG', 3, 6, 2);
insert into inventory values (3, 'Printer Canon', 5, 6, 3);
insert into inventory values (4, 'Meja Kantor', 2, 1, 4);
insert into inventory values (5, 'Kursi Ergonomi', 5, 5, 5);
insert into inventory values (6, 'Proyektor Epson', 8, 3, 6);
insert into inventory values (7, 'UPS APC 10000VA', 1, 6, 7);
insert into inventory values (8, 'Scanner Fujitsu', 9, 8, 8);
insert into inventory values (9, 'Telepon IP Cisco', 4, 7, 9);
insert into inventory values (10, 'Switch Hub 24', 4, 9, 10);

analyze table department compute statistics for table;
analyze table employee compute statistics for table;
analyze table supplier compute statistics for table;
analyze table inventory compute statistics for table;

select table_name, num_rows, blocks, empty_blocks
from user_tables
where table_name in ('DEPARTMENT', 'EMPLOYEE', 'SUPPLIER', 'INVENTORY');

create or replace view empvu8 as 
select employee_id as id_number,
last_name as name,
salary,
department_id
from employee
where department_id = 8;

select * from empvu8;

describe empvu8;

select column_name, data_type,
nullable
from user_tab_columns
where table_name = 'EMPVU8';

create index idx_emp_dept_id on employee(department_id);

select i.index_name, i.uniqueness,
c.column_name, c.table_name
from user_indexes i
join user_ind_columns c on 
i.index_name = c.index_name
where c.table_name = 'EMPLOYEE';




