-- top 10 조회.

WITH TopTipPosts AS (
    SELECT
        tp.tip_post_num,
        tp.tip_post_title,
        (SELECT COUNT(*) 
             FROM scrap s 
          WHERE s.tip_post_num = tp.tip_post_num) AS scrap_count,
        (SELECT COUNT(*) 
             FROM likes_contents lc 
          WHERE lc.tip_post_num = tp.tip_post_num) AS likes_count,
        tp.view_count,
        ROW_NUMBER() OVER (
            ORDER BY 
                (SELECT COUNT(*) 
                   FROM scrap s 
                  WHERE s.tip_post_num = tp.tip_post_num) DESC,
                (SELECT COUNT(*) 
                   FROM likes_contents lc 
                  WHERE lc.tip_post_num = tp.tip_post_num) DESC,
                tp.view_count DESC
        ) AS ranking
    FROM 
        tip_post tp
)
SELECT
    tt.ranking '순위',
    tt.tip_post_title '글 제목',
    (SELECT COUNT(*) FROM tip_reply tr WHERE tr.tip_post_num = tt.tip_post_num) 
	 AS '댓글수',
    tt.scrap_count AS '스크랩수',
    tt.likes_count '좋아요수',    
    tt.view_count '조회수'
FROM 
    TopTipPosts tt
WHERE 
    tt.ranking <= 10
ORDER BY 
    tt.ranking;