-- 아이디 찾기
SELECT 
	   RPAD(substr(user_id, 1,3), LENGTH(user_id), '*') AS '찾는 아이디' 
  FROM users
 WHERE user_email = 'user2@example.com';