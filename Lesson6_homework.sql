
USE vk2;

/*
* 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
* который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

SELECT 
	from_user_id,
	(SELECT CONCAT(firstname, ' ', lastname) FROM users WHERE id = messages.from_user_id) AS 'recipient',
	COUNT(*) AS 'send' FROM messages
WHERE to_user_id = 3 
GROUP BY from_user_id
ORDER BY send DESC
LIMIT 1;


/*
 * 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */

SELECT COUNT(*) FROM posts_likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE timestampdiff(YEAR, birthday, NOW()) < 10);


/*
 * 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	CASE(gender)
        WHEN 'm' THEN 'male'
        WHEN 'f' THEN 'female'
        WHEN 'x' THEN 'not defined'
    END as gender,
	COUNT(*) AS likes FROM posts_likes, profiles
	WHERE posts_likes.user_id = profiles.user_id 
GROUP BY gender
ORDER BY likes DESC;
   