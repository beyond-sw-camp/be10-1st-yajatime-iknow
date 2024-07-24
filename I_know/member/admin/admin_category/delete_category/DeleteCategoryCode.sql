-- 관리자 TIP 게시판 카테고리 삭제 기능

DELIMITER //

CREATE TRIGGER before_category_delete
BEFORE DELETE ON category
FOR EACH ROW
BEGIN
    
    IF (SELECT COUNT(*) FROM tip_post WHERE category_num = OLD.category_num) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TIP 게시판에 해당 카테고리가 포함한 게시글이 있습니다.';
    END IF;

END //

DELIMITER ;

DELETE FROM category
WHERE category_num = 1;
