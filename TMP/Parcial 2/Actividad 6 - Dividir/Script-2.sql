CREATE TABLE Divialamitad (
    id_jugador INT PRIMARY KEY,
    Marcador INT
);


INSERT INTO Divialamitad (id_jugador, Marcador) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);


SELECT 
    NTILE(2) OVER (ORDER BY Marcador DESC) AS Categoria,
    id_jugador,
    Marcador
FROM 
    Divialamitad
ORDER BY 
    Categoria ASC, 
    Marcador DESC;