CREATE TABLE Pedidos (
    Id_orden INT PRIMARY KEY,
    Id_cliente INT,
    Fecha VARCHAR(10),
    Cantidad VARCHAR(10),
    Estado VARCHAR(3)
);

INSERT INTO Pedidos (Id_orden, Id_cliente, Fecha, Cantidad, Estado) VALUES
(1, 1001, '01/01/2025', '$100', 'JAL'),
(2, 3003, '01/01/2025', '$100', 'COL'),
(3, 1001, '03/01/2025', '$100', 'JAL'),
(4, 2002, '02/01/2025', '$150', 'JAL'),
(5, 1001, '02/01/2025', '$100', 'JAL'),
(6, 4004, '05/01/2025', '$50', 'COL'),
(7, 1001, '01/01/2025', '$150', 'JAL'),
(8, 3003, '03/01/2025', '$100', 'COL'),
(9, 4004, '04/01/2025', '$100', 'COL'),
(10, 1001, '01/01/2025', '$75', 'JAL'),
(11, 2002, '02/01/2025', '$75', 'JAL'),
(12, 3003, '02/01/2025', '$100', 'COL'),
(13, 4004, '05/01/2025', '$100', 'COL');

SELECT * FROM Pedidos
ORDER BY Id_orden ASC
LIMIT 6 OFFSET 4;