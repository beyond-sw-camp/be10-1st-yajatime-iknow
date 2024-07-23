CREATE PROCEDURE login_users(
	IN u_id VARCHAR(50),
	IN u_pw VARCHAR(50),
 OUT message VARCHAR(100)
)
BEGIN 
	DECLARE count_id DECIMAL(10,2);

	SELECT count(*) INTO count_id
	  FROM users 
	 WHERE user_id = u_id
	   AND user_pw = u_pw;
	 
	 IF count_id = 1 THEN 
			SET message = "로그인 되었습니다.";
	ELSE 
			SET message = "아이디 또는 비밀번호가 틀립니다.";
	END IF;
	  
END;
