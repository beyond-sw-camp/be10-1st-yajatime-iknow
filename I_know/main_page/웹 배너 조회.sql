-- 웹 배너 조회
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
        ) AS ranking,
        tp.create_date,
        tp.user_num
    FROM 
        tip_post tp
)
SELECT
    tt.tip_post_title '글 제목',
    a.file_name, 
    a.file_size, 
    (SELECT COUNT(*) FROM tip_reply tr WHERE tr.tip_post_num = tt.tip_post_num) 
	 AS '댓글수',
    tt.scrap_count AS '스크랩수',
    tt.likes_count '좋아요수',    
    tt.view_count '조회수'
FROM 
    TopTipPosts tt
JOIN
	 attachment a ON a.tip_post_num = tt.tip_post_num
ORDER BY 
    tt.ranking;