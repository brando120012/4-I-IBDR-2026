DROP TABLE IF EXISTS Brandon.PD;

CREATE TABLE Brandon.PD (
    id_registro INT AUTO_INCREMENT PRIMARY KEY, 
    Customer_ID INT NOT NULL,
    Fecha VARCHAR(50) NOT NULL,
    Precio VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.PD (id_registro, Customer_ID, Fecha, Precio)
VALUES 
(NULL, 1001, '01/01/2025', '19.99'),
(NULL, 1001, '04/15/2025', '59.99'),
(NULL, 1001, '06/08/2025', '79.99'),
(NULL, 2002, '04/17/2025', '39.99'),
(NULL, 2002, '05/19/2025', '59.99');

SELECT Customer_ID, Fecha, Precio
FROM Brandon.PD
WHERE (Customer_ID, Fecha) IN (
    SELECT Customer_ID, MAX(Fecha)
    FROM Brandon.PD
    GROUP BY Customer_ID
);