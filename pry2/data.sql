﻿-- Script para inserción de datos básicos
-- MANTENIMIENTO

INSERT INTO DEPARTAMENTOS (COD, NOMBRE, ACTIVIDAD) VALUES ('1', 'D1', 'N1');
INSERT INTO DEPARTAMENTOS (COD, NOMBRE, ACTIVIDAD) VALUES ('2', 'D2', 'N2');
INSERT INTO DEPARTAMENTOS (COD, NOMBRE, ACTIVIDAD) VALUES ('3', 'D3', 'N3');
INSERT INTO EQUIPOS (COD, TIPO, ESTADO, COD_DEP) VALUES ('1', 'T1', 'BUENO', '1');
INSERT INTO EQUIPOS (COD, TIPO, ESTADO, COD_DEP) VALUES ('2', 'T2', 'BUENO', '1');
INSERT INTO EQUIPOS (COD, TIPO, ESTADO, COD_DEP) VALUES ('3', 'T3', 'MALO', '2');
INSERT INTO EQUIPOS (COD, TIPO, ESTADO, COD_DEP) VALUES ('4', 'T4', 'BUENO', '2');
INSERT INTO EQUIPOS (COD, TIPO, ESTADO, COD_DEP) VALUES ('5', 'T5', 'BUENO', '3');
INSERT INTO PARTES (COD, NOMBRE, ESTADO, COD_EQU) VALUES ('1', 'P1', 'BUENO', '1');
INSERT INTO PARTES (COD, NOMBRE, ESTADO, COD_EQU) VALUES ('2', 'P2', 'BUENO', '2');
INSERT INTO PARTES (COD, NOMBRE, ESTADO, COD_EQU) VALUES ('3', 'P3', 'BUENO', '3');
INSERT INTO VCONTROL (COD, TIPO) VALUES ('1', 'PRESION');
INSERT INTO VCONTROL (COD, TIPO) VALUES ('2', 'TEMPERATURA');
INSERT INTO VCONTROL (COD, TIPO) VALUES ('3', 'DENSIDAD');
INSERT INTO EMPLEADOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('1', 'P1', 'ACTIVO', 'MANHANA', '1');
INSERT INTO EMPLEADOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('2', 'P2', 'INACTIVO', 'TARDE', '1');
INSERT INTO EMPLEADOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('3', 'P3', 'INACTIVO', 'NOCHE', '1');
INSERT INTO EMPLEADOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('4', 'P4', 'OCUPADO', 'MANHANA', '1');
INSERT INTO JMANTENIMIENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('1', 'P5', 'ACTIVO', 'MANHANA', '1');
INSERT INTO JMANTENIMIENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('2', 'P6', 'INACTIVO', 'TARDE', '1');
INSERT INTO JMANTENIMIENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('3', 'P7', 'INACTIVO', 'NOCHE', '1');
INSERT INTO JDEPARTAMENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('1', 'P8', 'ACTIVO', 'MANHANA', '1');
INSERT INTO JDEPARTAMENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('2', 'P9', 'INACTIVO', 'TARDE', '1');
INSERT INTO JDEPARTAMENTOS (COD, NOMBRE, ESTADO, JORNADA, COD_DEP) VALUES ('3', 'P10', 'INACTIVO', 'NOCHE', '1');
INSERT INTO EBODEGAS (COD, NOMBRE, ESTADO, JORNADA) VALUES ('1', 'P11', 'ACTIVO', 'MANHANA');
INSERT INTO EBODEGAS (COD, NOMBRE, ESTADO, JORNADA) VALUES ('2', 'P12', 'INACTIVO', 'TARDE');
INSERT INTO EBODEGAS (COD, NOMBRE, ESTADO, JORNADA) VALUES ('3', 'P13', 'INACTIVO', 'NOCHE');
INSERT INTO ACCORRECTIVAS (COD, TIEMPO, COD_JMA) VALUES ('1', '11:59:00', '1');
INSERT INTO PERIODICIDADES (COD, TIEMPO) VALUES ('1', '11:50:00');
INSERT INTO MPREVENTIVOS (ID, ESTADO, TIPO, COD_EQU, COD_PER) VALUES ('1', 'EN PROCESO', 'CHEQUEO', '1', '1');
INSERT INTO MCORRECTIVOS (ID, ESTADO, TIPO, COD_EQU, COD_ACC) VALUES ('1', 'TERMINADO', 'MANTENIMIENTO', '2', '1');
INSERT INTO OTRABAJOS (COD, HORA, ESTADO, ID_MPR) VALUES ('1', '11:50:00', 'EN PROCESO', '1');
INSERT INTO VAR_PAR (MEDIDA, COD_OTR, COD_VCO, COD_PAR, COD_EMP) VALUES ('300 PSI', '1', '1', '1', '1');
INSERT INTO PRODUCTOS (COD, NOMBRE) VALUES ('1', 'PVC');
INSERT INTO PRODUCTOS (COD, NOMBRE) VALUES ('2', 'MILKIE');
INSERT INTO PRODUCTOS (COD, NOMBRE) VALUES ('3', 'TAMPONES');
INSERT INTO BODEGAS (COD) VALUES ('1');
INSERT INTO SOLICITUDES (COD, ESTADO, CANTIDAD, COD_OTR, COD_JMA, COD_PRO) VALUES ('1', 'COMPLETA', '10', '1', '1', '3');
INSERT INTO BOD_PRO (COD_BOD, COD_PRO, CANTIDAD) VALUES ('1', '1', '1000');
INSERT INTO NOTIFICACIONES (COD, DESCRIPCION, COD_PRO, COD_EMP, COD_JMA, COD_OTR) VALUES ('1', 'MANTENIMIENTO EN PROCESO', '3', '1', '1', '1');
INSERT INTO PROVEEDORES (ID, NOMBRE) VALUES ('1', 'PINGOCHO');
INSERT INTO COMPRAS (COD, FECHA, COD_EBO, ID_PRV) VALUES ('1', NOW(), '1', '1');
INSERT INTO COM_PRO (COD_COM, COD_PRO, CANTIDAD) VALUES ('1', '1', '50000');