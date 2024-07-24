-- user_role 이 admin인 경우 특정 아이템 조회 기능 구현

DELIMITER //

CREATE PROCEDURE view_item_if_admin (
    IN user_id_input VARCHAR(50),
    IN item_num_input INT,
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE user_auth_value VARCHAR(50);
    DECLARE item_details VARCHAR(255);

    -- 제공된 user_id에 해당하는 user_auth 값을 가져옴
    SELECT user_role INTO user_auth_value
    FROM users
    WHERE user_id = user_id_input;

    -- user_role 값이 'admin'인지 확인
    IF user_auth_value = 'admin' THEN
        -- 사용자가 관리자인 경우에만 item을 조회
        SELECT 
            CONCAT(
                'item_num: ', i.item_num, 
                ', item_name: ', i.item_name, 
                ', item_price: ', i.item_price, 
                ', category_clothes: ', iec.category_clothes
            ) INTO item_details
        FROM 
            item i
        JOIN 
            item_equipcategory iec ON i.category_num = iec.category_num
        WHERE 
            i.item_num = item_num_input;
        
        SET result = item_details;
    ELSE
        -- 사용자가 관리자가 아닌 경우 오류 발생 또는 처리
        SET result = '사용자가 관리자가 아닙니다';
    END IF;
END //

DELIMITER ;

-- 프로시저 호출 예시 (아이템 조회)
SET @result = NULL;
CALL view_item_if_admin('user3', 10, @result);
SELECT @result;

SELECT * FROM item;
