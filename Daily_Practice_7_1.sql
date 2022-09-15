#1.	test_car 라는 이름으로 새로운 schema를 생성하고, 해당 스키마를 사용하시오.
create database test_car;

use test_car;

#2.	만약 car 라는 테이블이 존재한다면 삭제하시오.
 drop table if exists `car`;

#3.	test_car 에 다음 조건을 만족하는 car 테이블을 생성하시오.
create table `car` (
	`vin` varchar(45) NOT NULL PRIMARY KEY,
    `modelname` varchar(40) NOT NULL,
    `date_of_manufacture` date,
    `mileage` int NOT NULL
)ENGINE=InnoDB;
DESC `car`;

#4.	car 테이블에 아래와 같이 color 라는 컬럼을 삽입하시오.
alter table `car` ADD `color` int not null;

#5.	car 테이블의 color 컬럼을 아래와 같이 변경하시오.
alter table `car` MODIFY `color` varchar(40) null;
DESC `car`;

#6.	color 컬럼을 삭제하시오.
alter table `car` DROP COLUMN `color`;
DESC `car`;


#7.	car 테이블에 아래와 같은 데이터를 삽입하시오.
INSERT INTO `car` (vin, modelname, date_of_manufacture, mileage)
VALUES
('KMHXX00XXXX000000', '소나타', '2018-05-01', 20000 ),
('KMHXX00XXXX000001', '아반떼', '2021-12-25', 1000),
('KNHXX00XXXX000000', 'K-5' ,'2017-12-10', 35000),
('KNHXX00XXXX000001', '쏘렌토','2010-08-01', 100000),
('1G1ZE5ST1HF199624', '말리부','2020-01-10', 5000);

#8.	modelName이 아반떼 인 자동차의 mileage를 50000 으로 변경하시오.
UPDATE car SET mileage = '50000' WHERE modelname = '소나타';

#9.	mileage이 50000 이상인 자동차를 삭제하시오.
DELETE FROM car WHERE mileage >= 50000;

#10.	car 테이블에 있는 모든 data를 삭제하시오.
DELETE FROM car;

commit;

select * from car;
