
-- 3. 질문에 게시된 답변의 제목, 내용, 작성일 read 기능.
SELECT a.answer_title, a.answer_content, a.create_date
FROM answers a
JOIN questions q ON a.question_num = q.question_num
WHERE q.question_title = '일본 여행';