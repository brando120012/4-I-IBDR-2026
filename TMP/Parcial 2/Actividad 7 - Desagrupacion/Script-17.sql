CREATE TABLE Periodos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Inicio DATE,
    Final DATE
);

INSERT INTO Periodos (Inicio, Final) VALUES
('2025-01-01', '2025-01-05'),
('2025-01-03', '2025-01-09'),
('2025-01-10', '2025-01-11'),
('2025-01-12', '2025-01-16'),
('2025-01-15', '2025-01-19');

WITH MarcarInicios AS (
    SELECT 
        Inicio, 
        Final,
        MAX(Final) OVER (
            ORDER BY Inicio, Final 
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ) as max_final_previo
    FROM Periodos
),
IdentificarGrupos AS (
    SELECT 
        Inicio, 
        Final,
        CASE WHEN Inicio <= max_final_previo THEN 0 ELSE 1 END as es_nuevo_grupo
    FROM MarcarInicios
),
AsignarID AS (
    SELECT 
        Inicio, 
        Final,
        SUM(es_nuevo_grupo) OVER (ORDER BY Inicio, Final) as grupo_id
    FROM IdentificarGrupos
)
SELECT 
    DATE_FORMAT(MIN(Inicio), '%m/%d/%Y') as Inicio, 
    DATE_FORMAT(MAX(Final), '%m/%d/%Y') as Final
FROM AsignarID
GROUP BY grupo_id
ORDER BY MIN(Inicio);