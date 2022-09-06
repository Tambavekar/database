select * FROM client_master;
select * FROM product_master;
select * FROM salesman_master;
select * FROM sales_order;
select * FROM sales_order_details;
select * FROM challan_details;
select * FROM challan_header;
select * from project_details;
select * from employee_details;
select * from employee_manager_details;




drop table client_master;
drop table product_master;
drop table salesman_master;
drop table sales_order;
drop table sales_order_details;
drop table challan_details;
drop table challan_header;
drop table project_details;
drop table employee_details;
drop table color_a;
drop table color_b;


truncate table employee_details;

--create table project_details 

CREATE TABLE project_details(
    project_id NUMBER(10),
    title VARCHAR2(50),
    cost NUMBER(10,2),
    client_name VARCHAR(50),
    CONSTRAINT project_id_pk PRIMARY KEY(project_id)
    );

INSERT INTO project_details VALUES(1,'Gpay',10000,'Google');
INSERT INTO project_details VALUES(2,'PhonePay',5000,'Phone Pay Tech');
    
    
--create table employee_details    
CREATE TABLE employee_details(
    employee_id VARCHAR2(10),
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(20) NOT NULL,
    age NUMBER(3) NOT NULL,
    gender VARCHAR2(6) NOT NULL,
    salary NUMBER(10,2) NOT NULL,
    date_of_birth DATE NOT NULL,
    project_id NUMBER(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    city VARCHAR2(20) DEFAULT 'Mumbai',
    CONSTRAINT employee_id_pk PRIMARY KEY(employee_id),
    CONSTRAINT project_id_fk FOREIGN KEY(project_id) REFERENCES project_details(project_id),
    CONSTRAINT age_ck CHECK(age >= 18),
    CONSTRAINT email_uq UNIQUE(email)
);

INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email)
VALUES(101,'Gagandeep kaur','Jandu',21,'Female',20000,'17-MAR-01',1,'gagan@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES(102,'Anjali','Pandey',22,'Female',25000,'27-JAN-01',2,'abc@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES(103,'Sejal','Jain',21,'male',30000,'16-SEP-01',1,'abcd@gmail.com');

--employee_sequence Automatical insert employee_Id
CREATE SEQUENCE employee_sequence;  
Select employee_sequence.nextVal From dual;

INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email)
VALUES(employee_sequence.nextVal,'Gagandeep kaur','Jandu',21,'Female',20000,'17-MAR-01',1,'gagan@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES(employee_sequence.nextVal,'Anjali','Pandey',22,'Female',25000,'27-JAN-01',2,'abc@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES(employee_sequence.nextVal,'Sejal','Jain',21,'male',30000,'16-SEP-01',1,'abcd@gmail.com');

--employee_sequence Automatical insert employee_Id ( char data type )
CREATE SEQUENCE employee_sequence START WITH 1000 INCREMENT BY 10;

INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email)
VALUES('MGS' || employee_sequence.nextVal,'Gagandeep kaur','Jandu',21,'Female',20000,'17-MAR-01',1,'gagan17@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES('MGS'|| employee_sequence.nextVal,'Anjali','Pandey',22,'Female',25000,'27-JAN-01',2,'abc27@gmail.com');
INSERT INTO employee_details(employee_id,first_name,last_name,age,gender,salary,date_of_birth,project_id,email) 
VALUES('MGS' || employee_sequence.nextVal,'Sejal','Jain',21,'male',30000,'16-SEP-01',1,'abcd16@gmail.com');

--Client_master
CREATE TABLE client_master
(
client_no VARCHAR2(6),
name VARCHAR2(26) NOT NULL,
address1 VARCHAR2(20),
address2 VARCHAR2(30),
city VARCHAR2(15),
state VARCHAR2(15),
pincode NUMBER(6),
bal_due NUMBER(10,2),
CONSTRAINT  client_no_pk PRIMARY KEY (client_no),
CONSTRAINT client_no_ch CHECK(client_no LIKE 'C%')
);

INSERT INTO client_master (client_no,name,address1,address2,city,state,pincode,bal_due)
                   VALUES('C00001','Ivan Bayross','Bhandup','Bombay','Bombay','MAHARASHTRA',400054, 15000 );
INSERT INTO client_master (client_no,name,address1,address2,city,state,pincode,bal_due)
                   VALUES('C00002','Vandana Saitwal','Madras','Madras','Madras','MAHARASHTRA',400054, 15000 );
INSERT INTO client_master (client_no,name,address1,address2,city,state,pincode,bal_due)
                   VALUES('C00003','Pramada Jaguste','Dadar','Bombay','Bombay','MAHARASHTRA',400054, 15000 );
INSERT INTO client_master (client_no,name,address1,address2,city,state,pincode,bal_due)
                   VALUES('C00004','Basu Navindgi','Thane','Bombay','Bombay','MAHARASHTRA',400054, 15000 );
INSERT INTO client_master (client_no,name,address1,address2,city,state,pincode,bal_due)
                   VALUES('C00005','Rukmini','Kalyan','Bombay','Bombay','MAHARASHTRA',400054, 15000 );                   
                  
                   
--product_master
CREATE TABLE product_master(
   	product_no VARCHAR2(6),
    	description VARCHAR2(50) NOT NULL,
    	profit_percent NUMBER(3,2) NOT NULL,
    	unit_measure VARCHAR2(10) NOT NULL,
    	record_lvl NUMBER(8) NOT NULL,
    	sell_price NUMBER(8,2) NOT NULL,
   	cost_price NUMBER(8,2) NOT NULL,
	CONSTRAINT product_no_pk PRIMARY KEY(product_no),
	CONSTRAINT product_no_ck CHECK(product_no LIKE 'P%'),
	CONSTRAINT sell_price_ck CHECK(sell_price > 0),
	CONSTRAINT cost_price_ck CHECK(cost_price > 0)	
);

INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P00001','1.44 Floppies',5,'qty',100,525,500);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P03453','Monitors',6,'qty',20,12000,11280);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P06734','Mouse',5,'qty',5,1050,1000);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P07865','1.22 Floppies',5,'qty',20,525,500);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P07868','Keyboards',2,'qty',3,3150,3050);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P07885','CD Drive',2.5,'qty',3,5250,51000);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P07965','540 HDD',4,'qty',3,8400,8000);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P07975','1.44 Drive',5,'qty',3,1050,1000);
INSERT INTO product_master (product_no,description,profit_percent,unit_measure,record_lvl,sell_price,cost_price)
                   VALUES('P08865','1.22 Drive',5,'qty',3,1050,1000);
                   
                   
