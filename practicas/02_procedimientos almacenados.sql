-- Definición de procedimiento almacenado
-- 1. Mostrar todos los animales de un hábitat
create or replace PROCEDURE GET_ANIMALS_OF_A_HABITAT(NOM_HABITAT IN VARCHAR2, ANIMALS OUT SYS_REFCURSOR) AS
BEGIN 
    OPEN ANIMALS FOR
        SELECT NOMBRE_ANIMAL
        FROM ANIMAL
        JOIN HABITAT USING(ID_HABITAT)
        WHERE NOMBRE_HABITAT LIKE NOM_HABITAT;
END GET_ANIMALS_OF_A_HABITAT;

DECLARE -- Llamada al procedimiento almacenado
ANIM SYS_REFCURSOR;
ANIMAL VARCHAR2(20);
NOM_HABITAT VARCHAR2(50);
BEGIN
    NOM_HABITAT := 'Gusanos marinos';
    GET_ANIMALS_OF_A_HABITAT(NOM_HABITAT, ANIM);
    LOOP
    FETCH ANIM INTO ANIMAL;
    EXIT WHEN ANIM%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(ANIMAL);
    END LOOP;
    CLOSE ANIM;
END;

------------------------------------------------------------------------------------------------------------------------
-- Definición de procedimiento almacenado
-- 2. Mostrar todas las especies en peligro de extinción
create or replace PROCEDURE GET_ALL_SPECIES_IN_DANGER_OF_EXTINTION(AMENAZA IN VARCHAR2, ANIMALS OUT SYS_REFCURSOR) AS
BEGIN 
    OPEN ANIMALS FOR
        SELECT NOMBRE_CIENTIFICO AS ESPECIE_AMENAZADA
        FROM ANIMAL
        JOIN PELIGRO USING(ID_PELIGRO)
        JOIN ESPECIE USING(ID_ESPECIE)
        WHERE PELIGRO LIKE AMENAZA
        GROUP BY NOMBRE_CIENTIFICO;
END GET_ALL_SPECIES_IN_DANGER_OF_EXTINTION;

DECLARE -- Llamada al procedimiento almacenado
AMENAZA VARCHAR2(30);
ANIM SYS_REFCURSOR;
NOM_ESPECIE VARCHAR2(30);
BEGIN
    AMENAZA := 'Amenazada';
    GET_ALL_SPECIES_IN_DANGER_OF_EXTINTION(AMENAZA, ANIM);
    LOOP 
    FETCH ANIM INTO NOM_ESPECIE;
    EXIT WHEN ANIM%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(NOM_ESPECIE);
    END LOOP;
    CLOSE ANIM;
END;

------------------------------------------------------------------------------------------------------------------------
-- Definición de procedimiento almacenado
-- 3. Mostrar el alimento que se tiene que suministrar en un hábitat
create or replace PROCEDURE GET_FOOD_IN_A_HABITAT (HABITAT IN VARCHAR2, FOOD OUT SYS_REFCURSOR) AS
BEGIN
    OPEN FOOD FOR
        SELECT ALIMENTACION, COUNT(ALIMENTACION) AS CANTIDAD_DE_ANIMALES
        FROM ANIMAL
        JOIN HABITAT USING(ID_HABITAT)
        JOIN ALIMENTACION USING(ID_ALIMENTACION)
        WHERE NOMBRE_HABITAT LIKE HABITAT
        GROUP BY ALIMENTACION;
END GET_FOOD_IN_A_HABITAT;

DECLARE -- Llamada al procedimiento almacenado
ALIMENTACION VARCHAR2(50);
COUNT_ALIMENTO NUMBER;
FOOD SYS_REFCURSOR;
NOM_HABITAT VARCHAR2(50);
BEGIN
    NOM_HABITAT := 'Gusanos marinos';
    GET_FOOD_IN_A_HABITAT(NOM_HABITAT, FOOD);
    LOOP
    FETCH FOOD INTO ALIMENTACION, COUNT_ALIMENTO;
    EXIT WHEN FOOD%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(ALIMENTACION || '    ' || COUNT_ALIMENTO);
    END LOOP;
    CLOSE FOOD;
END;

------------------------------------------------------------------------------------------------------------------------
-- Definición de procedimiento almacenado
-- 4. Mostrar todos los hábitats y la cantidad de animales en estos
create or replace PROCEDURE GET_HABITATS_AND_ANIMALS_IN_IT(ANIMALS OUT SYS_REFCURSOR) AS
BEGIN 
    OPEN ANIMALS FOR
        SELECT NOMBRE_HABITAT, COUNT(NOMBRE_ANIMAL) AS ANIMALES
        FROM ANIMAL
        JOIN HABITAT USING(ID_HABITAT)
        GROUP BY NOMBRE_HABITAT
        ORDER BY ANIMALES;
END GET_HABITATS_AND_ANIMALS_IN_IT;

DECLARE -- Llamada al procedimiento almacenado
NOMBRE_HAB VARCHAR2(50);
C_ANIMALES NUMBER;
ANIM SYS_REFCURSOR;
BEGIN
    GET_HABITATS_AND_ANIMALS_IN_IT(ANIM);
    LOOP
    FETCH ANIM INTO NOMBRE_HAB, C_ANIMALES;
    EXIT WHEN ANIM%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(NOMBRE_HAB||'    '||C_ANIMALES);
    END LOOP;
    CLOSE ANIM;
END;

------------------------------------------------------------------------------------------------------------------------
-- Definición de procedimiento almacenado
-- 5. Mostrar las sucursales y la cantidad de animales en cada uno
create or replace PROCEDURE GET_AQUARIUMS_AND_ANIMALS_IN_EACH_ONE(ANIMALS OUT SYS_REFCURSOR) AS
BEGIN
    OPEN ANIMALS FOR
        SELECT NOMBRE_SUCURSAL, COUNT(NOMBRE_SUCURSAL) AS ANIMALES
        FROM ANIMAL
        JOIN SUCURSAL USING(ID_SUCURSAL)
        GROUP BY NOMBRE_SUCURSAL;
END GET_AQUARIUMS_AND_ANIMALS_IN_EACH_ONE;

DECLARE -- Llamada al procedimiento almacenado
NOMBRE_SUCURSAL VARCHAR2(20);
C_ANIMALS NUMBER;
ANIM SYS_REFCURSOR;
BEGIN
    GET_AQUARIUMS_AND_ANIMALS_IN_EACH_ONE(ANIM);
    LOOP
    FETCH ANIM INTO NOMBRE_SUCURSAL, C_ANIMALS;
    EXIT WHEN ANIM%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(NOMBRE_SUCURSAL||'    '||C_ANIMALS);
    END LOOP;
    CLOSE ANIM;
END;
------------------------------------------------------------------------------------------------------------------------
