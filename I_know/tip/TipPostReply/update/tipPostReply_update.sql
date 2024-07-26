-- 3. 팁게시글 댓글 수정(Update)
-- 댓글 수정시 update_date 값을 현재 시간으로 변경
-- 댓글 수정시 내용은 공백이어서는 안됨
-- 자신이 작성한 댓글만 수정 가능하여야 함
-- 추가할 것 : 게시글 삭제시 해당 댓글들도 전부 삭제가 되어야 함

DROP TRIGGER if EXISTS before_update_tip_reply;

DELIMITER //

CREATE TRIGGER before_update_tip_reply
BEFORE UPDATE ON tip_reply
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    
    IF TRIM(NEW.tip_reply_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '댓글 내용은 공백일 수 없습니다.';
    END IF;

    
    IF OLD.user_num != NEW.user_num THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 댓글만 수정할 수 있습니다.';
    END IF;
    
END //

DELIMITER ;

UPDATE tip_reply
   SET tip_reply_content = '프랑스 요리 만들어보기'
 WHERE tip_reply_num = 6;
 
SELECT * FROM tip_reply;