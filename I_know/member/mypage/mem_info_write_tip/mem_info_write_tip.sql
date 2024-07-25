-- 회원 활동 조회
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