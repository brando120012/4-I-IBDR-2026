CREATE TABLE Brandon.SupermecardoA (
    articulosA varchar(50) NOT NULL,
    CONSTRAINT a_pk PRIMARY KEY (articulosA) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Brandon.SupermecardoB (
    articulosB varchar(50) NOT NULL,
    CONSTRAINT b_pk PRIMARY KEY (articulosB) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data Insertions
INSERT INTO Brandon.SupermecardoA (articulosA)
VALUES ('azucar'), ('pan'), ('jugo'), ('refresco'), ('harina');

INSERT INTO Brandon.SupermecardoB (articulosB)
VALUES ('azucar'), ('pan'), ('mantequilla'), ('queso'), ('manzana');


SELECT * FROM Brandon.SupermecardoA  A
Left join Brandon.SupermecardoB B
On A.articulosA  = B.articulosB;

SELECT * FROM Brandon.SupermecardoB B
Right join Brandon.SupermecardoA A
On A.articulosA = B.articulosB;

SELECT * FROM Brandon.SupermecardoA A
Left join Brandon.SupermecardoB B
On A.articulosA  = B.articulosB
UNION ALL
SELECT * FROM Brandon.SupermecardoB B
Right join Brandon.SupermecardoA A
On A.articulosA = B.articulosB;


SELECT * FROM Brandon.SupermecardoA A
Left OUTER JOIN Brandon.SupermecardoB B
On A.articulosA  = B.articulosB
Where B.articulosB is NULL; 

SELECT * FROM Brandon.SupermecardoA A
Right OUTER join Brandon.SupermecardoB B
On A.articulosA = B.articulosB
Where A.articulosA  is NULL;


SELECT * FROM Brandon.SupermecardoA A
Left OUTER JOIN Brandon.SupermecardoB B
On A.articulosA  = B.articulosB
Where B.articulosB is NULL 
UNION ALL
SELECT * FROM Brandon.SupermecardoA A
Right OUTER join Brandon.SupermecardoB B
On A.articulosA = B.articulosB
Where A.articulosA  is NULL;


SELECT * FROM Brandon.SupermecardoA A
INNER JOIN Brandon.SupermecardoB B
ON A.articulosA = B.articulosB;
