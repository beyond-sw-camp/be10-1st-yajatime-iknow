-- 게시판 최신글 조회

SELECT 
		 c.category_name
	  , tp.tip_post_title
	  , tp.tip_post_content
--	  , c.category_name
	  , tp.create_date
  FROM tip_post tp
  JOIN category c ON c.category_num = tp.category_num
 ORDER BY create_date DESC;