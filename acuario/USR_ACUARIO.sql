-- CREACIÓN DE TABLAS --
CREATE TABLE Correo (
Id_Correo NUMBER(2,0) NOT NULL,
Correo NVARCHAR2(30) NOT NULL,
CONSTRAINT PK_Correo PRIMARY KEY (Id_Correo)
);

CREATE TABLE Peligro (
Id_Peligro NUMBER(1,0) NOT NULL,
Peligro NVARCHAR2(30) NOT NULL,
CONSTRAINT PK_Peligro PRIMARY KEY (Id_Peligro)
);

CREATE TABLE Alimentacion (
Id_Alimentacion NUMBER(2,0) NOT NULL,
Alimentacion NVARCHAR2(20) NOT NULL,
CONSTRAINT PK_Alimentacion PRIMARY KEY (Id_Alimentacion)
);

CREATE TABLE Especie (
Id_Especie NUMBER(2,0) NOT NULL,
Nombre_Comun NVARCHAR2(30) NOT NULL,
Nombre_Cientifico NVARCHAR2(30) NOT NULL,
Descripcion CLOB DEFAULT NULL,
CONSTRAINT PK_Epecie PRIMARY KEY (Id_Especie)
);

CREATE TABLE Tipo_Agua (
Id_Tipo_de_Agua NUMBER(1,0) NOT NULL,
Tipo_de_Agua NVARCHAR2(6) NOT NULL,
CONSTRAINT PK_Tipo_Agua PRIMARY KEY (Id_Tipo_de_Agua)
); 

CREATE TABLE Material (
Id_Material NUMBER(2,0) NOT NULL,
Nombre_Material NVARCHAR2(20) NOT NULL,
CONSTRAINT PK_Material PRIMARY KEY (Id_Material)
);

CREATE TABLE Estado (
Id_Estado NUMBER(2,0) NOT NULL,
Nombre_Estado NVARCHAR2(19) NOT NULL,
CONSTRAINT PK_Estado PRIMARY KEY (Id_Estado)
);

CREATE TABLE Habitat (
Id_Habitat NUMBER(2,0) NOT NULL,
Nombre_Habitat VARCHAR2(50) NOT NULL,
Ancho NUMBER(4,0),
Largo NUMBER(4,0),
Alto NUMBER(3,0),
Descripcion CLOB DEFAULT NULL,
Temperaturatura NUMBER(3,1) NOT NULL,
PH_Agua NUMBER(2,1) NOT NULL,
Id_Tipo_de_Agua NUMBER(1,0) NOT NULL,
Id_Material NUMBER(2,0) NOT NULL,
CONSTRAINT FK_Habitat_Tipo_de_Agua FOREIGN KEY (Id_Tipo_de_Agua) REFERENCES Tipo_Agua(Id_Tipo_de_Agua),
CONSTRAINT FK_Habitat_Material FOREIGN KEY (Id_Material) REFERENCES Material(Id_Material),
CONSTRAINT PK_Habitat PRIMARY KEY (Id_Habitat)
); 

CREATE TABLE Direccion (
Id_Direccion NUMBER(2,0) NOT NULL,
Alcaldia_Municipio NVARCHAR2(40) NOT NULL,
Colonia NVARCHAR2(50) NOT NULL,
CP NUMBER(5,0) NOT NULL,
Calle NVARCHAR2(50) NOT NULL,
Numero_Exterior NUMBER(4,0) DEFAULT NULL,
Numero_Interior NUMBER(4,0) DEFAULT NULL,
Id_Estado NUMBER(2,0) NOT NULL,
CONSTRAINT FK_Direccion_Estado FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado),
CONSTRAINT PK_Direccion PRIMARY KEY (Id_Direccion)
);


CREATE TABLE Sucursal (
Id_Sucursal NUMBER(5,0) NOT NULL,
Nombre_Sucursal NVARCHAR2(20) NOT NULL,
Lada NUMBER(3,0),
Telefono NUMBER(8,0),
Extension NUMBER(4,0),
Pagina_Web NVARCHAR2(50),
Id_Direccion NUMBER(2,0) NOT NULL,
Id_Correo NUMBER(2,0) NOT NULL,
CONSTRAINT FK_Sucursal_Direccion FOREIGN KEY (Id_Direccion) REFERENCES Direccion(Id_Direccion),
CONSTRAINT FK_Sucursal_Correo FOREIGN KEY (Id_Correo) REFERENCES Correo(Id_Correo),
CONSTRAINT PK_Sucursal PRIMARY KEY (Id_Sucursal)
); 

CREATE TABLE Animal (
Id_Animal NUMBER(4,0) NOT NULL,
Nombre_Animal NVARCHAR2(20),
Cantidad_de_Alimento NUMBER(5,0) NOT NULL,
Condicion_Especial CLOB DEFAULT NULL,
Id_Alimentacion NUMBER(2,0) NOT NULL,
Id_Peligro NUMBER(1,0) NOT NULL,
Id_Habitat NUMBER(2,0) NOT NULL,
Id_Especie NUMBER(2,0) NOT NULL,
Id_Sucursal NUMBER(5,0) NOT NULL,
CONSTRAINT FK_Animal_Alimentacion FOREIGN KEY (Id_Alimentacion) REFERENCES Alimentacion(Id_Alimentacion),
CONSTRAINT FK_Animal_Peligro FOREIGN KEY (Id_Peligro) REFERENCES Peligro(Id_Peligro),
CONSTRAINT FK_Animal_Habitat FOREIGN KEY (Id_Habitat) REFERENCES Habitat(Id_Habitat),
CONSTRAINT FK_Animal_Especie FOREIGN KEY (Id_Especie) REFERENCES Especie(Id_Especie),
CONSTRAINT FK_Animal_Sucursal FOREIGN KEY (Id_Sucursal) REFERENCES Sucursal(Id_Sucursal),
CONSTRAINT PK_Animal PRIMARY KEY (Id_Animal)
); 

CREATE TABLE Empleado (
Id_Empleado NUMBER(2,0) NOT NULL,
Nombre_Empleado NVARCHAR2(20) NOT NULL,
Apellido_Paterno NVARCHAR2(20) NOT NULL,
Apellido_Materno NVARCHAR2(20) NOT NULL,
Tipo_de_Empleado NVARCHAR2(30) NOT NULL,
Id_Sucursal NUMBER(5,0) NOT NULL,
Id_Direccion NUMBER(2,0) NOT NULL,
Id_Correo NUMBER(2,0) NOT NULL,
CONSTRAINT FK_Empleado_Sucursal FOREIGN KEY (Id_Sucursal) REFERENCES Sucursal(Id_Sucursal),
CONSTRAINT FK_Empleado_Direccion FOREIGN KEY (Id_Direccion) REFERENCES Direccion(Id_Direccion),
CONSTRAINT FK_Empleado_Correo FOREIGN KEY (Id_Correo) REFERENCES Correo(Id_Correo),
CONSTRAINT pk_Empleado PRIMARY KEY (Id_Empleado)
);
