-- 회원마다 가지고 있는 카테고리별 아이템 조회
SELECT
C.user_num,
A.category_clothes,
B.item_name
from item_equipcategory A
JOIN item B ON A.category_num = B.category_num
JOIN users C ON B.user_num = C.user_num ;



