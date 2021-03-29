/* Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name */

-- Удалить БД если уже существует
DROP DATABASE IF EXISTS example;

-- Создать БД (Дополнитнльных условий указывать не стал, так как перед этим удаляю существующую БД)
CREATE DATABASE example;

-- Выбор БД для работы
USE example;

-- Создание таблицы users (Дополнитнльных условий указывать не стал, так как перед этим удаляю существующую БД)
CREATE TABLE users (
	id SERIAL,
	name VARCHAR(256)
);