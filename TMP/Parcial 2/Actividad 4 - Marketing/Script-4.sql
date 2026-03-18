DROP TABLE IF EXISTS Brandon.Ocurrencias;

CREATE TABLE Brandon.Ocurrencias (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Proceso VARCHAR(50) NOT NULL,
    Mensaje VARCHAR(255) NOT NULL,
    Ocurrencia INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Brandon.Ocurrencias (Proceso, Mensaje, Ocurrencia) VALUES
('Web',     'Error: No se puede dividir por 0', 3),
('RestAPI', 'Error: Fallo la conversión',       5),
('App',     'Error: Fallo la conversión',       7),
('RestAPI', 'Error: Error sin identificar',     9),
('Web',     'Error: Error sin identificar',     1),
('App',     'Error: Error sin identificar',    10),
('Web',     'Estado Completado',                8),
('RestAPI', 'Estado Completado',                6);

SELECT o.Mensaje, o.Proceso, o.Ocurrencia
FROM Brandon.Ocurrencias o
JOIN (
    SELECT Mensaje, MAX(Ocurrencia) AS max_ocurr
    FROM Brandon.Ocurrencias
    GROUP BY Mensaje
) m ON o.Mensaje = m.Mensaje AND o.Ocurrencia = m.max_ocurr
ORDER BY o.Mensaje;
