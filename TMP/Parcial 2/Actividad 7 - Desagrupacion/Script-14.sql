CREATE TABLE Inventario (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    Producto VARCHAR(50),
    Cantidad INT
);


INSERT INTO Inventario (Producto, Cantidad) VALUES
('Lápiz', 3),
('Borrador', 4),
('Cuaderno', 2);

WITH RECURSIVE Desagrupacion AS (
    -- Caso base
    SELECT Producto, Cantidad
    FROM Inventario
    
    UNION ALL
    
    -- Caso recursivo
    SELECT Producto, Cantidad - 1
    FROM Desagrupacion
    WHERE Cantidad > 1
)
-- Resultado final
SELECT Producto, 1 AS Cantidad
FROM Desagrupacion
ORDER BY 
    CASE Producto 
        WHEN 'Lápiz' THEN 1 
        WHEN 'Borrador' THEN 2 
        WHEN 'Cuaderno' THEN 3 
    END;