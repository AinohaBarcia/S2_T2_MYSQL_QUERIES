use universidad;
-- primer bloque consultas
select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1, apellido2, nombre;
select nombre, apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null;
select apellido1, apellido2, nombre from persona where tipo = alumno and year (fecha_nacimiento) = 1999;
select * from persona where tipo = 'profesor' and telefono is null and nif like '%k';
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
select p.apellido1, p.apellido2, p.nombre,d.nombre as 'nombre departamente' from profesor pr join persona p on pr.id_profesor = p.id join departamento d on pr.id_departamento = d.id order by p.apellido1, p.apellido2,p.nombre;
select a.nombre as nom_assignatura, ce.anyo_inicio, ce.anyo_fin from alumno_se_matricula_asignatura ama join asignatura a on ama.id_asignatura = a.id join curso_escolar ce on ama.id_curso_escolar = ce.id join persona p on ama.id_alumno = p.id where p.nif = '26902806M';
select d.nombre from profesor p join asignatura a on p.id_profesor = a.id_profesor join grado g on a.id_grado = g.id join departamento d on p.id_departamento = d.id  where g.nombre = 'Grau en Enginyeria Informàtica (Pla 2015)';
select distinct p.nombre, p.apellido1, p.apellido2 from persona p join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno join curso_escolar ce ON ama.id_curso_escolar = ce.id where ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;
-- consultas Left Join
select d.nombre as 'Nombre Departamento', p.apellido1,p.apellido2,p.nombre from persona p left join profesor pr on p.id = pr.id_profesor left join departamento d on d.id = pr.id_departamento where p.tipo = 'profesor' order by d.nombre,p.apellido1,p.apellido2,p.nombre asc;
select p.nombre,p.apellido1,p.apellido2 from persona p left join profesor pr on p.id = pr.id_profesor where p.tipo = 'profesor' and pr.id_departamento is null;
select d.nombre from departamento d left join profesor pr on d.id = pr.id_profesor where pr.id_profesor  is null;
select p.nombre,p.apellido1,p.apellido2 from persona p left join asignatura a on p.id = a.id_profesor where a.id_profesor is null; 
select a.nombre from asignatura a left join profesor p on a.id_profesor = p.id_profesor where p.id_profesor is null;
select d.nombre from departamento d left join profesor p on d.id = p.id_departamento left join asignatura a on p.id_profesor = a.id_profesor where a.curso is null; 
-- consultes resum
select count(*) as 'Total alumnos' from persona where tipo ='alumno';
select count(*) as 'Total alumnos' from persona where tipo ='alumno' and year (fecha_nacimiento) = 1999;
select d.nombre as 'Nombre departamento', count(p.id_profesor) as 'Total profesores' from departamento d join profesor p on d.id = p.id_departamento group by d.nombre order by count(p.id_profesor)desc;
select d.nombre as 'Nombre departamento',count(p.id_profesor) as 'Total profesores' from departamento d left join profesor p on d.id = p.id_departamento group by d.nombre order by count(p.id_profesor)desc;
select g.nombre as 'Nombre grado',count(a.id) as 'Total asignaturas' from grado g left join asignatura a on g.id = a.id group by g.nombre order by count(a.id)desc;
select g.nombre as 'Nombre grado',count(a.id) as 'Total asignaturas' from grado g join asignatura a on g.id = a.id group by g.nombre having 'Total asignaturas'>40;
select g.nombre as 'Nombre grado',a.tipo as 'Tipo asignatura',count(a.creditos) as 'Total creditos' from grado g join asignatura a on g.id = a.id group by g.nombre, a.tipo; 
select p.id, p.nombre as'Nombre profesor',p.apellido1 as 'Primer apellido',p.apellido2 as'Segundo apellido', count(a.id) as 'Total asignaturas' from persona p left join asignatura a on p.id = a.id_profesor where p.tipo = 'profesor' group by p.id,p.nombre,p.apellido1,p.apellido2 order by count(a.id) desc; 
select p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) 'Total asignaturas' from persona p left join profesor pr on p.id = pr.id_profesor left join asignatura a on pr.id_profesor = a.id_profesor where p.tipo = 'profesor' group by p.id, p.nombre, p.apellido1, p.apellido2 order by 'Total asignaturas' desc;
select * from persona where tipo = 'alumno' order by fecha_nacimiento desc limit 1;
select p.id, p.nombre,p.apellido1,p.apellido2 from persona p left join profesor pr on p.id=pr.id_profesor left join asignatura a on pr.id_profesor = a.id_profesor where pr.id_departamento is not null and a.id is null and p.tipo = 'profesor';


