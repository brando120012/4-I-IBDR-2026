CREATE TABLE asientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_asiento INTEGER
);

INSERT INTO asientos (num_asiento) 
VALUES (7),(13),(14),(15),(27),(28),(29),(30),(31),(32),(33),(34),(35),(52),(53),(54);

WITH RECURSIVE secuencia AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM secuencia WHERE n < 54
),
faltantes AS (
    -- Seleccionamos los números que NO están en la tabla asientos
    SELECT n FROM secuencia
    WHERE n NOT IN (SELECT num_asiento FROM asientos)
),
grupos AS (
    -- Agrupamos números consecutivos restando su posición (truco de islas y huecos)
    SELECT n, n - ROW_NUMBER() OVER (ORDER BY n) AS grupo
    FROM faltantes
)
SELECT MIN(n) AS espacio_inicio, MAX(n) AS espacio_final
FROM grupos
GROUP BY grupo
ORDER BY espacio_inicio;

SELECT (54 - COUNT(*)) AS disponibles
FROM asientos;

SELECT 
    CASE WHEN num_asiento % 2 = 0 THEN 'pares' ELSE 'impares' END AS tipo,
    COUNT(*) AS total
FROM asientos
GROUP BY tipo
ORDER BY tipo DESC; 