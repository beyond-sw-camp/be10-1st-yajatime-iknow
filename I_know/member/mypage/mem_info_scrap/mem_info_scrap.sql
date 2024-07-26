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