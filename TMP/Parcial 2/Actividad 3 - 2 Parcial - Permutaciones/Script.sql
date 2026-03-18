DROP TABLE IF EXISTS Brandon.Caso;

CREATE TABLE Brandon.Caso (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY, 
    Finalizado VARCHAR(20) NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.Caso (Finalizado)
VALUES ('A'), ('B'), ('C');

WITH RECURSIVE Permutaciones AS (
    SELECT 
        CAST(Finalizado AS CHAR(255)) AS Resultado, 
        1 AS Iteracion
    FROM Brandon.Caso
    
    UNION ALL
    
    SELECT 
        CONCAT(p.Resultado, ',', c.Finalizado),
        p.Iteracion + 1
    FROM Permutaciones p
    INNER JOIN Brandon.Caso c ON p.Resultado NOT LIKE CONCAT('%', c.Finalizado, '%')
    WHERE p.Iteracion < (SELECT COUNT(*) FROM Brandon.Caso)
)
-- 3. Resultado Final
SELECT Resultado AS Permutacion
FROM Permutaciones
WHERE Iteracion = (SELECT COUNT(*) FROM Brandon.Caso)
ORDER BY Permutacion;