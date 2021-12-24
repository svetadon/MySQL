-- ДЗ i. Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)

USE vk;

# users
SELECT * FROM users;

INSERT INTO users 
VALUES (DEFAULT, 'Tom', 'Tomych', '5670981234', 'tomych@gmail.com', '81dc9bdb52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Gleb', 'Glebovich', '3870981234', 'glebovich@gmail.com', '81dc9bdb67d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Iren', 'Irenova', '5699981234', 'irenova@mail.ru', '97dc9bdb52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Boris', 'Pasternak', '9070681234', 'pasternak@gmail.com', '05dc9bdv52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Klim', 'Klimovich', '0532981234', 'klimovich@gmail.com', '34dc9bdb52d04dc20036dbd8313ed072', DEFAULT, DEFAULT),
(DEFAULT, 'Tatyana', 'Abramova', '1234981234', 'abramova@list.ru', '72gf9bdb52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Tom', 'Soyer', '6745981234', 'soyer@gmail.com', '45mn9klb52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Jackie', 'Chan', '0784481234', 'jchan@gmail.com', '90569bdb52d04bn20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Elena', 'Gladkova', '1341231234', 'eglad@gmail.com', '34bn5klm52d04dc20036dbd8313ed056', DEFAULT, DEFAULT),
(DEFAULT, 'Nina', 'Zimova', '9009981234', 'zimova@gmail.com', '0909099bdb52d04dc20036dbd8313ed056', DEFAULT, DEFAULT
);

# media
SELECT * FROM media;

INSERT INTO media VALUES 
(DEFAULT, 314, 1, 'f1.jpg', 101, DEFAULT),
(DEFAULT, 315, 1, 'f2.jpg', 100, DEFAULT),
(DEFAULT, 316, 1, 'f3.jpg', 100, DEFAULT),
(DEFAULT, 317, 1, 'f4.jpg', 101, DEFAULT),
(DEFAULT, 318, 1, 'f5.jpg', 80, DEFAULT),
(DEFAULT, 319, 1, 'f6.jpg', 75, DEFAULT),
(DEFAULT, 320, 1, 'f7.jpg', 77, DEFAULT),
(DEFAULT, 321, 1, 'f8.jpg', 90, DEFAULT),
(DEFAULT, 322, 1, 'f9.jpg', 101, DEFAULT),
(DEFAULT, 323, 1, 'f10.jpg', 98, DEFAULT);


# profiles
SELECT * FROM profiles;

INSERT INTO profiles
VALUES (314, 'm', '1977-12-01', 14, 'Deli', 'India'),
(315, 'm', '1983-12-01', 15, 'Saratov', 'Russia'),
(316, 'f', '1965-11-01', 16, 'Omsk', 'Russia'),
(317, 'm', '1990-12-01', 17, 'London', 'England'),
(318, 'm', '2010-01-01', 18, 'New York', 'USA'),
(319, 'f', '2008-12-01', 19, 'Moscow', 'Russia'),
(320, 'm', '1999-03-01', 20, 'Tashkent', 'Uzbekistan'),
(321, 'm', '2000-05-09', 21, 'Vienna', 'Austria'),
(322, 'f', '1988-07-07', 22, 'Ivanovo', 'Russia'),
(323, 'f', '2009-10-01', 23, 'Kiev', 'Ukraine'
);

# friend_requests
INSERT INTO friend_requests 
VALUES (314, 315, 1), (314, 316, 1), (314, 317, 1), (314, 320, DEFAULT);

INSERT INTO friend_requests 
VALUES (315, 316, 1), (315, 317, 1), (315, 318, 1), (315, 319, 1), (315, 320, 1), (315, 321, 1);

SELECT * FROM friend_requests;