--salesman_master
  CREATE TABLE salesman_master(
            salesman_no  VARCHAR2(6) CHECK( salesman_no LIKE 'S%'),
            salesman_name VARCHAR2(20) NOT NULL,
            Address1 VARCHAR2(30)NOT NULL,
            Address2 VARCHAR2(30) NOT NULL,
            city VARCHAR2(20),
            pincode VARCHAR2(6),
            state VARCHAR2(20),
            sal_amt NUMBER(8,2) NOT NULL,
            tag_to_get NUMBER(6,2)NOT NULL,
            ytd_sales NUMBER(6,2) NOT NULL,
            remarks VARCHAR2(60),
            CONSTRAINT Salesman_no_pk PRIMARY KEY(salesman_no),
             CONSTRAINT  sal_amt CHECK(sal_amt>0),
             CONSTRAINT  tag_to_get CHECK(tag_to_get>0)
            );

INSERT INTO salesman_master (salesman_no,salesman_name,Address1,Address2,city,pincode,state,sal_amt,tag_to_get,ytd_sales,remarks)
                   VALUES('S00001','Kiran','A/14','Worli','Bombay','400002','MAH',3000,100,50,'Good');
INSERT INTO salesman_master (salesman_no,salesman_name,Address1,Address2,city,pincode,state,sal_amt,tag_to_get,ytd_sales,remarks)
                   VALUES('S00002','Manish','65','Nariman','Bombay','400001','MAH',3000,200,100,'Good'); 
INSERT INTO salesman_master (salesman_no,salesman_name,Address1,Address2,city,pincode,state,sal_amt,tag_to_get,ytd_sales,remarks)
                   VALUES('S00003','Ravi','P-7','Worli','Bombay','400032','MAH',3000,200,100,'Good');                   
