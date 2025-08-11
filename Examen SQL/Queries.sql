USE Personal;

-- 3.1 Mostrar a todos los coordinadores
	SELECT * FROM Alumnos 
	WHERE Puesto = (SELECT IdPuesto FROM Puesto WHERE Descripcion = 'COORDINADOR');

-- 3.2 Mostrar a todas las personas que laboren en la zona del valle
SELECT z.Descripcion, a.Nombre 
  FROM Alumnos a 
  LEFT JOIN Zona z ON a.Zona = z.IdZona
 WHERE z.Descripcion = 'Del Valle';
 
-- 3.3 Mostrar a todas las personas que laboren en la zona narvarte
SELECT z.Descripcion, a.Nombre 
  FROM Alumnos a 
  LEFT JOIN Zona z ON a.Zona = z.IdZona
 WHERE z.Descripcion = 'Narvarte';
 
-- 3.4 Agrupar todas las personas por área
SELECT z.Descripcion, COUNT(*) AS TotalPersonas
  FROM Alumnos a 
  LEFT JOIN Zona z ON a.Zona = z.IdZona
 GROUP BY z.Descripcion;

-- 3.5 Con un cruce obtener el siguiente resultado
SELECT al.Nombre, al.Login, a.Descripcion AS Area, z.Descripcion AS Zona, p.Descripcion AS Puesto
  FROM Alumnos al
  LEFT JOIN Zona z ON al.Zona = z.IdZona
  LEFT JOIN Puesto p ON al.Puesto = p.IdPuesto
  LEFT JOIN Area a ON al.Puesto = a.IdArea
  ORDER BY Login DESC;
