-- 회원 목록 상세 조회 기능
SELECT 
    a.user_num AS '회원번호'
    , a.user_id AS '회원아이디'
    , a.user_pw AS '회원비밀번호'
    , a.user_email AS '이메일'
    , a.user_interest AS '취미'
    , a.user_birth AS '생년월일'
    , a.user_gender AS '성별'
    , a.user_auth AS '회원상태'
    , a.user_on AS '온개수'
    , COUNT(CASE WHEN b.report_user_num = a.user_num THEN 1 ELSE NULL END) AS '피신고회수'
FROM users a
LEFT JOIN report_record b ON a.user_num = b.report_user_num
WHERE a.user_num = 1
GROUP BY a.user_num;