CREATE TABLE Marcadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    JugadorA INT,
    JugadorB INT,
    Marcador INT
);

INSERT INTO Marcadores (JugadorA, JugadorB, Marcador) VALUES
(1001, 2002, 150),
(3003, 4004, 15),
(4004, 3003, 125);

SELECT 
    LEAST(JugadorA, JugadorB) AS Jugador_A,
    GREATEST(JugadorA, JugadorB) AS Jugador_B,
    SUM(Marcador) AS Marcador_Total
FROM Marcadores
GROUP BY Jugador_A, Jugador_B;