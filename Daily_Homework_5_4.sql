# 1
use classicmodels;

# 2
select customerNumber from orders where orderNumber = 10100;

# 3
select * from orders where 100 <= customerNumber and customerNumber <= 150;

# 4
select distinct status from orders;

# 5
select * from orderdetails order by priceEach DESC limit 5;

# 6
select * from employees where lastname like '%B%';

# 7
select CONCAT(lastName, " ", firstName) as '이름', employeeNumber, jobTitle from employees where employeeNumber <= 1500 AND officeCode = 4;

# 8
select reverse(checkNumber) from payments order by paymentDate DESC limit 1;

# 9
select postalCode '우편번호', concat(addressLine1, " ", addressLine2) '주소', phone '전화번호' from offices where city = 'Boston';

# 10
select * from products where productline = 'Motorcycles' order by quantityInStock DESC;