-- Script de eliminación de tablas (uninstall)

\echo "Este script eliminara las tablas del sistema..."
\o contactos.log

DROP TABLE CONTACTOS CASCADE;

\o
