-- Sólo para Linux
-- MANTENIMIENTO


-- Base de Datos: MANTENIMIENTO

-- Autores: SERGIO ANDRÉS SALAZAR BEDOYA & IVÁN FERNANDO RAMÍREZ

-- Fecha: NOVIEMBRE 16 DE 2012

--------------------
-- Creacion de tablas
--------------------
\echo "Creando tablas...."
\i itables.sql

--------------------
-- Restricciones
--------------------
\echo "Restricciones de Integridad...."
\i constraints.sql

--------------------
-- Datos Basicos
--------------------
\echo "Datos...."
\i data.sql
