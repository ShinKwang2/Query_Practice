-- 데이터베이스를 생성하는 명령어
CREATE DATABASE ssafy DEFAULT CHARACTER SET utf8mb4;

-- 모든 데이터베이스 목록 조회
SHOW DATABASES;

-- 데이터베이스 삭제
DROP DATABASE IF EXISTS ssafy;

-- 해당 데이터베이스 사용하겠다.
USE ssafy;

-- -----------------------------------

CREATE TABLE ssafy_member (
	idx INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(20) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    user_pwd VARCHAR(20) NOT NULL,
    user_age INT,
    email_id VARCHAR(20),
    email_domain VARCHAR(30),
    joindate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (idx)
);

DESC ssafy_member;

DELETE FROM ssafy_member
WHERE idx = 12;

SELECT * FROM ssafy_member;



