/*
DROP DATABASE rest_colegio_api;
INSERT INTO usuarios
	(nombres, apellidos, email, contrasena, telefono, estado)  values("Enmanuel Benjamín", "Carrillo Apaza", "macebv22@gmail.com", "$2a$10$ss0y5gsjGyeYc43rOvdK7ePAatsaV1FufppzKLzKUbX4Cpcbl4k.K", 923362912, "INACTIVE"),
	("Javier", "IDAT", "ejemplo@idat.edu.pe", "$2a$10$aXwomuQLgH5ylyCPldz.aOWy2I5Uv85EpArb7lXUCWZnP.5uYAd2.", 123456, "INACTIVE");

INSERT INTO roles values(default, "ADMIN"), (default, "DOC"), (default, "APOD");

INSERT INTO usuarios_roles values(1, 1), (2, 3);

INSERT INTO apoderados (nombres, apellidos, correo, direccion, telefono, usuario_id) values
("Javier", "IDAT", "ejemplo@idat.edu.pe", "Avenida", 123456, 2);
*/
USE rest_colegio_api;
select * from usuarios;
select * from apoderados;
select * from asistencias;
select * from calificaciones;
select * from cursos;
select * from docentes;
select * from estudiantes;
select * from usuarios_roles;