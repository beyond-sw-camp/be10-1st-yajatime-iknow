-- 사용자 온(크래딧) 수정 기능
-- trigger 사용
DROP TRIGGER IF EXISTS before_credit_update;


DELIMITER //

CREATE TRIGGER before_credit_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.user_on < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0개보다 적게 수정할 수 없습니다.';
    END IF;
END //

DELIMITER ;

-- 크레딧 업데이트 (트리거 작동)
UPDATE users
SET user_on = -10
WHERE user_num = 3;
