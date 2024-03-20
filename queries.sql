//tienda
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.18 AS precio_usd FROM producto;
SELECT nombre AS producto, precio AS euros, precio * 1.18 AS usd FROM producto;
SELECT UPPER(nombre) AS nombre, precio FROM producto;
SELECT LOWER(nombre) AS nombre, precio FROM producto;
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) AS iniciales_mayusculas FROM fabricante;
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;
SELECT nombre, FLOOR (precio) AS precio_truncado FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo AS codigo_producto, producto.nombre AS producto, producto.codigo_fabricante, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT producto.nombre AS producto, producto.precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';


//universidad
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo = 'alumno' ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.telefono IS NULL AND persona.tipo = 'alumno';
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE YEAR(persona.fecha_nacimiento) = 1999 AND persona.tipo = 'alumno';
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.telefono IS NULL AND persona.nif LIKE '%K';
SELECT asignatura.nombre FROM asignatura WHERE asignatura.cuatrimestre = 1 AND asignatura.curso = 3 AND asignatura.id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Nombre del Departamento' FROM profesor JOIN persona ON profesor.id_profesor = persona.id JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT asignatura.nombre AS 'Nombre asignatura', curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM alumno_se_matricula_asignatura JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;
SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre AS nombre_profesor FROM profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id WHERE profesor.id_departamento IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_profesor IS NULL;
SELECT persona.nombre AS nombre_profesor, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL;
SELECT COUNT(*) AS 'Numero total de alumnos existentes' FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS 'Alumnos nacidos en 1999' FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno';
SELECT departamento.nombre AS 'Nombre del departamento', COUNT(profesor.id_profesor) AS 'Numero de profesores' FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(profesor.id_profesor) DESC;
SELECT departamento.nombre AS 'Nombre del departamento', COUNT(profesor.id_profesor) AS 'Numero de profesores' FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY departamento.nombre;
SELECT grado.nombre AS 'Nombre del grado', COUNT(asignatura.id) AS 'Numero de asignaturas' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY COUNT(asignatura.id) DESC, grado.nombre;
SELECT grado.nombre AS 'Nombre del Grado', COUNT(asignatura.id) AS 'Número de Asignaturas' FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id HAVING COUNT(asignatura.id) > 40;
SELECT grado.nombre AS 'Nombre del Grado', asignatura.tipo AS 'Tipo de Asignatura', SUM(asignatura.creditos) AS 'Suma de Creditos' FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo ORDER BY grado.nombre, asignatura.tipo;
SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS 'Número de Alumnos Matriculados' FROM alumno_se_matricula_asignatura JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.anyo_inicio ORDER BY curso_escolar.anyo_inicio;
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS 'Numero de Asignaturas' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY COUNT(asignatura.id) DESC, persona.apellido1, persona.apellido2, persona.nombre;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT persona.nombre AS "Nombre del Profesor", persona.apellido1, persona.apellido2, departamento.nombre AS "Nombre del Departamento" FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;








