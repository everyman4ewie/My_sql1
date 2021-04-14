USE vk_lesson_6;

-- 1. Пусть задан некоторый пользователь.
--    Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- не получилось посчитать количество (как сделать, помогите, пожалуйста)

SELECT DISTINCT
	concat(sender_name.firstname, ' ', sender_name.lastname) AS sender_name,
	concat(recipient_name.firstname, ' ', recipient_name.lastname) AS recipient_name,
	messages.from_user_id AS sender_id,
	messages.to_user_id AS recipient_id,
	friend_requests.status,
	messages.body
FROM messages
JOIN friend_requests ON friend_requests.initiator_user_id = messages.to_user_id
	OR friend_requests.target_user_id = messages.from_user_id
JOIN users AS sender_name ON sender_name.id = messages.from_user_id
JOIN users AS recipient_name ON recipient_name.id = messages.to_user_id
WHERE (messages.to_user_id = 1 OR messages.from_user_id = 1) AND friend_requests.status = 'approved'
ORDER BY sender_id ASC, recipient_id DESC
;



-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

-- Добаывим новую колонку с возрастом пользователей

ALTER TABLE vk_less_6.profiles ADD age varchar(127) NOT NULL;

-- Подсчитаем возраст и обновим значения в колонке age
UPDATE profiles
SET age = TIMESTAMPDIFF(YEAR, birthday, NOW());

SELECT
-- 	u.firstname,
-- 	u.lastname,
-- 	p.age,
-- 	p.user_id,
-- 	l.media_id,
	count(*) AS count_likes_children_less_than_ten_years
FROM users AS userss
LEFT JOIN profiles AS pers ON pers.user_id = userss.id
LEFT JOIN likes AS likess ON likess.user_id = userss.id
WHERE pers.age < 10 AND likess.media_id IS NOT NULL
ORDER BY pers.age;


-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT
	case (pers.gender)
		when 'm' then 'male'
		when 'f' then 'female'
		else 'it'
	end as gender,
	count(pers.gender) AS number_of_likes
FROM users AS userss
LEFT JOIN profiles AS pers ON pers.user_id = userss.id
LEFT JOIN likes AS likess ON likess.user_id = userss.id
WHERE likess.media_id IS NOT NULL AND pers.gender = 'm'
UNION
SELECT
	case (pers.gender)
		when 'm' then 'male'
		when 'f' then 'female'
		else 'it'
	end as gender,
	count(pers.gender) AS counter_likes
FROM users AS userss
LEFT JOIN profiles AS p ON pers.user_id = userss.id
LEFT JOIN likes AS likess ON likess.user_id = userss.id
WHERE likess.media_id IS NOT NULL AND pers.gender = 'f';