
DROP TABLE IF EXISTS Brandon.EDA;


CREATE TABLE Brandon.EDA (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY, 
    Desarrollo VARCHAR(50) NOT NULL,
    Etapa INT NOT NULL,
    Finalizado VARCHAR(20) NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO Brandon.EDA (Desarrollo, Etapa, Finalizado)
VALUES 
('RestAPI', 1, '01/02/2024'),
('RestAPI', 2, '30/05/2024'),
('RestAPI', 3, '29/06/2024'),
('Web', 1, '28/10/2024'),
('Web', 2, '20/11/2024'),
('Web', 3, NULL),            
('App', 1, '30/01/2025'),
('App', 2, NULL);           

SELECT DISTINCT Desarrollo
FROM Brandon.EDA
WHERE Finalizado IS NULL;