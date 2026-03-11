CREATE TABLE Brandon.Ordenes (
    Id_cliente INT NOT NULL,
    Id_Orden INT NOT NULL,
    Estado_Destino VARCHAR(50) NOT NULL,
    Costo INT NOT NULL,
    CONSTRAINT ordenes_pk PRIMARY KEY (Id_Orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.Ordenes (Id_cliente, Id_Orden, Estado_Destino, Costo)
VALUES 
(1001, 1, 'JAL', 987),
(1001, 2, 'CDMX', 400),
(1001, 3, 'CDMX', 545),
(1001, 4, 'CDMX', 321),
(2002, 5, 'MTY', 324),
(3003, 6, 'JAL', 931),
(4004, 7, 'JAL', 876),
(5005, 8, 'CDMX', 567);


SELECT * FROM Brandon.Ordenes
WHERE Estado_Destino = 'CDMX'
AND Id_cliente IN (
    -- Esta parte busca qué clientes tienen al menos un pedido en JAL
    SELECT Id_cliente 
    FROM Brandon.Ordenes 
    WHERE Estado_Destino = 'JAL'
);