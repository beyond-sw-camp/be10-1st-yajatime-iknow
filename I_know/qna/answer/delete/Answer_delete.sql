
DROP TRIGGER if EXISTS before_delete_answers;

-- 3. 제약조건
--  답변 채택되거나 자신이 작성한 글 아닐때
DELIMITER //
CREATE TRIGGER before_delete_answers
BEFORE DELETE ON answers
FOR EACH ROW
BEGIN
    IF OLD.is_chosen = 1 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변이 채택되어 수정할 수 없습니다.';
    END IF;
    
    IF OLD.user_num != @current_user_num THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 글만 삭제할 수 있습니다.';
    END IF;
END //

DELIMITER ;

-- 4. 답변글 삭제.
DELETE FROM answers
WHERE answer_title = '제목';
