SELECT
	c.user_num					AS 유저번호
	, a.question_title		AS 질문제목
	, a.question_content		AS 질문내용
	, a.create_date			AS	작성일자
	, a.update_date			AS	수정일자
	, a.on_count				AS 채택온개수
FROM questions a
JOIN users c ON a.user_num = c.user_num
WHERE c.user_num = 1;