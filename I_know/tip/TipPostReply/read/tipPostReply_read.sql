-- 2. 팁게시글 댓글 조회(Read, Select)
SELECT * FROM tip_reply AS tr
LEFT JOIN tip_post AS tp ON tr.tip_post_num = tp.tip_post_num
WHERE tp.tip_post_num = 1;