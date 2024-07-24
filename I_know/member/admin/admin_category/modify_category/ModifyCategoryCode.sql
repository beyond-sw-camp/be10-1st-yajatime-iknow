-- 관리자 카테고리 수정
UPDATE category
SET
	category_name = '국어'
WHERE
	category_num = 1;
	
SELECT
	*
FROM category;