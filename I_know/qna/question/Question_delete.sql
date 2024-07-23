
DROP TRIGGER if EXISTS before_delete_questions;

-- 질문글 삭제 제약 조건
DELIMITER //

CREATE TRIGGER before_delete_questions
BEFORE DELETE ON questions
FOR EACH ROW
BEGIN
    -- 질문글에 답변이 달려있는 경우 삭제할 수 없음
    IF EXISTS (
        SELECT 1 
        FROM answers 
        WHERE question_num = OLD.question_num AND is_chosen = 1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '이미 답변을 채택하여 삭제할 수 없습니다.';
    END IF;
    
    -- 자신이 작성한 질문글만 삭제할 수 있음.
   IF OLD.user_num != @current_user_num THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 글만 삭제할 수 있습니다.';
    END IF;
END //

DELIMITER ;


-- 4. 질문글 삭제.
DELETE FROM questions
WHERE question_title = '제목';