INSERT INTO salesman_master (salesman_no,salesman_name,Address1,Address2,city,pincode,state,sal_amt,tag_to_get,ytd_sales,remarks)
                   VALUES('S00004','Juhu','A/5','Worli','Bombay','400044','MAH',3500,200,150,'Good');

--sales_order
CREATE TABLE sales_order(
          s_order_no  VARCHAR2(6),
          s_order_date DATE,
          client_no VARCHAR2(6),
          dely_addr VARCHAR2(25),
          salesman_no VARCHAR2(6),
          dely_type CHAR(1)  DEFAULT 'F',
          billed_yn CHAR(1)DEFAULT 'N',
          dely_date DATE,
          order_status VARCHAR2(10),
          CONSTRAINT s_order_no_pk PRIMARY KEY(s_order_no),
          CONSTRAINT s_order_no_ck  CHECK(s_order_no like 'O%'),
          CONSTRAINT dely_type CHECK(dely_type IN('P','F')),
          CONSTRAINT billed_yn CHECK(billed_yn IN('Y','N')),
          CONSTRAINT dely_date_ck CHECK(dely_date > s_order_date),
          CONSTRAINT order_status_ck CHECK(order_status IN('IN PROCESS','Fulfilled','BACK ORDER','CANCELLED')), 
          CONSTRAINT client_no_fk FOREIGN KEY(client_no) REFERENCES client_master(client_no),
          CONSTRAINT salesman_no_fk FOREIGN KEY(salesman_no) REFERENCES salesman_master(salesman_no)
   );  
   
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
           VALUES('O19001','12-Jan-1996','C00001','S00001','F','N','20-Jan-1996','IN PROCESS');
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
            VALUES('O19002','25-Jan-1996','C00002','S00002','P','N','27-Jan-1996','CANCELLED');
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
            VALUES('O46865','18-Feb-1996','C00003','S00003','F','Y','20-Feb-1996','Fulfilled');
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
            VALUES('O19003','03-Apr-1996','C00001','S00001','F','Y','07-Apr-1996','Fulfilled'); 
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
            VALUES('O46866','20-May-1996','C00004','S00002','P','Y','22-May-1996','CANCELLED');
INSERT INTO sales_order(s_order_no,s_order_date,client_no,salesman_no,dely_type,billed_yn,dely_date,order_status)
            VALUES('O10008','24-May-1996','C00005','S00004','F','N','26-May-1996','IN PROCESS');



--sales_order_details
CREATE TABLE sales_order_details (
          s_order_no VARCHAR2(6),
          product_no VARCHAR2(6),
          qty_ordered NUMBER(8),
          qty_disp NUMBER(8),
          product_rate NUMBER(10,2),
          CONSTRAINT s_order_no_fk FOREIGN KEY(s_order_no) REFERENCES sales_order(s_order_no),
          CONSTRAINT product_no_fk FOREIGN KEY(product_no) REFERENCES product_master(product_no)

 );

INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19001','P00001',4,4,525);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19001','P07965',2,1,8400);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19001','P07885',2,1,5250);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19002','P00001',10,0,525);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46865','P07868',3,3,3150);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46865','P07885',3,1,5250);           
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46865','P00001',10,10,525);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46865','P03453',4,4,1050);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19003','P06734',2,2,1050);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O19003','P06734',1,1,12000);          
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46866','P07965',1,0,8400);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O46866','P07975',1,0,1050);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O10008','P00001',10,5,525);
INSERT INTO sales_order_details(s_order_no, product_no, qty_ordered, qty_disp, product_rate)
           VALUES('O10008','P07975',5,3,1050);
           
--challan_deatils
CREATE TABLE challan_header(
        challan_no VARCHAR2(6),
        s_order_no VARCHAR2(6),
        challan_date DATE NOT NULL,
        billed_yn CHAR(1) DEFAULT 'N',
        CONSTRAINT challan_no_pk PRIMARY KEY(challan_no),
        CONSTRAINT challan_no_ck CHECK(challan_no LIKE 'CH%'),
        CONSTRAINT s_order_no_challan_header_fk FOREIGN KEY(s_order_no) REFERENCES sales_order(s_order_no)
);

