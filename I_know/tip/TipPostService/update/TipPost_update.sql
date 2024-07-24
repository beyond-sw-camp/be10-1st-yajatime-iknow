DROP TRIGGER if EXISTS before_update_tip_post;

-- 3. 팁 게시글 수정(Update)
-- 게시글을 수정할 때의 제약조건

DELIMITER //

CREATE TRIGGER before_update_tip_post
BEFORE UPDATE ON tip_post
FOR EACH ROW
BEGIN
	 -- 3.1 팁 게시글 수정시 update_date 값을 현재 시간으로 변경
	 SET NEW.update_date = NOW();

	 -- 3.2 수정할 질문글의 제목이나 내용은 공백일 수 없다.
    IF TRIM(NEW.tip_post_title) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '팁 게시판 제목은 공백일 수 없습니다.';
    END IF;

    IF TRIM(NEW.tip_post_content) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '팁 게시판 내용은 공백일 수 없습니다.';
    END IF;
    
    IF OLD.user_num != NEW.user_num THEN
    	  SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '자신이 작성한 팁 게시글만 수정할 수 있습니다.';
    END IF;
      
END //

DELIMITER ;


UPDATE tip_post
   SET tip_post_title = 'THE WORLD BEST COFFEE SHOP'
WHERE tip_post_num = 6;


-- 결과 조회
SELECT * FROM tip_post;