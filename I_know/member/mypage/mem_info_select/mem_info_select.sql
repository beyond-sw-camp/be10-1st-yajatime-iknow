-- 회원정보 조회 쿼리
-- 사용자 아이디, 비밀번호, 이메일, 관심사, 생년월일, 성별, 온 수, 신고 당한 수
SELECT 
			 user_id
		 , user_pw
		 , user_email
		 , user_interest
		 , user_birth
		 , user_gender
		 , user_on
		 , (SELECT count(*) 
				  FROM users u  
					JOIN report_record r ON (u.user_num = r.report_user_num)
	 			 WHERE r.report_user_num = 2) AS user_report_count
	FROM users
 WHERE user_num = 2;