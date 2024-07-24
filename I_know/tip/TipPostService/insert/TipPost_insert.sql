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
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = '팁 게시판 내용은 공백일 수 없습니다.';
    END IF;
END //

DELIMITER ;

-- 1. 팁 게시글 생성(Create)
-- 정상 데이터 삽입
INSERT INTO tip_post (tip_post_num, tip_post_title, tip_post_content, create_date, update_date, is_hot, user_num, category_num)
VALUES (11, '효율적인 시간 관리 방법', '시간 관리를 효과적으로 하는 팁에 대해 설명합니다...', '2023-06-10 10:00:00', NULL, FALSE, 3, 2),
(12, '건강한 식습관', '건강을 위해 따라야 할 식습관에 대해 설명합니다...', '2023-07-15 14:00:00', NULL, TRUE, 4, 2);

-- 제목 또는 본문에 공백이 불가능한 제약조건 확인
INSERT INTO tip_post (tip_post_num, tip_post_title, tip_post_content, create_date, update_date, is_hot, user_num, category_num)
VALUES (13, ' hello ' , ' ', '2023-06-10 10:00:00', NULL, FALSE, 3, 2);
SELECT * FROM tip_post;





