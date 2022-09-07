USE ssafy;
desc ssafy_member;

INSERT INTO ssafy_member (user_id, user_name, user_pwd, email_id, email_domain, joindate)
VALUES ('id_kim', '김싸피', 'pass123', 'kimssafy', 'ssafy.com', now());

INSERT INTO ssafy_member (user_id, user_name, user_pwd, email_id)
VALUES ('id_lee', '이싸피', 'lee123', 'ssafylee');

UPDATE ssafy_member
	SET user_name = 'anonymous';

UPDATE ssafy_member
	SET email_domain = 'ssafy.com'
WHERE email_domain is NULL;

DELETE FROM ssafy_member
WHERE idx = 2;

SELECT * FROM ssafy_member;


