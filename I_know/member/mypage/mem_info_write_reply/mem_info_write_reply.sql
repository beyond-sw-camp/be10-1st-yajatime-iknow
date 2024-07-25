-- 회원 활동 조회
-- 2) 회원 작성 댓글 조회
SELECT
			 (SELECT tip_post_title
 				  FROM users u
 				  JOIN tip_post t ON (u.user_num = t.user_num)
         WHERE u.user_num = 1) AS 'TIP 제목'
		 , u.user_id AS '댓글작성자'
		 , r.tip_reply_content AS '댓글 내용'
		 , r.create_date AS '작성일시'
		 , r.update_date AS '수정일시'
	FROM users u 
	JOIN tip_reply r ON (u.user_num = r.user_num)
 WHERE u.user_num = 1;