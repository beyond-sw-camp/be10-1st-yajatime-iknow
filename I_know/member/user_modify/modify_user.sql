-- 회원정보 수정 쿼리
UPDATE users 
   SET user_pw = '1234567'
     , user_email = 'testtest@gmail.com'
     , user_interest = '스포츠, 영화'
 WHERE user_id = 'test05';

SELECT * FROM users;