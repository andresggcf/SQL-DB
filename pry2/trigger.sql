/* Definición de Triggers */


CREATE OR REPLACE FUNCTION Inicio_Jornada() RETURNS TRIGGER AS $Inicio_Jornada$
	DECLARE
	BEGIN

		UPDATE EMPLEADOS SET ESTADO = 'OCUPADO' WHERE ESTADO = 'ACTIVO';

		RETURN NULL;
	END;
$Inicio_Jornada$ LANGUAGE PLPGSQL;

CREATE TRIGGER Inicio_Jornada AFTER INSERT OR UPDATE OR DELETE ON MCORRECTIVOS FOR EACH ROW
	EXECUTE PROCEDURE Inicio_Jornada();

CREATE TRIGGER Inicio_Jornada AFTER INSERT OR UPDATE OR DELETE ON MPREVENTIVOS FOR EACH ROW
	EXECUTE PROCEDURE Inicio_Jornada();


CREATE OR REPLACE FUNCTION pedidos() 

RETURNS trigger AS $pedidos$
BEGIN
IF (TG_OP = 'INSERT') THEN
	UPDATE BOD_PRO SET bod_pro.cantidad = bod_pro.cantidad - NEW.cantidad WHERE BOD_PRO.COD_PRO = NEW.COD_PRO;
END IF;
END;
$pedidos$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS pedidos ON solicitudes;

CREATE TRIGGER pedidos BEFORE INSERT 
ON solicitudes FOR EACH ROW EXECUTE PROCEDURE pedidos();

INSERT INTO COMPRALIBROS VALUES (32443,38,1,324566,'2011-11-24');

CREATE OR REPLACE FUNCTION punto1 (integer,integer)
	RETURNS VOID AS'
	DECLARE
		Id1 ALIAS FOR $1;
		Id2 ALIAS FOR $2;
		precioid1 NUMERIC (12,2);
		precioid2 NUMERIC (12,2);
	BEGIN
		SELECT INTO precioid1 PRICE FROM PRODUCT WHERE Id1 = 			PROD_ID;
		SELECT INTO precioid2 PRICE FROM PRODUCT WHERE Id2 =
		PROD_ID;
		UPDATE PRODUCT SET PRICE = precioid2 WHERE Id1 = 			PROD_ID;  	
		UPDATE PRODUCT SET PRICE = precioid1 WHERE Id2 = 			PROD_ID; 					  
		SELECT INTO precioid1 PRICE FROM PRODUCT WHERE 			PROD_ID = Id1;
		SELECT INTO precioid2 PRICE FROM PRODUCT WHERE    			PROD_ID = Id2; 
	END' LANGUAGE 'plpgsql' ;

CREATE OR REPLACE FUNCTION punto2 ()
	RETURNS VARCHAR(40) AS' 
	DECLARE 
		ARREGLO VARCHAR(40)[];
		C INTEGER := 0;
	BEGIN
	FOR SELECT CATEGORYNAME FROM CATEGORY LOOP
		ARREGLO[C] = CATEGORYNAME[C];
		C = C + 1;
	END LOOP;
	END' LANGUAGE 'plpgsql' ;


CREATE OR REPLACE FUNCTION puntolab41 (INTEGER,INTEGER)
RETURNS VOID AS $$
BEGIN
DROP TABLE IF EXISTS productos1;
CREATE TEMPORARY TABLE productos1 AS
SELECT product.prod_id, product.title 
FROM PRODUCT JOIN ORDERLINE 
ON (product.prod_id = orderline.orderid) 
JOIN CUST_ORDER 
ON (ORDERLINE.orderid = CUST_ORDER.ORDERID) 
WHERE EXTRACT (YEAR FROM CUST_ORDER.ORDERDATE) = $1
AND EXTRACT (MONTH FROM CUST_ORDER.ORDERDATE) = $2;
RETURN;
END; $$ LANGUAGE 'plpgsql';

--punto 2

create or replace function puntolab42 (integer, integer)
returns void as $$
begin
drop table if exists clientes1;
create temporary table clientes1 as
select customer.customerid,count (cust_order.customerid) as numcompras, min(orderline.quantity) as minimo,
max(orderline.quantity) as maximo
from orderline join cust_order on
(orderline.orderid = cust_order.orderid) 
join customer on (cust_order.customerid = customer.customerid) 
where customer.customerid > $1
and customer.customerid < $2
group by customer.customerid order by customer.customerid asc;
return;
end; $$ language 'plpgsql';

Para planear las  renovaciones de suscripciones de los meses siguientes, se  requiere una  función 
que, dado un mes y año, retorne los datos de las suscripciones a revistas y bases de datos que se 
vencen en ese mes. Los datos que se requieren son fecha en que se vence la suscripción, nombre 
(o título) de la revista o base de datos, y datos del proveedor.