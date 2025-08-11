-- Derivado que no se me especifico si el tipo de dato del parámetro es entero
-- ó es cadena, realice 2 SP uno por cadena y uno por entero

# Cadena

-- Verificamos que no exista
DROP PROCEDURE IF EXISTS SP_VPersonsByZone;

-- Desarrollo del Procedimiento
CREATE PROCEDURE SP_VPersonsByZone(IN IDZONA VARCHAR(100))
	SELECT al.Nombre, al.Login, a.Descripcion AS Area, z.Descripcion AS Zona, p.Descripcion AS Puesto
	  FROM Alumnos al
	  LEFT JOIN Zona z ON al.Zona = z.IdZona
	  LEFT JOIN Puesto p ON al.Puesto = p.IdPuesto
	  LEFT JOIN Area a ON al.Puesto = a.IdArea
	 WHERE z.Descripcion LIKE CONCAT('%',IDZONA,'%') 
	 ORDER BY Login DESC;

-- Llamada a Procedure
CALL SP_VPersonsByZone('nar');

# Entero
-- Verificamos que no exista
DROP PROCEDURE IF EXISTS SP_IPersonsByZone;

-- Desarrollo del Procedimiento
CREATE PROCEDURE SP_IPersonsByZone(IN IDZONA INT)
	SELECT z.IdZona, al.Nombre, al.Login, a.Descripcion AS Area, z.Descripcion AS Zona, p.Descripcion AS Puesto
	  FROM Alumnos al
	  LEFT JOIN Zona z ON al.Zona = z.IdZona
	  LEFT JOIN Puesto p ON al.Puesto = p.IdPuesto
	  LEFT JOIN Area a ON al.Puesto = a.IdArea
	 WHERE z.IdZona = IDZONA
	 ORDER BY Login DESC;

-- Llamada a Procedure
CALL SP_IPersonsByZone(2)