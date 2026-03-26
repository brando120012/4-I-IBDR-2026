DROP TABLE IF EXISTS muestra;

CREATE TABLE muestra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor INTEGER
);

INSERT INTO muestra (valor) VALUES (1), (1), (2), (3), (3), (4);

SELECT DISTINCT valor 
FROM muestra
ORDER BY valor;