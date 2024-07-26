
-- 질문글을 수정할 때의 제약조건
-- (1) 수정할 질문글의 제목이나 내용은 공백일 수 없다.
-- (2) 질문글에 채택된 답변이 달려있으면 수정할 수 없다.
-- (3) 자신이 수정한 질문글에 대해서만 수정 가능하다.


DROP TRIGGER if EXISTS before_update_questions;
DELIMITER //

CREATE TRIGGER before_update_questions
BEFORE UPDATE ON questions
FOR EACH ROW
BEGIN
	-- (1)
    IF TRIM(NEW.question_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '질문 제목은 공백일 수 없습니다.';
    END IF;

    IF TRIM(NEW.question_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '질문 내용은 공백일 수 없습니다.';
    END IF;
    
    -- (2) 
    IF EXISTS (
        SELECT 1 
        FROM answers 
        WHERE question_num = OLD.question_num AND is_chosen = 1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '이미 답변을 채택하여 수정할 수 없습니다.';
    END IF;
    
   -- (3)
   IF OLD.user_num != NEW.user_num THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 글만 수정할 수 있습니다.';
    END IF;
END //

DELIMITER ;

-- 질문 수정 기능 
START TRANSACTION;

UPDATE questions
SET 
    question_title = '수정 제목',
    question_content = '수정 내용.',
    update_date = NOW()
WHERE 
    question_num = 1
    AND NOT EXISTS (
        SELECT 1 
        FROM answers 
        WHERE question_num = 1
    );
-- 
COMMIT;
