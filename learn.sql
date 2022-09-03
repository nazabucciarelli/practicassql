CREATE DATABASE MI_BDD;

CREATE TABLE Users(
		id_user int NOT NULL,
        password_user varchar(10) NOT NULL,
        email varchar(50) NOT NULL,
        id_permiso int NOT NULL
);

CREATE TABLE Permisos(
	id_permiso int NOT NULL,
    permiso varchar(40) NOT NULL
);

# Crear clave primaria

ALTER TABLE Users 
ADD PRIMARY KEY (id_user);


# Clave foranea para unir dos tablas

ALTER TABLE Users ADD FOREIGN KEY (id_permiso)
REFERENCES Permisos(id_permiso);

# Seleccionar datos

SELECT email, id_permiso FROM Users;

# Insertar datos

INSERT INTO Users (password_user, email, id_permiso) VALUES ("12345","bnazareno@hotmail.com","1");

# Actualizar datos

UPDATE Users SET password_user = "555", email = "nazareno@gmail.com" WHERE id_user = 1;

# Borrar datos

DELETE FROM Users WHERE id_user = 2;

# Operadores
# IS NULL para seleccionar aquellos campos que sean nulos
#IS NOT NULL  para seleccionar aquellos campos que no sean nulos
#IN para seleccionar aquellos campos que estén dentro de una lista
#LIKE para buscar con algún patrón

# Ordenar datos, se usa order by.

SELECT * FROM Users ORDER BY id_user ASC, password_user DESC;

# Funciones de agregacion
# Son MAX, MIN, AVG(PROMEDIO), SUM, Y COUNT
# si queremos obtener el campo máximo de id_users hariamos esto

SELECT MAX(id_user) FROM Users;

#subconsultas: Es una consulta select dentro de otra consulta select

SELECT * FROM Users WHERE id_permiso IN(SELECT id_permiso FROM Permisos WHERE permiso = "Admin");

#Ejercicios de AP

SELECT DISTINCT P.nombre AS "Provincias con clientes" FROM clientes C INNER JOIN
provincias P ON C.codigoProvincia = P.codigo;

SELECT P.nombre AS "Provincias sin clientes" FROM clientes C RIGHT JOIN
provincias P ON C.codigoProvincia = P.codigo WHERE C.codigoProvincia is null;