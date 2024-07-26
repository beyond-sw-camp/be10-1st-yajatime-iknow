-- 회원 활동 조회
-- 1) 회원 작성글 조회
-- 회원 질문 작성글 조회
SELECT 
		   q.question_title AS '질문 제목'
		 , q.question_content AS '질문 내용'
		 , q.create_date AS '적성일시'
		 , q.update_date AS '수정일시'
		 , q.category_num AS '카테고리 번호'
	FROM users u
	JOIN questions q ON (u.user_num = q.user_num)
 WHERE u.user_num = 1;

-- 화원 Tip 게시글 작성 조회 
SELECT 
		   t.tip_post_title AS 'TIP 제목'
		 , t.tip_post_content AS 'TIP 내용'
		 , t.create_date AS '작성일시'
		 , t.update_date AS '수정일시'
		 , t.category_num AS '카테고리 번호'
	FROM users u 
	JOIN tip_post t ON (u.user_num = t.user_num)
 WHERE u.user_num = 1;

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

-- 스크랩한 글 조회 
SELECT 
			(SELECT 
						  tip_post_title
				 FROM tip_post 
				WHERE s.tip_post_num = tip_post_num) AS '스크랩 한 글'
		 , s.scrap_date AS '스크랩한 날짜'
  FROM users u 
  JOIN scrap s ON (u.user_num = s.user_num)
 WHERE u.user_num = 1;

-- 좋아요한 글 조회
SELECT 
			 (SELECT 
			 				 tip_post_title
			 		FROM tip_post 
			 	 WHERE l.tip_post_num = tip_post_num) AS '종아요 한 글'
  FROM users u
  JOIN likes_contents l ON (u.user_num = l.user_num)
 WHERE u.user_num = 1;

-- 좋아요한 댓글 조회
SELECT 
			 (SELECT 
			 				 tip_reply_content
			 		FROM tip_reply 
			 	 WHERE l.tip_reply_num = tip_reply_num) AS '종아요 한 댓글'
  FROM users u
  JOIN likes_contents l ON (u.user_num = l.user_num)
 WHERE u.user_num = 1;

-- 아이디 찾기
SELECT 
			 RPAD(substr(user_id, 1,3), LENGTH(user_id), '*') AS '찾는 아이디' 
	FROM users
 WHERE user_email = 'user2@example.com';

-- 비밀번호 찾기 (서비스단 내용)
SELECT 
			 user_id
		 , user_pw
	FROM users
 WHERE user_email = 'user2@example.com';