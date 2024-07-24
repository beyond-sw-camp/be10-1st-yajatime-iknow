-- 4. 팁게시글 댓글 삭제(Delete)
DELETE FROM tip_reply 
WHERE tip_reply_content = '다른 다이어트 팁도 있나요?';

SELECT * FROM tip_reply;
