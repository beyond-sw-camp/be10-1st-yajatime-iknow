-- 팁게시글 댓글

DROP TRIGGER if EXISTS before_insert_tip_reply;


DELIMITER //
-- 1. 팁게시글 댓글을 삽입할 때의 제약조건
-- : 삽입할 팁게시글 댓글의 내용은 공백일 수 없다.

CREATE TRIGGER before_insert_tip_reply
BEFORE INSERT ON tip_reply
FOR EACH ROW
BEGIN
    IF TRIM(NEW.tip_reply_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '팁게시글 댓글 내용은 공백일 수 없습니다.';
    END IF;
END //

DELIMITER ;

-- 1. 팁게시글 댓글 생성(Create)
-- 정상적으로 댓글 생성 
INSERT INTO tip_reply (tip_reply_num, tip_reply_content, create_date, update_date, user_num, tip_post_num)
VALUES 
(14, '다른 다이어트 팁도 있나요?', '2023-12-01 12:00:00', NULL, 2, 1);

-- 댓글 본문 내용이 공백일 경우 에러코드 발생
INSERT INTO tip_reply (tip_reply_num, tip_reply_content, create_date, update_date, user_num, tip_post_num)
VALUES 
(14, '  ', '2023-12-01 12:00:00', NULL, 2, 1);
SELECT * FROM tip_reply;