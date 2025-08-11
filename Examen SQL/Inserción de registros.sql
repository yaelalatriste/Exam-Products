USE Personal;

INSERT INTO Personal.Area (Descripcion) 
	VALUES ('TELEFONIA'), ('IMPLEMENTACION'), ('CAPACITACION'), ('CALIDAD'), ('DESARROLLO');

INSERT INTO Personal.Zona (Descripcion) 
	VALUES ('DEL VALLE'), ('NARVARTE'), ('RELOX'), ('TORRES');
    
INSERT INTO Personal.Puesto (Descripcion) 
	VALUES ('COORDINADOR'), ('EMPLEADO');

INSERT INTO Personal.Alumnos (Nombre, Login, Area, Zona, Puesto) 
	VALUES ('EDGAR',5654,1,1,1), 
		   ('CESAR',5652,1,1,2),
           ('URIEL',5650,1,2,2),
           ('ISRAEL',5648,1,3,2),
           ('JOSUE',5646,3,1,1),
           ('FELIPE',5644,3,4,2),
           ('GUILLERMO',5642,2,2,1),
           ('ALI',5640,2,3,2),
           ('MAURO',5638,4,1,1),
           ('MIRIAM',5636,4,4,2),
           ('RICARDO',5634,5,2,2),
           ('LUIS',5632,5,2,1),
           ('JOSE',5630,5,3,2);