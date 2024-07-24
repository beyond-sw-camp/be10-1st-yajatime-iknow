-- 결제 후 완료 확인
SELECT 
    user_num,
    CASE
        WHEN cash_check = 'Y' AND cash_type LIKE '%현금%' THEN '현금 결제 완료'
        WHEN cash_check = 'Y' AND cash_type LIKE '%카드%' THEN '카드 결제 완료'
        WHEN cash_check = 'Y' AND cash_type LIKE '%송금%' THEN '송금 결제 완료'
        WHEN cash_check = 'Y' THEN '결제 타입을 확인 불가능'
        ELSE '결제 실패'
    END AS result
FROM 
    cash;