INSERT INTO challan_header(challan_no,s_order_no,challan_date,billed_yn)
    VALUES('CH9001','O19001','12-Dec-1995','Y');
INSERT INTO challan_header(challan_no,s_order_no,challan_date,billed_yn)
    VALUES('CH6865','O46865','12-Nov-1995','Y');
INSERT INTO challan_header(challan_no,s_order_no,challan_date,billed_yn)
    VALUES('CH3965','O10008','12-Oct-1995','Y');

-- challan_details
CREATE TABLE challan_details(
        challan_no VARCHAR2(6),
        product_no VARCHAR2(6),
        qty_disp NUMBER(4,2) NOT NULL,
        CONSTRAINT challan_no__challan_details_pk PRIMARY KEY(challan_no,product_no),
        CONSTRAINT challan_no_fk FOREIGN KEY(challan_no) REFERENCES challan_header(challan_no),
        CONSTRAINT product_no_challan_details_fk FOREIGN KEY(product_no) REFERENCES product_master(product_no)
    ); 

INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH9001','P00001',4);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH9001','P07965',1);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH9001','P07885',1);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH6865','P07868',3);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH9001','P03453',4);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH9001','P00001',10);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH3965','P00001',5);
INSERT INTO challan_details(challan_no,product_no,qty_disp)
VALUES('CH3965','P07975',2);

commit;

--employee_details table
create table employee_details(
employee_id NUMBER (10),
frist_name VARCHAR2(50)  NOT NULL,
last_name VARCHAR2(50)  NOT NULL,
age NUMBER(3)  NOT NULL,
gender VARCHAR2 (20) NOT NULL,
qulification VARCHAR2(20)  NOT NULL,
city VARCHAR2 (20)  NOT NULL,
date_of_birth DATE  NOT NULL,
salary NUMBER(10,2) NOT NULL,
CONSTRAINT employee_id_pk PRIMARY KEY (employee_id));


