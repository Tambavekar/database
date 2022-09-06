 select * from employee_details;
 select * from address_details;
 
 drop table employee_details;
 drop table address_details;
 
 drop table address_details_sequence; 
 drop table employee_details_sequence;

create table address_details(
 address_id number(10),
 building_name varchar(50) not null,
 street varchar(50) not null,
 city varchar(50) not null,
 pin number(10) not null,
 constraint address_id_pk primary key(address_id)
 );
 
 create sequence address_details_sequence
 start with 10000 increment by 1;
 
 insert into address_details
 values(address_details_sequence.NEXTVAL,'Woodland Park','M.G.Road','Mumbai',400012);
 
 
 commit;
 
CREATE TABLE employee_details (
	employee_id NUMBER(10),
	name VARCHAR(20) NOT NULL,
	salary NUMBER(10,2) NOT NULL,
	address_id NUMBER(10) NOT NULL,
	CONSTRAINT employee_id_pk PRIMARY KEY(employee_id),
	CONSTRAINT address_id_fk FOREIGN KEY(address_id) REFERENCES 																																											address_details(address_id)
);
 

CREATE SEQUENCE employee_details_sequence
START WITH 100 INCREMENT BY 1;

INSERT INTO employee_details 
VALUES(employee_details_sequence.NEXTVAL,'Vivek Gohil',1000,10000);
 
