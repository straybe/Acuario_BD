-- 1. Mostrar todos los animales de un hábitat
CREATE OR REPLACE VIEW ANIMALS_OF_A_HABITAT(NOMBRE_ANIMAL) AS 
    SELECT NOMBRE_ANIMAL
    FROM ANIMAL
    JOIN HABITAT USING(ID_HABITAT)
    WHERE NOMBRE_HABITAT LIKE 'Gusanos marinos';

-- Llamada a la vista
SELECT * FROM  ANIMALS_OF_A_HABITAT;

-------------------------------------------------------------------------------------------
-- 2. Mostrar todas las especies en peligro de extinción
CREATE OR REPLACE VIEW ALL_SPECIES_IN_DANGER_OF_EXTINCTION (ESPECIE_AMENAZADA) AS 
    SELECT NOMBRE_CIENTIFICO AS ESPECIE_AMENAZADA
    FROM ANIMAL
    JOIN PELIGRO USING(ID_PELIGRO)
    JOIN ESPECIE USING(ID_ESPECIE)
    WHERE PELIGRO LIKE 'Amenazada'
    GROUP BY NOMBRE_CIENTIFICO;

-- Llamada a la vista
SELECT * FROM  ALL_SPECIES_IN_DANGER_OF_EXTINCTION;

-------------------------------------------------------------------------------------------
-- 3. Mostrar el alimento que se tiene que suministrar en un hábitat
CREATE OR REPLACE VIEW FOOD_IN_A_HABITAT (ALIMENTACION, CANTIDAD_DE_ANIMALES) AS 
    SELECT ALIMENTACION, COUNT(ALIMENTACION) AS CANTIDAD_DE_ANIMALES
    FROM ANIMAL
    JOIN HABITAT USING(ID_HABITAT)
    JOIN ALIMENTACION USING(ID_ALIMENTACION)
    WHERE NOMBRE_HABITAT LIKE 'Gusanos marinos'
    GROUP BY ALIMENTACION;

-- Llamada a la vista
SELECT * FROM  FOOD_IN_A_HABITAT;

-------------------------------------------------------------------------------------------
-- 4. Mostrar todos los hábitats y la cantidad de animales en estos
CREATE OR REPLACE VIEW HABITATS_AND_ANIMALS_IN_IT (NOMBRE_HABITAT, ANIMALES) AS 
    SELECT NOMBRE_HABITAT, COUNT(NOMBRE_ANIMAL) AS ANIMALES
    FROM ANIMAL
    JOIN HABITAT USING(ID_HABITAT)
    GROUP BY NOMBRE_HABITAT
    ORDER BY ANIMALES;

-- Llamada a la vista
SELECT * FROM  HABITATS_AND_ANIMALS_IN_IT;

-------------------------------------------------------------------------------------------
-- 5. Mostrar las sucursales y la cantidad de animales en cada uno
CREATE OR REPLACE VIEW AQUARIUMS_AND_ANIMALS_IN_EACH_ONE (NOMBRE_SUCURSAL, ANIMALES) AS 
    SELECT NOMBRE_SUCURSAL, COUNT(NOMBRE_SUCURSAL) AS ANIMALES
    FROM ANIMAL
    JOIN SUCURSAL USING(ID_SUCURSAL)
    GROUP BY NOMBRE_SUCURSAL;

-- Llamada a la vista
SELECT * FROM  AQUARIUMS_AND_ANIMALS_IN_EACH_ONE;
-------------------------------------------------------------------------------------------
