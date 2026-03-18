
CREATE TABLE RegistroProcesos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Flujo VARCHAR(50),
    Paso INT,
    Estado VARCHAR(50)
);


INSERT INTO RegistroProcesos (Flujo, Paso, Estado) VALUES
('Alpha', 1, 'Error'),
('Alpha', 2, 'Finalizado'),
('Alpha', 3, 'Corriendo'),
('Bravo', 1, 'Finalizado'),
('Bravo', 2, 'Finalizado'),
('Charlie', 1, 'Corriendo'),
('Charlie', 2, 'Corriendo'),
('Delta', 1, 'Error'),
('Delta', 2, 'Error'),
('Echo', 1, 'Corriendo'),
('Echo', 2, 'Finalizado');

-- 3. Consulta final (con el alias corregido)
SELECT
    Flujo,
    CASE 
        WHEN COUNT(DISTINCT Estado) = 1 THEN MAX(Estado)
        WHEN SUM(CASE WHEN Estado = 'Error' THEN 1 ELSE 0 END) > 0 THEN 'Indeterminado'
        ELSE 'Corriendo'
    END AS "Estado General" 
FROM RegistroProcesos
GROUP BY Flujo;