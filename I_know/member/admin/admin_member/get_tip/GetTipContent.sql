SELECT
	c.user_num
	, a.tip_post_num
	, a.tip_post_title
	, a.tip_post_content
	, a.create_date
	, a.update_date
	, a.is_hot
	, b.category_name
FROM tip_post a
JOIN category b ON a.category_num = b.category_num
JOIN users c ON a.user_num = c.user_num