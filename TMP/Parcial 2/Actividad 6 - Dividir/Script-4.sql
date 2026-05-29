CREATE TABLE Pedidos_Proveedores (
    Id_orden INT PRIMARY KEY,
    Id_cliente INT,
    Cantidad INT,
    Proveedor VARCHAR(50)
);

INSERT INTO Pedidos_Proveedores (Id_orden, Id_cliente, Cantidad, Proveedor) VALUES
(1, 1001, 12, 'IBM'),
(2, 1001, 54, 'IBM'),
(3, 1001, 32, 'Amazon'),
(4, 2002, 7, 'Amazon'),
(5, 2002, 16, 'Amazon'),
(6, 2002, 5, 'IBM');

WITH ConteoPedidos AS (
    
    SELECT 
        Id_cliente, 
        Proveedor, 
        COUNT(*) AS Total_Pedidos
    FROM Pedidos_Proveedores
    GROUP BY Id_cliente, Proveedor
),
RankingProveedores AS (
    
    SELECT 
        Id_cliente, 
        Proveedor,
        ROW_NUMBER() OVER (PARTITION BY Id_cliente ORDER BY Total_Pedidos DESC) AS posicion
    FROM ConteoPedidos
)
-- Paso 3: Filtramos solo los que quedaron en la posición 1
SELECT 
    Id_cliente, 
    Proveedor
FROM RankingProveedores
WHERE posicion = 1;