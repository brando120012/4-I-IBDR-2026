
DROP TABLE IF EXISTS Brandon.SegdelInventario;

CREATE TABLE Brandon.SegdelInventario (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY,
    Etapa INT NOT NULL, 
    Finalizado VARCHAR(20) NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.SegdelInventario (Etapa, Finalizado)
VALUES 
( 100, '03/01/2025'),
( 75, '04/01/2025'),
( -150, '05/01/2025'),
( 50, '06/01/2025'),
( -70, '07/01/2025');

SELECT 
    Finalizado AS Fecha,
    Etapa AS Ajuste,
    SUM(Etapa) OVER (ORDER BY STR_TO_DATE(Finalizado, '%d/%m/%Y')) AS Inventario
FROM Brandon.SegdelInventario
ORDER BY STR_TO_DATE(Finalizado, '%d/%m/%Y');