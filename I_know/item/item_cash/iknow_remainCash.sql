-- 아이템 결제 후 남은 온 금액
SELECT 
    c.user_num,
    c.on_use,
    i.item_name,
    i.item_price,
    FLOOR(c.on_use - i.item_price) AS remain_on
FROM 
    credit c
JOIN 
    item i ON c.item_num = i.item_num;