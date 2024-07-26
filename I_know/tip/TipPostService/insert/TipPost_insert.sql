-- 1. 팁 게시글을 삽입할 때의 제약조건
-- : 삽입할 팁 게시글의 제목이나 내용은 공백일 수 없다.
DROP TRIGGER if EXISTS before_insert_tip_post;

DELIMITER //

CREATE TRIGGER before_insert_tip_post
BEFORE INSERT ON tip_post
FOR EACH ROW
BEGIN
    IF TRIM(NEW.tip_post_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '팁 게시판 제목은 공백일 수 없습니다.';
    END IF;
    
    IF TRIM(NEW.tip_post_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '팁 게시판 내용은 공백일 수 없습니다.';
    END IF;
END //

DELIMITER ;


-- 1. 팁 게시글 생성(Create)
-- 정상 데이터 삽입시
INSERT INTO tip_post (tip_post_title, tip_post_content, create_date, update_date, user_num, category_num, is_blinded, view_count)
VALUES ('효율적인 시간 관리 방법', '시간 관리를 효과적으로 하는 팁에 대해 설명합니다...', '2023-06-10 10:00:00', NULL, 4, 2, FALSE, 120);
SELECT * FROM tip_post;

-- 제목이 공백인 경우
INSERT INTO tip_post (tip_post_title, tip_post_content, create_date, update_date, user_num, category_num, is_blinded, view_count)
VALUES (' ', '제목이 없는 내용', NOW(), NULL,4, 2, TRUE, 200);
-- 내용이 공백인 경우
INSERT INTO tip_post (tip_post_title, tip_post_content, create_date, update_date, user_num, category_num, is_blinded, view_count)
VALUES  ('내용이 없는 제목', ' ', NOW(), NULL, 4, 2, FALSE, 150);






