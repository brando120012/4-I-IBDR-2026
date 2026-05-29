DROP TABLE IF EXISTS Brandon.TAA;

CREATE TABLE Brandon.TAA (
    id_registro INT AUTO_INCREMENT PRIMARY KEY, 
    Customer_ID INT NOT NULL,
    Type_Phone VARCHAR(50) NOT NULL,
    Number VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.TAA (id_registro, Customer_ID, Type_Phone, Number)
VALUES 
(NULL, 1001, 'Celular', '333-897-5421'),
(NULL, 1001, 'Trabajo', '333-897-6542'),
(NULL, 1001, 'Casa', '333-698-9874'),
(NULL, 2002, 'Celular', '333-963-6544'),
(NULL, 2002, 'Trabajo', '333-812-9856'),
(NULL, 3003, 'Celular', '333-987-6541');


SELECT 
    Customer_ID,
    MAX(CASE WHEN Type_Phone = 'Celular' THEN Number END) AS Celular,
    MAX(CASE WHEN Type_Phone = 'Trabajo' THEN Number END) AS Trabajo,
    MAX(CASE WHEN Type_Phone = 'Casa' THEN Number END) AS Casa
FROM Brandon.TAA
GROUP BY Customer_ID;