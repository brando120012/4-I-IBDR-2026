CREATE TABLE Brandon.Requisitos (
    Descripcion VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Brandon.Candidatos (
    Id_candidato INT,
    Descripcion VARCHAR(50),
    PRIMARY KEY (Id_candidato, Descripcion) -- La combinación de ambos es la clave
);

-- Insertar los requisitos solicitados
INSERT INTO Requisitos (Descripcion) VALUES 
('Geólogo'), 
('Astrónomo'), 
('Técnico');

-- Insertar los datos de los candidatos
INSERT INTO Candidatos (Id_candidato, Descripcion) VALUES 
(1001, 'Geólogo'),
(1001, 'Astrónomo'),
(1001, 'Bioquímico'),
(1001, 'Técnico'),
(2002, 'Cirujano'),
(2002, 'Mecánico'),
(2002, 'Geólogo'),
(3003, 'Geólogo'),
(3003, 'Astrónomo'),
(4004, 'Ingeniero');


SELECT Id_candidato
FROM Brandon.Candidatos
WHERE Descripcion IN (SELECT Descripcion FROM Brandon.Requisitos)
GROUP BY Id_candidato
HAVING COUNT(DISTINCT Descripcion) = (SELECT COUNT(*) FROM Brandon.Requisitos);