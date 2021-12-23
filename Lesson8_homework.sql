USE vk2;

/*
* 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
* который больше всех общался с выбранным пользователем (написал ему сообщений).
*/
SELECT from_user_id,
	CONCAT(u.firstname, ' ', u.lastname) AS 'recipient',
	COUNT(*) AS 'send'
	FROM messages m 
JOIN users u ON u.id = m.from_user_id 
WHERE to_user_id = 5
GROUP BY from_user_id
ORDER BY send DESC
LIMIT 1;


/*
 * 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */
SELECT COUNT(*) AS cnt
FROM posts_likes pl 
JOIN profiles p ON p.user_id = pl.user_id 
WHERE  TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;


/*
 * 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
 */
SELECT
	CASE(gender)
        WHEN 'm' THEN 'male'
        WHEN 'f' THEN 'female'
        WHEN 'x' THEN 'not defined'
    END AS gender,
	COUNT(*) AS likes FROM posts_likes AS pl 
JOIN profiles AS p ON pl.user_id = p.user_id 
GROUP BY gender
ORDER BY likes DESC;
