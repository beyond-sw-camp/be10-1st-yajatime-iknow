
DELIMITER //
CREATE PROCEDURE ReportUser (IN report_user_num INT, IN usernum INT, IN content_type VARCHAR(20), IN content_num INT, IN report_content TEXT)
BEGIN
    -- 신고 기록 삽입
    IF content_type = 'question' THEN
        INSERT INTO report_record (report_user_num, report_date, user_num, question_num, report_content)
        VALUES (report_user_num, NOW(), usernum, content_num, report_content);
    ELSEIF content_type = 'answer' THEN
        INSERT INTO report_record (report_user_num, report_date, user_num, answer_num, report_content)
        VALUES (report_user_num, NOW(), usernum, content_num, report_content);
    ELSEIF content_type = 'tip_post' THEN
        INSERT INTO report_record (report_user_num, report_date, user_num, tip_post_num, report_content)
        VALUES (report_user_num, NOW(), usernum, content_num, report_content);
    ELSEIF content_type = 'tip_reply' THEN
        INSERT INTO report_record (report_user_num, report_date, user_num, tip_reply_num, report_content)
        VALUES (report_user_num, NOW(), usernum, content_num, report_content);
    END IF;

    -- 사용자 신고 횟수 및 정지 상태 업데이트
    UPDATE users
    SET 
        user_reportcnt = user_reportcnt + 1,
        user_stopcnt = CASE 
                          WHEN user_reportcnt + 1 >= 100 THEN 987654321
                          WHEN user_reportcnt + 1 >= 60 THEN 30
                          WHEN user_reportcnt + 1 >= 40 THEN 7
                          WHEN user_reportcnt + 1 >= 20 THEN 3
                          ELSE user_stopcnt
                      END,
        user_auth = CASE 
                       WHEN user_reportcnt + 1 >= 20 THEN '정지' 
                       ELSE user_auth
                    END
    WHERE user_num = usernum;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE BlindUserContent(IN usernum INT)
BEGIN
    -- 사용자의 질문 블라인드 처리
    UPDATE questions
    SET is_blinded = 1
    WHERE user_num = usernum AND EXISTS (SELECT 1 FROM users WHERE user_auth = '정지' AND user_num = usernum);

    -- 사용자의 답변 블라인드 처리
    UPDATE answers
    SET is_blinded = 1
    WHERE user_num = usernum AND EXISTS (SELECT 1 FROM users WHERE user_auth = '정지' AND user_num = usernum);

    -- 사용자의 팁 게시글 블라인드 처리
    UPDATE tip_post
    SET is_blinded = 1
    WHERE user_num = usernum AND EXISTS (SELECT 1 FROM users WHERE user_auth = '정지' AND user_num = usernum);

    -- 사용자의 팁 댓글 블라인드 처리
    UPDATE tip_reply
    SET is_blinded = 1
    WHERE user_num = usernum AND EXISTS (SELECT 1 FROM users WHERE user_auth = '정지' AND user_num = usernum);
END //
DELIMITER ;

-- 질문 게시글 신고
START TRANSACTION;
CALL ReportUser(2, 1, 'question', 1, '이걸 질문이라고');
CALL BlindUserContent(1);
COMMIT;

-- 답변 게시글 신고
START TRANSACTION;
CALL ReportUser(1, 4, 'answer', 1, '이걸 답변이라고');
CALL BlindUserContent(4);
COMMIT;

-- 팁 게시글 신고
START TRANSACTION;
CALL ReportUser(1, 4, 'tip_post', 1, '이걸 팁이라고');
CALL BlindUserContent(4);
COMMIT;

-- 팁 댓글 신고
START TRANSACTION;
CALL ReportUser(1, 4, 'tip_reply', 1, '이걸 댓글이라고');
CALL BlindUserContent(4);
COMMIT;
