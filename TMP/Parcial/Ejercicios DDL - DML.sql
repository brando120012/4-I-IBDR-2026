/* Implementacion de una base de datos en un sistema de informacion
2026/03/04 4-I
Juan Antonio Ortega Sandoval
Nombre de la practica: Comandos DDL y DML básicos
*/

-- 1. Crear tabla "departamentos" (Ya proporcionada)
CREATE TABLE departamentos (
  id int NOT NULL,
  name varchar(25) NOT NULL,
  location date NOT NULL, -- Nota: Usualmente sería VARCHAR
  PRIMARY KEY (id, name)
);

-- 2. Crear una tabla llamada "empleados" con las columnas id, nombre, edad, y salario.
-- Definimos salario como DECIMAL inicialmente para luego practicar el cambio de tipo.
CREATE TABLE empleados (
  id int PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  edad int,
  salario decimal(10,2)
);

-- 3. Insertar 5 registros en la tabla "empleados".
INSERT INTO empleados (id, nombre, edad, salario) VALUES 
(1, 'Ana García', 28, 2500.50),
(2, 'Carlos López', 35, 3200.00),
(3, 'Elena Pérez', 24, 1800.75),
(4, 'Marcos Ruiz', 42, 4500.00),
(5, 'Sofía Torres', 30, 2900.25);

-- 4. Agregar una nueva columna "departamento" a la tabla "empleados".
ALTER TABLE empleados ADD departamento varchar(30);

-- 5. Cambiar el tipo de dato de la columna "salario" a Integer.
-- (La sintaxis exacta puede variar ligeramente entre MySQL, PostgreSQL o SQL Server)
ALTER TABLE empleados ALTER COLUMN salario TYPE int;

-- 6. Eliminar la columna "departamento" de la tabla "empleados".
ALTER TABLE empleados DROP COLUMN departamento;

-- 7. Eliminar la tabla "departamentos" permanentemente.
DROP TABLE departamentos;

-- 8. Eliminar todos los registros de la tabla "empleados" pero mantener la tabla.
TRUNCATE TABLE empleados;

-- 9. Renombrar la tabla "empleados" a "staff".
ALTER TABLE empleados RENAME TO staff;

-- 10. Definir 0 como valor predeterminado en la columna "salario".
ALTER TABLE staff ALTER COLUMN salario SET DEFAULT 0;

-- 11. Crear un nuevo esquema llamado "rh_db".
CREATE SCHEMA rh_db;

-- 12. Mover la tabla "staff" (antes empleados) al esquema "rh_db".
ALTER TABLE staff SET SCHEMA rh_db;