
DROP DATABASE IF EXISTS vk;

CREATE DATABASE vk;

USE vk;

/* Магазин ВК, создавал сам магазин, но в ничего не покупал ни разу, вот решил посмотреть по категории... Не видел оценок товара*/

DROP TABLE IF EXISTS product_categories;

CREATE TABLE product_categories (
	category_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Уникальный ID категории
	category_name VARCHAR(127) UNIQUE, -- Название категории товаров
	created_at DATETIME DEFAULT NOW(), -- Дата создания
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Дата обновления
    
    INDEX category_name_idx(category_name) -- Поиск по категориям
    
);

DROP TABLE IF EXISTS product_description;

CREATE TABLE product_description (
	product_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Уникальный ID товара
	product_name VARCHAR(127), -- Название товара
	product_photo VARCHAR(127) DEFAULT NULL, -- Изображение товара
	product_description TEXT, -- Описание товара
	product_price DECIMAL(8,0), -- Стоимость товара (не хочу, чтобы было, как в Пятерочке, Эльдорадо... где цена 899, а мелким шрифтом 99... бесит)
	product_category BIGINT UNSIGNED NOT NULL, -- Категория товара
	similar_product BIGINT UNSIGNED NOT NULl, -- Похожие товары
	user_posted_id BIGINT UNSIGNED NOT NULL, -- Пользователь предлагающий товар/услугу
	other_product_user BIGINT UNSIGNED NOT NULL, -- Другие товары продовца
	top_product WHERE FIELD >= 1 AND FIELD <= 5, -- Оценка товара
	sorted_product WHERE FIELD >= 1 AND FIELD <= 10000000, -- Сортировка по стоимости
	created_at DATETIME DEFAULT NOW(), -- Дата создания
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Дата обновления
    
    /* Индексация по категориям, дате, оценке и цене */
    INDEX product_category_idx(product_category),
    INDEX product_updated_at_idx(updated_at),
    INDEX sorted_product_idx(sorted_product),
    INDEX top_product_idx(top_product)
    
    
    FOREIGN KEY fk_product_category(product_category) REFERENCES product_categories(category_id),
    FOREIGN KEY (user_posted_id) REFERENCES users(id)
    
    
);

/*Игры ВК. На подобии Minecraft или гонок*/

DROP TABLE IF EXISTS game_users;
CREATE TABLE game_users (
	active_user_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	activity_status ENUM('Online', 'Offline'),
	created_game_at DATETIME DEFAULT NOW(), -- Дата входа в игру, для отслеживания времени последней активности
	/* Дата обновления времени, чтобы другие игроки знали кто в игре */
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    play_now ENUM('Play', 'Search', 'Play_Comp'), -- Статус игрока в игре (Играет, ищет игру или играет с компьютером)
    raiting ENUM('New', 'Medium', 'Hard'), -- уровень игрока
    
    INDEX active_user_id_idx(active_user_id), 
    INDEX play_now_idx(play_now),
    INDEX raiting_idx(raiting),
    INDEX updated_at_idx(updated_at),
    FOREIGN KEY fk_active_user_id(active_user_id) REFERENCES game_users(id)

);

/*Не получилось соединить сообщения и игру, ошибки вылетали и получался бред... Если поможете, буду очень рад*/
/* Взял из урока

CREATE TABLE messages_game (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  from_user_game_id BIGINT UNSIGNED NOT NULL,
  to_user_game_id BIGINT UNSIGNED NOT NULL,
  txt TEXT NOT NULL,
  is_delivered BOOLEAN DEFAULT False,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  INDEX fk_messages_from_user_idx (from_user_game_id),
  INDEX fk_messages_to_user_idx (to_user_game_id),
  CONSTRAINT fk_messages_users_game_1 FOREIGN KEY (from_user_game_id) REFERENCES game_users (id),
  CONSTRAINT fk_messages_users_game_2 FOREIGN KEY (to_user_game_id) REFERENCES game_users (id)
);
*/