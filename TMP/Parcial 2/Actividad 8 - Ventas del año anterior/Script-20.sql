CREATE TABLE EjercicioSQL (
    Fila INT PRIMARY KEY,
    Aplicacion VARCHAR(50),
    Estado VARCHAR(50)
);

INSERT INTO EjercicioSQL (Fila, Aplicacion, Estado) VALUES
(1, 'Web', 'Aprobado'),
(2, NULL, 'Fallo'),
(3, NULL, 'Fallo'),
(4, NULL, 'Fallo'),
(5, 'App', 'Aprobado'),
(6, NULL, 'Fallo'),
(7, NULL, 'Fallo'),
(8, NULL, 'Aprobado'),
(9, NULL, 'Aprobado'),
(10, 'RESTAPI', 'Fallo'),
(11, NULL, 'Fallo'),
(12, NULL, 'Fallo');

SELECT * FROM EjercicioSQL ORDER BY Fila;