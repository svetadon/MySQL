/*
* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

USE shop;

INSERT INTO orders VALUES
	(DEFAULT, 1, DEFAULT, DEFAULT),
	(DEFAULT, 2, DEFAULT, DEFAULT),
	(DEFAULT, 3, DEFAULT, DEFAULT),
	(DEFAULT, 4, DEFAULT, DEFAULT),
	(DEFAULT, 5, DEFAULT, DEFAULT),
	(DEFAULT, 6, DEFAULT, DEFAULT);

SELECT name FROM users AS u
	LEFT JOIN orders AS o ON (o.user_id = u.id)
	GROUP BY u.name
	HAVING COUNT(o.id) > 0;

/*
* 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
SELECT c.name, p.name FROM catalogs AS c
	LEFT JOIN products AS p ON (c.id = p.id)
	GROUP BY c.id;

/*
* 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
* Поля from, to и label содержат английские названия городов, поле name — русское. 
* Выведите список рейсов flights с русскими названиями городов.
*/
CREATE DATABASE flights_direction;
USE flights_direction;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	label VARCHAR(250) COMMENT 'city name',
	name VARCHAR(250) COMMENT 'название города',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW())
	COMMENT = 'словарь городов';


DROP TABLE IF EXISTS flights;	
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	flight_from VARCHAR(250) NOT NULL COMMENT 'откуда',
	flight_to VARCHAR(250) NOT NULL COMMENT 'куда',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
	CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES cities (id) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE)
	COMMENT = 'рейсы';

INSERT INTO cities VALUES 
	(DEFAULT, 'moscow', 'Москва', DEFAULT, DEFAULT),
	(DEFAULT, 'irkutsk', 'Иркутск', DEFAULT, DEFAULT),
	(DEFAULT, 'novgorod', 'Новгород', DEFAULT, DEFAULT),
	(DEFAULT, 'kazan', 'Казань', DEFAULT, DEFAULT),
	(DEFAULT, 'omsk', 'Омск', DEFAULT, DEFAULT);

INSERT INTO flights VALUES
	(DEFAULT, 'moscow', 'omsk', DEFAULT, DEFAULT),
	(DEFAULT, 'novgorod', 'kazan', DEFAULT, DEFAULT),
	(DEFAULT, 'irkutsk', 'moscow', DEFAULT, DEFAULT),
	(DEFAULT, 'omsk', 'irkutsk', DEFAULT, DEFAULT),
	(DEFAULT, 'moscow', 'kazan', DEFAULT, DEFAULT);

-- решение #1 с подзапросами
SELECT
	id,
	(SELECT name FROM cities WHERE flight_from = cities.label) AS 'откуда',
	(SELECT name FROM cities WHERE flight_to = cities.label) AS 'куда'
FROM flights;
	
-- решение #2 с join

SELECT c1.name AS 'откуда', c2.name AS 'куда' FROM flights f 
	LEFT JOIN cities c1 ON (c1.label = f.flight_from) 
	LEFT JOIN cities c2 ON (c2.label = f.flight_to);

