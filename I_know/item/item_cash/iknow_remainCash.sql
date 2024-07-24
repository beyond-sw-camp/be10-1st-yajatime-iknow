-- 아이템 결제 후, 남은 값 도출 쿼리
-- 결제 후 남은 온 금액
SELECT 
    B.item_name,
    B.user_num,
    C.user_on,
    -- B.item_price,
    C.user_on - B.item_price AS remaining_on
FROM 
    item_equipcategory A
JOIN 
    item B ON A.category_num = B.category_num
JOIN 
    users C ON B.user_num = C.user_num;
