/*
* Написать крипт, добавляющий в БД vk, которую создали на занятии, 
* 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/

USE vk;

# создаем 1ую таблицу topics

CREATE TABLE topics(
	id_topic SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL, 
	topic_name VARCHAR(100) NOT NULL,
	desription VARCHAR(250),
	INDEX topics_name_idx (topic_name)
);

INSERT INTO topics VALUES (DEFAULT, 1, 'My day', 'Good morning!');

SELECT * FROM topics;

# создаем 2ую таблицу posts

CREATE TABLE posts(
	id_post SERIAL PRIMARY KEY,
	description TEXT NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO posts VALUES (DEFAULT, 'Приветсвую всех на моей страничке!', 2);

SELECT * FROM posts;

# создаем 3ю таблицу reels;

CREATE TABLE reels(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	file_size BIGINT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO reels VALUES (DEFAULT, 2, 'my breakfast', 100, DEFAULT);

SELECT * FROM reels;





















