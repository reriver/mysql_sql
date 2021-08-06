use ships;

# 14 Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT DISTINCT S.class, S.name, C.country
FROM Classes C
JOIN Ships S on C.class = S.class
WHERE C.numGuns >= 10;