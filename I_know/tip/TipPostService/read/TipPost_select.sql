-- 2. 팁 게시글 조회(Read, Select)
-- 2-1. 팁 게시글 키워드 검색
SELECT * FROM tip_post
WHERE tip_post_title LIKE "%여행%";

-- 2-2. 팁 게시글 좋아요 순으로 정렬하여 조회
SELECT 
	   tp.tip_post_num, 
       tp.tip_post_title, 
       tp.tip_post_content, 
       tp.create_date, 
       tp.update_date, 
       u.user_id, 
		 c.category_name,
       COUNT(lc.likes_num) AS likes_count
FROM tip_post AS tp
LEFT JOIN likes_contents AS lc ON tp.tip_post_num = lc.tip_post_num
LEFT JOIN category AS c ON tp.category_num = c.category_num 
LEFT JOIN users AS u ON tp.user_num = u.user_num
GROUP BY 
		 tp.tip_post_num, 
         tp.tip_post_title, 
         tp.tip_post_content, 
         tp.create_date, 
         tp.update_date, 
         u.user_id, 
         c.category_name
ORDER BY likes_count DESC;


-- 2.3 팁게시글 상세정보 조회
SELECT tp.tip_post_num, tp.tip_post_title, tp.tip_post_content,
tp.create_date, tp.update_date, u.user_id, c.category_name, tr.tip_reply_content,
ur.user_id 
FROM tip_post AS tp
LEFT JOIN tip_reply AS tr ON tp.tip_post_num = tr.tip_post_num
LEFT JOIN category AS c ON tp.category_num =  c.category_num
LEFT JOIN attachment AS a ON tp.tip_post_num = a.tip_post_num
LEFT JOIN users AS u ON tp.user_num = u.user_num
LEFT JOIN users AS ur ON tr.user_num = ur.user_num;