INSERT INTO employee_details values (3681,'Ashish','Kamble',32,'Male','M.Tech','Nagpur','13-Jun-1990',25000);
INSERT INTO employee_details values (3680, 'Anjali','Pandey',22, 'Female', 'B.Tech' ,'Kalyan','16-SEP-2000',25000);
INSERT INTO employee_details values (3683,'Gagandeep Kaur','Jandu',21,'Female','B.E.','Kalyan','17-MAR-2001',30000);
INSERT INTO employee_details values (3690,'pratik','mishra',22,'Male','B.E.','Pune','06-JUL-2000',25000);
INSERT INTO employee_details values (3689,'Pratik','Ghadge',23,'Male','B.E.','Mumbai','16-OCT-98',1000);
INSERT INTO employee_details VALUES (3706, 'Vineet','Gauda',22, 'Male', 'B.E.' ,'Mumbai','19-SEP-1999',25000);	
INSERT INTO employee_details values (3701,'Rohit','Dagade',21,'Male','B.E.','Mumbai','25-APR-2001',30000);
INSERT INTO employee_details VALUES (3705,'Yash','Walanju',21,'Male','B.Tech','Alibag','09-APR-2001',25000);
INSERT INTO employee_details VALUES (3703,'Janhavi','More',22,'Female','B.E.','Thane','28-APR-2000',25000);
INSERT into employee_details values (3679,'Gaurav','Baswant',25,'Male','B.E.','Mumbai','15-Jun-1998',25000);
INSERT INTO employee_details values (3682,'Dinesh','Rajan',22,'Male','B E.','Mumbai','13-Nov-2000',25000);
INSERT INTO employee_details values (3699,'Vipul','Tambavekar',23,'Male','M.Tech','Satara','06-March-1997',26000);
INSERT INTO employee_details values (3700,'Pradeep','sawant',24,'Male','B.E.','Pune','12-DEC-1997',25000);
INSERT INTO employee_details values (3702,'Siddhesh','Kumbhar',23,'Male','B. Tech','Satara','10-Jun-1999',25000);
INSERT INTO employee_details values (3685,'Kapil','Khandpekar',26,'Male','B.E.','Mumbai','03-May-1995',25300);
INSERT INTO employee_details values (3693, 'Sayali','Shete',22,'Female','B.E.','Mumbai','20-NOV-1999',25000);
INSERT INTO employee_details values (3707, 'Suraj','Gupta',23, 'Male', 'B.Tech' ,'Vasai','20-jan-1999',25000);
INSERT INTO employee_details values (3698,'Suraj','Patel',24,'Male','B.E.','Mumbai','13-Jun-1998',25000);
INSERT INTO employee_details values (3688,'Prashant','Zunzarrao',24,'Male','B.E.','Kalyan','23-Dec-1997',25000);
INSERT INTO employee_details values (3695,'Siraj','Shaikh',24,'Male','B.E.','Mumbai','01-jan-1998',25000);
INSERT INTO employee_details values (3704,'Amit','Wagharalkar',24,'Male','B.E.','Mumbai','11-july-1998',25000);
INSERT INTO employee_details values (3692,'Rohit','Pandey',28,'Male','B.E.','Mumbai','01-JAN-1994',25797);
INSERT INTO employee_details values (3678,'ajay','benbansi',25,'Male','B.E.','Mumbai','22-oct-1997',25000); 
INSERT INTO employee_details values (3614,'Rishab','Gharti',23,'Male','B.Tech','Mumbai','14-DEC-1998',25000);
INSERT INTO employee_details values (3691,'Kunal','Aakre',24,'Male','B.Tech','Nasik','06-Mar-1998',25000);
INSERT INTO employee_details values (3694,'SHABAN Ali','KHAN',23,'Male','B.E. MECH','Mumbai','06-JAN-1998',800);
INSERT INTO employee_details values (3696,'Shakti','Patole',22,'Male','B.E','BADLAPUR','24-MAR-2000',25000);
INSERT INTO employee_details values (3697, 'Siddhesh', 'Patangrao', 26, 'Male', 'B.E.', 'Ambivli', '22-Apr-1996', 2500);                  
INSERT into employee_details values (3655,'Amol','Pawar',24,'Male','B.E.','Kolhapur','21-Oct-1998',26000);
INSERT into employee_details values(3686,'Kavita','Khajure',23,'Female','B.Tech','Thane','25-Aug-1999',25000);

select frist_name,last_name,salary from employee_details;
select * from employee_details where city='Kalyan' and qulification='B.E.' ;
Select * FROM employee_details where city !='Mumbai' and city !='pune';


select * from employee_details where city!='Mumbai';
select * from employee_details where salary not between 25000 and 300000; 
select * from employee_details where city !='Thane' and salary>25000;

select min(salary) from employee_details; 
select Avg(salary) from employee_details; 

select * from employee_details where frist_name like 'a%';
select * from employee_details where last_name like '%ar';

select frist_name, last_name, city from employee_details order BY frist_name DESC;
select city,frist_name, last_name from employee_details order BY city ASC,frist_name;

select count(salary) from employee_details where city='Mumbai';
select city, count(city) from employee_details group by city order by city;
select city, count(city) from employee_details where city in ('Mumbai','Pune','Satara') group by city order by city;

SELECT city, sum(Salary) from employee_details group by city order by city;
SELECT city, sum(Salary) from employee_details group by city having sum (Salary) >50000 order by city;


--create table color_a
create table color_a (
color_id NUMBER (10),
name VARCHAR2(50)
);
insert into color_a values (1,'Black');
insert into color_a values (1,'Blue');
insert into color_a values (2,'Green');
insert into color_a values (3,'Yellow');



--create table color_b
create table color_b (
color_id NUMBER (10),
name VARCHAR2(50)
);

insert into color_b values (1,'Blue');
insert into color_b values (2,'Green');
insert into color_b values (3,'Gold');



select * from color_a cross join color_b ;


select * from color_a join color_b on color_a.color_id = color_b.color_id ;
SELECT * from color_a a join color_b b on a.color_id= b.color_id;

SELECT * from color_a a LEFT JOIN color_b b on a.color_id= b.color_id;
SELECT * from color_a a RIGHT JOIN color_b b on a.color_id= b.color_id;

