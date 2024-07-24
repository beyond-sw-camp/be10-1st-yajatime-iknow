-- user_role 이 admin인 경우 아이템 추가 기능 구현
DROP PROCEDURE insert_item_if_admin;

DELIMITER //

CREATE PROCEDURE insert_item_if_admin (
    IN user_id_input VARCHAR(50),
    IN item_name_input VARCHAR(50),
    IN item_price_input INT,
    IN category_num_input INT,
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE user_auth_value VARCHAR(50);

    -- 제공된 user_id에 해당하는 user_auth 값을 가져옴
    SELECT user_role INTO user_auth_value
    FROM users
    WHERE user_id = user_id_input;

    -- user_auth 값이 'admin'인지 확인
    IF user_auth_value = 'admin' THEN
        -- 사용자가 관리자인 경우에만 item을 삽입
        INSERT INTO item (item_name, item_price, category_num)
        VALUES (item_name_input, item_price_input, category_num_input);
        SET result = '아이템 추가 완료';
    ELSE
        -- 사용자가 관리자가 아닌 경우 오류 발생 또는 처리
        SET result = '사용자가 관리자가 아닙니다';
    END IF;
END //

DELIMITER ;

-- 프로시저 호출 예시
SET @result = NULL;
CALL insert_item_if_admin('user3', '빨간신발', 20, 3, @result);
SELECT @result;

SELECT * FROM item;