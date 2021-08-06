show databases;
use computers;
show tables;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'Laptop';

#список всех колонок в таблице Laptop
select column_name from information_schema.columns where table_name='Laptop';

#Найдите номер модели, скорость и размер жесткого диска для всех PC стоимостью менее 500 долларов. Вывести: model, speed и hd
SELECT model, speed, hd
FROM PC
WHERE price < 500;
#лишнее
SELECT Product.model, PC.speed, PC.hd
FROM Product, PC
WHERE Product.model = PC.model AND price < 500;
#02 SELECT
# Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT Product.maker
FROM Product
WHERE Product.type = 'Printer';
#03 Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT Laptop.model, Laptop.ram, Laptop.screen
FROM Laptop
WHERE Laptop.price > 1000;
#04 Найдите все записи таблицы Printer для цветных принтеров.
SELECT *
FROM Printer
WHERE Printer.color = 'y';
#05 Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT PC.model, PC.speed, PC.hd
FROM PC
WHERE price < 600 AND (cd = '12x' OR cd = '24x');
#06 Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт,
# найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product, Laptop
WHERE Laptop.hd >= 10 AND Product.model = Laptop.model;
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product
INNER JOIN Laptop
ON Product.model = Laptop.model
WHERE Laptop.hd >= 10;
SELECT DISTINCT Product.maker, Laptop.speed
FROM Laptop
INNER JOIN Product
ON Product.model = Laptop.model
WHERE Laptop.hd >= 10;
#07 Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа)
# производителя B (латинская буква).


