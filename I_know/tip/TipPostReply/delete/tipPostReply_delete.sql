-- 4. 팁게시글 댓글 삭제(Delete)
DELETE FROM tip_reply 
WHERE tip_reply_content = '프랑스 요리 만들어보기';

SELECT * FROM tip_reply;
