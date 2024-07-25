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