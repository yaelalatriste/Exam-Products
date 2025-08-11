DROP PROCEDURE IF EXISTS PeopleAssigment;

DELIMITER //
CREATE PROCEDURE PeopleAssigment()
BEGIN
  DECLARE cols TEXT DEFAULT '';

  -- Construir lista de columnas dinámicas: `, SUM(CASE WHEN ar.Descripcion = 'X' THEN 1 ELSE 0 END) AS `X`
  SELECT GROUP_CONCAT(
           CONCAT(
             'SUM(CASE WHEN ar.Descripcion = ',
             QUOTE(Descripcion),
             ' THEN 1 ELSE 0 END) AS `', Descripcion, '`'
           ) SEPARATOR ', '
         ) INTO cols
  FROM Area;

  SET @sql = CONCAT('SELECT ''GENTE ASIGNADA'' AS titulo, ', cols, ' FROM Alumnos al JOIN Area ar ON al.Area = ar.IdArea;');

  PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL PeopleAssigment();