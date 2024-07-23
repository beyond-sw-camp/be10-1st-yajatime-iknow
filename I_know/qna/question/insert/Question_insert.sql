
DROP TRIGGER if EXISTS before_insert_questions;

DELIMITER //
-- 1. 질문글을 삽입할 때의 제약조건
-- : 삽입할 질문글의 제목이나 내용은 공백일 수 없다.

CREATE TRIGGER before_insert_questions
BEFORE INSERT ON questions
FOR EACH ROW
BEGIN
    IF TRIM(NEW.question_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '질문 제목은 공백일 수 없습니다.';
    END IF;
    
    IF TRIM(NEW.question_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '질문 내용은 공백일 수 없습니다.';
    END IF;
END //

DELIMITER ;

INSERT INTO questions (question_title, question_content, create_date, user_num, on_count, category_num)
VALUES ('제목', '내용', NOW(), 1, 5, 1);

INSERT INTO questions (question_title, question_content, create_date, user_num, on_count, category_num)
VALUES ('', '내용', NOW(), 1, 5, 1);

INSERT INTO questions (question_title, question_content, create_date, user_num, on_count, category_num)
VALUES ('제목', '', NOW(), 1, 5, 1);