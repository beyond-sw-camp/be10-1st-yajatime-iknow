-- user 충전 시 온 잔량 확인
SELECT 
    A.user_num,
    CASE
        WHEN A.cash_type LIKE '%현금%' THEN '현금 결제 완료'
        WHEN A.cash_type LIKE '%카드%' THEN '카드 결제 완료'
        WHEN A.cash_type LIKE '%송금%' THEN '현금 결제 완료'
        ELSE '결제 실패'
    END AS 결제상태,
    A.cash_price,
    B.on_use,
    FLOOR(A.cash_price / 100) AS add_on,
    CASE
        WHEN 
            CASE
                WHEN A.cash_type LIKE '%현금%' THEN '현금 결제 완료'
                WHEN A.cash_type LIKE '%카드%' THEN '카드 결제 완료'
                WHEN A.cash_type LIKE '%송금%' THEN '현금 결제 완료'
                ELSE '결제 실패'
            END = '결제 실패'
        THEN B.on_use
        ELSE B.on_use + FLOOR(A.cash_price / 100)
    END AS total_on_use
FROM 
    cash A
LEFT JOIN 
    credit B ON A.user_num = B.user_num;