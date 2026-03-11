CREATE TABLE Brandon.GEA (
    ID_empleado INT NOT NULL, 
    id_gerente INT NULL,      
    Puesto varchar(100) NOT NULL,
    CONSTRAINT a_pk PRIMARY KEY(ID_empleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.GEA (ID_empleado, id_gerente, Puesto)
VALUES 
(1001, NULL, 'Presidente'), 
(2002, 1001, 'Director'), 
(3003, 1001, 'Gerente'), 
(4004, 2002, 'Ingeniero'), 
(5005, 2002, 'Contador'), 
(6006, 2002, 'Administrador');

WITH RECURSIVE Organigrama AS (
    -- 1. Starting point: The Presidente
    SELECT ID_empleado, id_gerente, Puesto, 0 AS Nivel
    FROM Brandon.GEA
    WHERE id_gerente IS NULL

    UNION ALL

    -- 2. The Loop: Matching managers to employees
    SELECT e.ID_empleado, e.id_gerente, e.Puesto, o.Nivel + 1
    FROM Brandon.GEA e
    INNER JOIN Organigrama o ON e.id_gerente = o.ID_empleado
)
-- 3. Displaying the final levels
SELECT * FROM Organigrama 
ORDER BY Nivel, ID_empleado;