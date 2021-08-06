show databases;
use computers;
use bank;
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
SELECT DISTINCT Product.model, Printer.price
FROM Printer, Product
WHERE Product.maker = 'B' AND Product.model = Printer.model;
SELECT DISTINCT Product.model, Laptop.price
FROM Laptop, Product
WHERE Product.maker = 'B' AND Product.model = Laptop.model;
SELECT DISTINCT Product.model, PC.price
FROM PC, Product
WHERE Product.maker = 'B' AND Product.model = PC.model;
SELECT DISTINCT Product.model, Product.type
FROM Product, PC, Laptop, Printer
WHERE Product.maker = 'B';
SELECT DISTINCT Product.model, PC.price
FROM Product, PC, Laptop, Printer
WHERE Product.maker = 'B' AND Product.model = PC.model
UNION
SELECT DISTINCT Product.model, Laptop.price
FROM Product, PC, Laptop, Printer
WHERE Product.maker = 'B' AND Product.model = Laptop.model
UNION
SELECT DISTINCT Product.model, Printer.price
FROM Product, PC, Laptop, Printer
WHERE Product.maker = 'B' AND Product.model = Printer.model;

#08 Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT Product.maker
FROM Product
WHERE Product.type = 'PC' AND Product.type <> 'Laptop';

# SELECT DISTINCT Product.maker
# FROM Product
# WHERE type = 'PC'
# EXCEPT
# SELECT DISTINCT Product.maker
# FROM Product
# WHERE type = 'Laptop';

#09 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT Product.maker
FROM Product, PC
WHERE Product.type = 'PC' AND PC.speed >= 450

SELECT DISTINCT maker
FROM Product
JOIN PC
  ON Product.model = PC.model
WHERE speed >= 450;

#10 Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT DISTINCT model, price
FROM Printer
WHERE price = (SELECT MAX(price)
 FROM Printer
 );

#11 Найдите среднюю скорость ПК.
SELECT ROUND(AVG(speed))
FROM PC;

#12 Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed)
FROM Laptop
WHERE price > 1000;

#13 Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed)
FROM PC
JOIN Product L on PC.model = L.model
WHERE maker = 'A';

# 15 Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
# Get hard drive capacities that are identical for two or more PCs. Result set: hd.
SELECT PC.hd
FROM PC
GROUP BY PC.hd
HAVING COUNT(hd) >= 2;

# 16 Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
# Result set: model with the bigger number, model with the smaller number, speed, and RAM.
# Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара
# указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим
# номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM PC p1, PC p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model

# 17 Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
# Вывести: type, model, speed
# Get the laptop models that have a speed smaller than the speed of any PC.
# Result set: type, model, speed.





