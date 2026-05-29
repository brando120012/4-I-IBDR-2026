DROP TABLE IF EXISTS Brandon.Ventas_Mensuales;

CREATE TABLE Brandon.Ventas_Mensuales (
    Id_orden INT PRIMARY KEY, 
    Id_cliente INT NOT NULL,
    Fecha DATE NOT NULL,      
    Total DECIMAL(10, 2) NOT NULL, 
    Estado VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.Ventas_Mensuales (Id_orden, Id_cliente, Fecha, Total, Estado)
VALUES 
(1, 1001, '2025-01-01', 100.00, 'JAL'),
(2, 1001, '2025-01-01', 150.00, 'JAL'),
(3, 1001, '2025-01-01', 75.00,  'JAL'),
(4, 1001, '2025-02-01', 100.00, 'JAL'),
(5, 1001, '2025-03-01', 100.00, 'JAL'),
(6, 2002, '2025-02-01', 75.00,  'JAL'),
(7, 2002, '2025-02-01', 150.00, 'JAL'),
(8, 3003, '2025-01-01', 100.00, 'CDMX'),
(9, 3003, '2025-02-01', 100.00, 'CDMX'),
(10, 3003, '2025-03-01', 100.00, 'CDMX'),
(11, 4004, '2025-04-01', 100.00, 'CDMX'),
(12, 4004, '2025-05-01', 50.00,  'CDMX'),
(13, 4004, '2025-05-01', 100.00, 'CDMX');

SELECT Estado
FROM (
  SELECT Estado,
         DATE_FORMAT(Fecha, '%Y-%m') AS mes,
         AVG(Total) AS promedio_mes
  FROM Brandon.Ventas_Mensuales
  GROUP BY Estado, mes
) AS sub
GROUP BY Estado
HAVING MIN(promedio_mes) >= 100;