# messages
INSERT INTO messages VALUES (DEFAULT, 315, 317, 'Privet!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 317, 315, 'Hi, nice to hear from you!', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO messages VALUES (DEFAULT, 314, 315, 'Hi, Gleb!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 315, 314, 'Hi, how are you?', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO messages VALUES (DEFAULT, 323, 315, 'Глеб, ты приедешь?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 315, 323, 'Пока еще думаю...', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO messages VALUES (DEFAULT, 320, 321, 'Jackie, что изучаешь сейчас?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 321, 320, 'Пару приемчиков для нового фильма', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO messages VALUES (DEFAULT, 319, 318, 'Клим, отправь свое фото', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 318, 319, 'лови мое селфи', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO messages VALUES (DEFAULT, 316, 317, 'Борис, подарите книгу с вашим автографом?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 317, 316, 'Ирен, приезжайте на книжную выставку завтра', DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM messages;

# communities

INSERT INTO communities VALUES (DEFAULT, 'SQL', 'SQL for dummies', 316);
INSERT INTO communities VALUES (DEFAULT, 'Running', 'I love running', 318);
INSERT INTO communities VALUES (DEFAULT, 'Travel', 'Присоединяйся, если любишь путешествовать', 1);
INSERT INTO communities VALUES (DEFAULT, 'ABC', 'English club', 322);
INSERT INTO communities VALUES (DEFAULT, 'FAQ', 'кидай вопросы сюда', 317);
INSERT INTO communities VALUES (DEFAULT, 'Project', 'Best project team', 319);
INSERT INTO communities VALUES (DEFAULT, 'Flowers', 'Best flowers designs', 316);
INSERT INTO communities VALUES (DEFAULT, 'Satoshi', 'Зарабатывай на криптах', 322);
INSERT INTO communities VALUES (DEFAULT, 'БАДы', 'Будь здоров!', 314);
INSERT INTO communities VALUES (DEFAULT, 'Crossfit', 'Хочешь быть сильным и выносливым?', 315);

SELECT * FROM communities;

# communities_users

INSERT INTO communities_users VALUES (2, 314), (2, 315), (2, 318), (2, 322);
INSERT INTO communities_users VALUES (4, 323), (4, 320), (4, 314), (4, 315);
INSERT INTO communities_users VALUES (6, 315), (6, 317), (6, 320), (6, 322);

SELECT * FROM communities_users;

# posts

INSERT INTO posts VALUES (DEFAULT, 'С праздником!', 315);
INSERT INTO posts VALUES (DEFAULT, 'Максимальный репост, пожалуйста!', 318);
INSERT INTO posts VALUES (DEFAULT, 'Примите участие в опросе!', 322);
INSERT INTO posts VALUES (DEFAULT, 'Кто съел мой сыр?', 319);
INSERT INTO posts VALUES (DEFAULT, 'С новым годом!!!', 317);
INSERT INTO posts VALUES (DEFAULT, 'Хочу много подарков!', 318);
INSERT INTO posts VALUES (DEFAULT, 'С днем рождения, меня!', 320);
INSERT INTO posts VALUES (DEFAULT, 'Жду всех в 18.00!', 316);
INSERT INTO posts VALUES (DEFAULT, 'Утро всегда доброе?', 316);
INSERT INTO posts VALUES (DEFAULT, 'Я изучаю sql', 321);

SELECT * FROM posts;

# reels

INSERT INTO reels VALUES (DEFAULT, 322, 'beauty', 100, DEFAULT),
(DEFAULT, 321, 'приготовь кашу', 100, DEFAULT),
(DEFAULT, 315, 'как выполнить дз', 100, DEFAULT),
(DEFAULT, 2, 'excel лайфхаки', 200, DEFAULT),
(DEFAULT, 317, 'начни писать книгу', 100, DEFAULT),
(DEFAULT, 314, 'будь в моменте', 151, DEFAULT),
(DEFAULT, 315, 'утренняя зарядка', 120, DEFAULT),
(DEFAULT, 321, 'премьера фильма', 100, DEFAULT),
(DEFAULT, 318, 'куда сходить на выходных', 100, DEFAULT),
(DEFAULT, 319, 'зож', 90, DEFAULT);

SELECT * FROM reels;

# topics

INSERT INTO topics VALUES (DEFAULT, 314, 'SQL', 'правила синтаксиса скриптов'),
(DEFAULT, 315, 'Hiking', 'какую обувь выбрать'),
(DEFAULT, 317, 'Flight', 'air tickets sites'),
(DEFAULT, 318, 'Bitcoin', 'updated bitcoin rates'),
(DEFAULT, 319, 'Flow', 'как получить новую профессию'),
(DEFAULT, 320, 'Online edu', 'популярный канал онлайн образования'),
(DEFAULT, 322, 'Run', 'где можно побегать в Алматы'),
(DEFAULT, 321, 'Swim', 'бассейны в вашем городе'),
(DEFAULT, 316, 'Apple', 'самый лучший гаджет!?'),
(DEFAULT, 313, 'Books', 'что хочешь почитать?');

SELECT * FROM topics;


-- ДЗ ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;

/* ДЗ - iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 * Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
 */


ALTER TABLE profiles ADD COLUMN is_active BOOLEAN DEFAULT FALSE;

UPDATE profiles SET is_active = 1
WHERE YEAR(NOW()) - YEAR(birthday) > 18;

SELECT * FROM profiles;

# iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

INSERT INTO messages VALUES (DEFAULT, 315, 320, 'Hi, Tom! How are you?', '2023-12-16 15:55:59', '2023-12-16 15:55:59', DEFAULT);

SELECT * FROM messages;

DELETE FROM messages WHERE created_at > NOW();






























