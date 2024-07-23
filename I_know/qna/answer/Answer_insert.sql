
DROP TRIGGER if EXISTS before_insert_answers;


-- 답변글을 게시할 때의 제약조건
-- : 답변글의 제목이나 내용은 공백일 수 없다.
DELIMITER //

CREATE TRIGGER before_insert_answers
BEFORE insert ON answers
FOR EACH ROW
BEGIN
    IF TRIM(NEW.answer_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변 제목은 공백일 수 없습니다.';
    END IF;

    IF TRIM(NEW.answer_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '답변 내용은 공백일 수 없습니다.';
    END IF;
    
END //

DELIMITER ;

-- 답변 게시 기능
INSERT INTO answers (answer_title, answer_content, create_date, user_num, question_num)
VALUES ('답 제목', '답 내용', NOW(), 1, 1);