create table employee_manager_details(
    employee_id NUMBER (10),
    name varchar (20), 
    designation varchar2(20), 
    reports_to number (10));
    
    insert into employee_manager_details values (101,'x','Director',null);
    insert into employee_manager_details values (102,'y','manager',101);
    insert into employee_manager_details values (103,'z','jr manager',102);
    insert into employee_manager_details values (104,'a','Trainee',103);
    insert into employee_manager_details values (105,'b','Trainee',103);
    
    select * from employee_manager_details emp cross join employee_manager_details mgr;
   
    select emp.name,'reports_to',mgr.designation 
    from employee_manager_details emp join employee_manager_details mgr 
    on emp.reports_to=mgr.employee_id;


select * from employee_details inner join project_details 
         on employee_details.project_id = project_details.project_id and title='Gpay';
       
--Sub Query  
select * 
from employee_details
         where project_id=(select project_id
                              from project_details 
                                  where title ='Gpay');

select * 
from employee_details
         where  NOT EXISTS (select project_id
                              from project_details 
                                  where title ='Bhim');


--String function

select ASCII('a') FROM DUAL;
Select ASCII('A') from dual;

select CHR(65) from dual;
select CHR(97) from dual;

select CONCAT ('HAPPY','CODING') FROM DUAL;
SELECT 'Happy' || '' || 'coding' from dual;
select INITCAP ('HAPPY CODING') FROM Dual;
SELECT LENGTH ('mindgate solutions') from dual;

select first_name 
from employee_details
 order by length(first_name) desc;


SELECT SYSDATE FROM DUAL;
SELECT add_months(sysdate,-5) FROM DUAL;
select sysdate+1  from dual;
select sysdate-1  from dual;

select extract(day from sysdate) from dual;
select Extract(DAY FROM TO_DATE('13-Dec-2022','DD-MM-YYYY')) FROM DUAL;
select Extract(MONTH FROM TO_DATE('13-Dec-2022','DD-MM-YYYY')) FROM DUAL;
select Extract(YEAR FROM TO_DATE('13-Dec-2022','DD-MM-YYYY')) FROM DUAL;


--view 

create view employee_vw
as
select employee_id,frist_name,last_name,gender from employee_details;

select * from employee_vw;
INSERT into employee_details values(6787,'Sarika','Patil',23,'Female','B.Tech','Thane','15-Oct-1997',28500);

UPDATE employee_vw
SET frist_name = 'Pooja'
WHERE employee_id = 3699;

UPDATE employee_vw
SET frist_name = 'Vipul'
WHERE employee_id = 3699;


--index
create index employee_frist_name on employee_details(frist_name);
select * from USER_INDEXES;
select * from ALL_INDEXES;

SELECT * FROM ALL_INDEXES WHERE table_name ='EMPLOYEE_DETAILS';


--CREATE TABLE
CREATE TABLE employee_details(
              employee_id NUMBER(10),
              name VARCHAR2(20) NOT NULL,
              salary NUMBER(10) NOT NULL,
              CONSTRAINT employee_id_pk_ PRIMARY KEY(employee_id)
);

--insert stored procedure

CREATE OR REPLACE PROCEDURE insert_new_employee(
            p_employee_id IN NUMBER,
            p_name IN VARCHAR2,
            p_salary IN NUMBER
        )
        IS
        BEGIN
            INSERT INTO employee_details 
            VALUES(p_employee_id , p_name , p_salary);
            COMMIT;
        END;
        /
-- Call to stored procedure
        
BEGIN
      insert_new_employee(102,'Y',200);
END;
/
SELECT * FROM employee_details;


--update stored procedure

CREATE OR REPLACE PROCEDURE update_employee(
                               p_employee_id IN NUMBER,
                               p_name IN VARCHAR2,
                               p_salary IN NUMBER
           )
        IS
        BEGIN
      UPDATE employee_details
      SET name = p_name,salary= p_salary
      WHERE employee_id = p_employee_id;
      COMMIT;
END;  
/
-- Call to stored procedure
        
BEGIN
      update_employee(101,'X',200);
END;
/
SELECT * FROM employee_details;

COMMIT;








