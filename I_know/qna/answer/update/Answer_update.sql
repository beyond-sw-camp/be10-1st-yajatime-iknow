
DROP TRIGGER if EXISTS before_update_answers;  


-- 답변 수정 제약조건
-- (1) 답변글 제목과 내용은 공백으로 수정 불가
-- (2) 자신이 작성한 답변만 수정 가능.
-- (3) 채택된 답변은 수정 불가.
-- (4) 채택은 질문자만 할 수 있음.
-- (5) 하나의 질문만 채택 가능.
DELIMITER //

CREATE TRIGGER before_update_answers
BEFORE UPDATE ON answers
FOR EACH ROW
BEGIN	
    DECLARE question_author INT;

-- (1)
    IF TRIM(NEW.answer_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변 제목은 공백일 수 없습니다.';
    END IF;

    IF TRIM(NEW.answer_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변 내용은 공백일 수 없습니다.';
    END IF;
-- (2)    
    IF OLD.is_chosen = 1 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변이 채택되어 수정할 수 없습니다.';
    END IF;
-- (3)    
    IF OLD.user_num != NEW.user_num THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 글만 수정할 수 있습니다.';
    END IF;
-- (4)
    IF NEW.is_chosen = 1 THEN
	 		SELECT user_num INTO question_author 
    		FROM questions 
    		WHERE question_num = OLD.question_num;
	 
	 		IF question_author != @current_user_id THEN
	   		SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '질문자만 답변을 채택할 수 있습니다.';
    		END IF;
   END IF;


-- (5)     
    
   IF EXISTS (
        SELECT 1 
        FROM questions q
        JOIN answers a ON q.question_num = a.question_num
        WHERE q.question_num = q.question_num AND a.is_chosen = 1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '하나의 답변에 대해서만 채택이 가능합니다.';
    END IF;
END //

DELIMITER ;

-- 답변 수정 기능 
START TRANSACTION;

UPDATE answers
SET 
    answer_title = '수정 제목',
    answer_content = '수정 내용.',
    update_date = NOW()
WHERE 
    answer_num = 1
    AND NOT EXISTS (
        SELECT 1 
        FROM answers 
        WHERE answer_num = 1
    );

COMMIT;


-- 5. 답변글 채택 기능.
UPDATE answers
SET is_chosen = 1
WHERE answer_num = 1;