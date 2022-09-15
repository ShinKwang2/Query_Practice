USE ssafy_car;

# 1.	car 테이블과 manufacturer 테이블을 full outer 조인하면 몇개의 행이 조회되는시 출력하시오.
SELECT * FROM car;
SELECT * FROM manufacturer;

    
# 2.	모든 차량이 어떤 회사에서 제작했는지 알 수 있도록 자동차 정보와 회사 정보를 모두 출력하시오.
SELECT 
    *
FROM
    car
        inner join
    manufacturer on car.manufacturer_code = manufacturer.code;
    

# 3.	대한민국에 있는 회사에서 제작한 차량들을 조회하시오. ( nation 이 국가, 대한민국은 KOR )
SELECT 
    *
FROM
    car
        inner join
    manufacturer on car.manufacturer_code = manufacturer.code
WHERE
    manufacturer.nation = 'KOR';

# 4.	대한민국에 있는 회사에서 제작한 차량이 몇개인지 조회하시오.
SELECT 
     count(*) AS '개수', nation
FROM
    car
        inner join
    manufacturer on car.manufacturer_code = manufacturer.code
WHERE
    manufacturer.nation = 'KOR';
    
# 5.	company_name 으로 그룹핑 하여 각 회사 마다 몇개의 차량을 제작했는지 조회하시오.
SELECT 
    manufacturer.company_name, count(*) AS '개수'
FROM
    car
        inner join
    manufacturer on car.manufacturer_code = manufacturer.code
GROUP BY manufacturer.company_name;
    
####### 
# 6.	company_name 으로 그룹핑 하여 각 회사 마다 몇개의 차량을 제작했는지 출력하는데 제작한 차량이 0개인 회사도 조회하시오.
SELECT * FROM manufacturer;
SELECT 
    manufacturer.company_name, COUNT(*) AS '개수'
FROM
    car
        right outer join
    manufacturer on car.manufacturer_code = manufacturer.code
GROUP BY manufacturer.company_name HAVING IFNULL(count(*), 0);


# 7.	nation 으로 그룹핑 하는데 제작한 차량의 개수가 1개인 회사의 nation을 조회하시오. 
SELECT 
    manufacturer.nation, count(*) AS '개수'
FROM
    car
        inner join
    manufacturer on car.manufacturer_code = manufacturer.code
GROUP BY manufacturer.nation
HAVING count(vin) = 1;

# 8.	모델명이 '소나타' 인 차량의 mileage 보다 큰 mileage를 가진 모델명과 주행거리를 출력하시오.
SELECT 
    modelname, mileage
FROM
    car
WHERE
    mileage >= (SELECT 
            mileage
        FROM
            car
        WHERE
            modelname = '소나타');

# 9.	주행 거리가 20000 이상인 차량의 제작 회사 이름을 출력하시오.

SELECT * FROM car WHERE mileage >= 20000;

SELECT 
    company_name
FROM
    manufacturer
WHERE
    code IN (SELECT 
            manufacturer_code
        FROM
            car
        WHERE
            mileage >= 20000);

# 10.	주행 거리가 20000 이상인 차량들 중 차량번호에 ‘NH’ 을 포함하는 차량의 모델명과 차량번호, 주행거리를 출력하시오.
SELECT 
    modelname, vin, mileage
FROM
    (SELECT
        modelname, vin, mileage
    FROM
        car
    WHERE
        mileage >= 20000) AS inline_view
WHERE
    vin LIKE '%NH%';
            
