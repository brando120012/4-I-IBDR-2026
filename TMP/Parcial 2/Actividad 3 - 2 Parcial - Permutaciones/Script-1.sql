
DROP TABLE IF EXISTS Brandon.Prodias;

CREATE TABLE Brandon.Prodias (
    id_etapa INT auto_increment PRIMARY KEY, 
    Desarrollo VARCHAR(50) NOT NULL,
    Finalizado VARCHAR(20) NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.Prodias (Desarrollo, Finalizado)
VALUES 
('RestAPI', '06/01/2024'),
('RestAPI', '06/14/2024'),
('RestAPI', '06/15/2024'),
('Web', '06/01/2024'),
('Web', '06/02/2024'),
('Web', '06/19/2024'),            
('App', '06/01/2024'),
('App', '05/15/2024'), 
('App', '06/30/2024');

WITH CalculoDias AS (
    SELECT 
        Desarrollo,
        STR_TO_DATE(Finalizado, '%m/%d/%Y') AS FechaActual,
        
        LAG(STR_TO_DATE(Finalizado, '%m/%d/%Y')) OVER (
            PARTITION BY Desarrollo 
            ORDER BY STR_TO_DATE(Finalizado, '%m/%d/%Y')
        ) AS FechaAnterior
    FROM Brandon.Prodias
)
SELECT 
    Desarrollo,
    AVG(DATEDIFF(FechaActual, FechaAnterior)) AS Promedio_Dias
FROM CalculoDias
WHERE FechaAnterior IS NOT NULL
GROUP BY Desarrollo;