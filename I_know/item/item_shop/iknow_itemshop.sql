-- 상점에 보유하고 있는 카테고리 별 아이템 조회
SELECT 
	A.item_name, 
	A.item_price,
	B.category_clothes
	FROM item A
	JOIN item_equipcategory B ON B.category_num = A.category_num;
	