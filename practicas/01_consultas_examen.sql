-- 1. Mostrar todos los animales de un hábitat
SELECT NOMBRE_ANIMAL
FROM ANIMAL
JOIN HABITAT USING(ID_HABITAT)
WHERE NOMBRE_HABITAT LIKE 'Gusanos marinos';

-- 2. Mostrar todas las especies en peligro de extinción
SELECT NOMBRE_CIENTIFICO AS ESPECIE_AMENAZADA
FROM ANIMAL
JOIN PELIGRO USING(ID_PELIGRO)
JOIN ESPECIE USING(ID_ESPECIE)
WHERE PELIGRO LIKE 'Amenzada'
GROUP BY NOMBRE_CIENTIFICO;
-- 3. Mostrar el alimento que se tiene que suministrar en un hábitat
SELECT ALIMENTACION, COUNT(ALIMENTACION) AS CANTIDAD_DE_ANIMALES
FROM ANIMAL
JOIN HABITAT USING(ID_HABITAT)
JOIN ALIMENTACION USING(ID_ALIMENTACION)
WHERE NOMBRE_HABITAT LIKE 'Gusanos marinos'
GROUP BY ALIMENTACION;
-- 4. Mostrar todos los hábitats y la cantidad de animales en estos
SELECT NOMBRE_HABITAT, COUNT(NOMBRE_ANIMAL) AS ANIMALES
FROM ANIMAL
JOIN HABITAT USING(ID_HABITAT)
GROUP BY NOMBRE_HABITAT
ORDER BY ANIMALES;
-- 5. Mostrar las sucursales y la cantidad de animales en cada uno
SELECT NOMBRE_SUCURSAL, COUNT(NOMBRE_SUCURSAL) AS ANIMALES
FROM ANIMAL
JOIN SUCURSAL USING(ID_SUCURSAL)
GROUP BY NOMBRE_SUCURSAL;