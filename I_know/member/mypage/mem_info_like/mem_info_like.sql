-- 회원 활동 조회
-- 좋아요한 글 조회
SELECT 
	(SELECT 
		 tip_post_title
	   FROM tip_post 
	  WHERE l.tip_post_num = tip_post_num) AS '종아요 한 글'
  FROM users u
  JOIN likes_contents l ON (u.user_num = l.user_num)
 WHERE u.user_num = 1;