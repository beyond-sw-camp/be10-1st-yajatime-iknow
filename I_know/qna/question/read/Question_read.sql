
-- 3. 게시된 질문 read 기능.
-- (1) 게시판에서 질문글 제목 조회 가능.
SELECT question_title '질문글 제목'
FROM questions;

SELECT * FROM category;
SELECT * FROM questions;

SELECT * FROM answers;

-- (2) 게시판에서 질문 카테고리명을 선택해서 조회
SELECT q.question_title '질문글 제목'
FROM questions q
JOIN category c ON q.category_num = c.category_num
WHERE c.category_name = '건강';

-- (3) 하나의 질문글에 대해 제목, 내용, 첨부파일, 질문 카테고리, 답변 개수 확인 가능.
SELECT q.question_title '질문글 제목' , 
		q.question_content '질문글 내용', 
		c.category_name '카테고리명',
		COUNT(q.question_num = a.question_num) '달린 답변글 개수'
FROM questions q
JOIN category c ON q.category_num = c.category_num
JOIN answers a ON q.question_num = a.question_num
WHERE q.question_num = 1;
