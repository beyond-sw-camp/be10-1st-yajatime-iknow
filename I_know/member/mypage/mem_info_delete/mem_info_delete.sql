-- 회원탈퇴 프로시저
CREATE PROCEDURE delete_users(
	IN u_num INT,			   -- 유저 번호
	OUT message VARCHAR(100) -- 성공메시지
)
BEGIN
	DECLARE count_id DECIMAL(10,2);
	
	-- 회원 탈퇴 처리
	UPDATE users 
	   SET user_auth = '탈퇴'
	 WHERE user_num = u_num;
	
	SELECT 
				count(*) INTO count_id
		FROM users 
	 WHERE user_auth = '탈퇴'
	   AND user_num = u_num;
	
	IF count_id = 1 THEN 
			SET message = "성공적으로 탈퇴 되었습니다.";
	ELSE 
			SET message = "탈퇴에 실패했습니다.";
	END IF;

END;

SET @message = '';
CALL delete_users(2, @message);
SELECT @message;