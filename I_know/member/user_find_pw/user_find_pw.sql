-- 비밀번호 찾기 (서비스단 내용)
SELECT 
  	  user_id
    , user_pw
 FROM users
WHERE user_email = 'user2@example.com';