CREATE TABLE Brandon.a (
	id INT auto_increment NOT NULL,
	pilotos varchar(100) NOT NULL,
	CONSTRAINT a_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE Brandon.b (
	id INT auto_increment NOT NULL,
	pilotos varchar(100) NOT NULL,
	CONSTRAINT b_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO Brandon.a
(id, pilotos)
VALUES(1, 'S.Perez'),
(2, 'M.Botas'),
(3, 'M.Vestappen'),
(4, 'I.Hadier'),
(6, 'L..Leelerek'),
(7, 'L.Humilton'),
(8, 'L.Norris');

INSERT INTO Brandon.b
(id, pilotos)
VALUES(1, 'G.Russell'),
(2, 'K.Antonelli'),
(3, 'S.Perez'),
(4, 'F.Alonso'),
(5, 'M.Vestappen'),
(6, 'L.Lawson'),
(7, 'L.Humilton');

SELECT * FROM Brandon.a A
Left join Brandon.b B
On A.pilotos  = B.pilotos;

SELECT * FROM Brandon.b B
Right join Brandon.a A
On A.pilotos = B.pilotos;

SELECT * FROM Brandon.a A
Left join Brandon.b B
On A.pilotos  = B.pilotos
UNION ALL
SELECT * FROM Brandon.b B
Right join Brandon.a A
On A.pilotos = B.pilotos;


SELECT * FROM Brandon.a A
Left OUTER JOIN Brandon.b B
On A.pilotos  = B.pilotos
Where B.pilotos is NULL; 

SELECT * FROM Brandon.a A
Right OUTER join Brandon.b B
On A.pilotos = B.pilotos
Where A.pilotos  is NULL;


SELECT * FROM Brandon.a A
Left OUTER JOIN Brandon.b B
On A.pilotos  = B.pilotos
Where B.pilotos is NULL 
UNION ALL
SELECT * FROM Brandon.a A
Right OUTER join Brandon.b B
On A.pilotos = B.pilotos
Where A.pilotos  is NULL;


SELECT * FROM Brandon.a A
INNER JOIN Brandon.b B
ON A.pilotos = B.pilotos;

