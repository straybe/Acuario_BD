-- Conexión a la base de datos conectable
ALTER SESSION SET CONTAINER = "XEPDB1";

-- Creación de tablespace
CREATE TABLESPACE ACUARIO_TBS
DATAFILE 'C:\app\user\product\18.0.0\oradata\XE\XEPDB1\Acuario_TBS.dbf' -- Colocar la dirección dentro de la XEPDB1
SIZE 100M
AUTOEXTEND ON NEXT 10M
MAXSIZE 200M ONLINE;

-- Creación de un usuario
CREATE USER DEVELOPER
IDENTIFIED BY PassDev -- Password
DEFAULT TABLESPACE ACUARIO_TBS
QUOTA UNLIMITED ON ACUARIO_TBS;

-- Creación del rol
CREATE ROLE DESARROLLADOR;
-- Permisos del rol
GRANT CREATE SESSION,
CREATE TABLE,
ALTER ANY TABLE,
DROP ANY TABLE,
INSERT ANY TABLE,
UPDATE ANY TABLE,
DELETE ANY TABLE,
SELECT ANY TABLE,
GRANT CREATE ANY PROCEDURE,
GRANT ALTER ANY PROCEDURE,
GRANT DROP ANY PROCEDURE,
GRANT CREATE ANY VIEW,
GRANT DROP ANY VIEW
TO DESARROLLADOR;

-- Visualizar los privilegios
-- SELECT PRIVILEGE FROM dba_sys_privs WHERE GRANTEE = 'DESARROLLADOR';

-- Asignación de un rol a un usuario
GRANT DESARROLLADOR TO DEVELOPER;

-- Para Borrar el usuario
-- DROP USER USR_RENTA CASCADE;

-- Para Borrar el tablespace
-- DROP TABLESPACE TBS_RENTA
-- INCLUDING CONTENTS AND DATAFILES;

-- Para borrar el rol
-- DROP ROLE PROGRAMADOR;
 
-- Para desconectarnos de sesión de SYSTEM
-- DISC