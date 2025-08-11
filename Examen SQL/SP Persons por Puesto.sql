-- Derivado que no se me especifico si el tipo de dato del parámetro es entero
-- ó es cadena, realice 2 SP uno por cadena y uno por entero

# Cadena

-- Verificamos que no exista
DROP PROCEDURE IF EXISTS SP_VPersonsByPosition;

-- Desarrollo del Procedimiento
CREATE PROCEDURE SP_VPersonsByPosition(IN PUESTO VARCHAR(100))
	SELECT al.Nombre, al.Login, a.Descripcion AS Area, z.Descripcion AS Zona, p.Descripcion AS Puesto
	  FROM Alumnos al
	  LEFT JOIN Zona z ON al.Zona = z.IdZona
	  LEFT JOIN Puesto p ON al.Puesto = p.IdPuesto
	  LEFT JOIN Area a ON al.Puesto = a.IdArea
	 WHERE p.Descripcion LIKE CONCAT('%',PUESTO,'%') 
	 ORDER BY Login DESC;

-- Llamada a Procedure
CALL SP_VPersonsByPosition('coo');

# Entero
-- Verificamos que no exista
DROP PROCEDURE IF EXISTS SP_IPersonsByPosition;

-- Desarrollo del Procedimiento
CREATE PROCEDURE SP_IPersonsByPosition(IN PUESTO INT)
	SELECT z.IdZona, al.Nombre, al.Login, a.Descripcion AS Area, z.Descripcion AS Zona, p.Descripcion AS Puesto
	  FROM Alumnos al
	  LEFT JOIN Zona z ON al.Zona = z.IdZona
	  LEFT JOIN Puesto p ON al.Puesto = p.IdPuesto
	  LEFT JOIN Area a ON al.Puesto = a.IdArea
	 WHERE p.IdPuesto = PUESTO
	 ORDER BY Login DESC;

-- Llamada a Procedure
CALL SP_IPersonsByPosition(2)