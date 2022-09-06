
CREATE TABLE category(
    catId VARCHAR(20),
    catName VARCHAR(20)
);
CREATE TABLE products(
    productId VARCHAR(20),
    productName VARCHAR(20),
    productPrice number,
    catId number
);
insert into category
values(1,'pen');
insert into category
values(2,'penci');
select * from category;

select * from products;

drop table category;
drop table products;

insert into products
values(1,'bd',500,1);
insert into products
values(2,'jk',50000,2);

ALTER TABLE products ADD (catId VARCHAR(20));

commit;