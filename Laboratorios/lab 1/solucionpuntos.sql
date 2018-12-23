--punto 4--

INSERT INTO DICTA 
VALUES (777,888,999,NULL,NULL);

-- ERROR:  null value in column "fechainicio" violates not-null constraint porque puse como condicion que no puede ser nulo--

--punto 5--

SELECT * FROM ESTUDIANTE;

-- punto 6 --

SELECT nombre_est, apellido FROM ESTUDIANTE;

-- punto 7 --

SELECT nombre_curso FROM CURSO 
WHERE nro_creditos > 2;

--punto 8--



--punto 10--

SELECT MAX (nro_creditos)FROM CURSO;

--punto 11--

SELECT AVG (cupo) FROM GRUPO;

--punto 12-- 

ALTER TABLE ESTUDIANTE 
ADD semestre INTEGER;

--punto 13--

ALTER TABLE DICTA 
RENAME fechafin TO fecha_final;

--punto 14--

ALTER TABLE DICTA 
ALTER COLUMN fechafin SET NOT NULL;

-- solo sale ALTER TABLE, pero ya los calores
-- no pueden ser nulos al insertar un nuevo 
-- profesor que dicta clases


--punto 15--

UPDATE CURSO SET nombre_curso = 'calculo_1' 
WHERE id_curso = 1234;

--punto 16--

UPDATE CURSO SET nro_creditos = 5;

--punto 17--

UPDATE CURSO SET id_curso = 3214 
WHERE id_curso = 2345;

--ERROR:  update o delete en «curso» 
--viola la llave foránea «grupo_idcurso_fkey» en la tabla «grupo»
--DETAIL:  La llave (id_curso)=(2345) 
--todavía es referida desde la tabla «grupo».
-- como es llave primaria y es referenciada en grupo
-- y matricula, no se puede modificar.

--punto 18--

DELETE FROM DICTA;

--punto 19--

DELETE FROM MATRICULA WHERE idest = 3333;

--punto 20--

DELETE FROM CURSO;

--sale el mismo error del punto 17--


