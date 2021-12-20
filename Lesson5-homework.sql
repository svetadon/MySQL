-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”

# 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

USE shop;

SELECT * FROM users;

UPDATE users
	SET created_at = NOW(), updated_at = NOW();

/* 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */

ALTER TABLE products 
	CHANGE COLUMN created_at created_at VARCHAR(150),
	CHANGE COLUMN updated_at updated_at VARCHAR(150);

DESCRIBE products;

SELECT created_at, updated_at FROM products;

ALTER TABLE products 
	CHANGE COLUMN created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

/* 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 * Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */

DESCRIBE storehouses_products;

INSERT INTO storehouses_products (storehouse_id, product_id, value)
	VALUES (1, 001, 15),
	(1, 002, 70),
	(1, 003, 0),
	(1, 004, 10),
	(1, 005, 0);

SELECT value FROM storehouses_products
	ORDER BY CASE WHEN value = 0 THEN 1 ELSE 0 END, value;

/* 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий ('may', 'august')
 */

SELECT name, birthday_at,
	CASE
	WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
    WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
    END AS month
FROM users 
	WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

/* (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */

SELECT * FROM catalogs WHERE id IN (5, 1, 2);

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
	ORDER BY CASE 
	WHEN id = 5 THEN 0
    WHEN id = 1 THEN 1
    WHEN id = 2 THEN 2
    END;



-- Практическое задание теме “Агрегация данных”

# 1. Подсчитайте средний возраст пользователей в таблице users

SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AS AVG_Age FROM users;

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

SELECT DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS birthday_weekday_current_year,
    COUNT(*) AS birthday_count
	FROM users GROUP BY birthday_weekday_current_year
	ORDER BY birthday_count DESC;


# 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы

CREATE TABLE integers (
	value SERIAL PRIMARY KEY
);

INSERT INTO integers VALUES
	(1),
	(2),
	(3),
	(4),
	(5);

SELECT round(EXP(SUM(log(value))), 0) AS factorial FROM integers; 














