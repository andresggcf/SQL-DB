EXPLAIN ANALYZE SELECT CUSTOMER.CUSTOMERID,FIRSTNAME,LASTNAME, MAX(PRICE) 
FROM CUSTOMER JOIN CUST_ORDER ON (CUSTOMER.CUSTOMERID = CUST_ORDER.CUSTOMERID)
JOIN ORDERLINE ON (CUST_ORDER.ORDERID = ORDERLINE.ORDERID)
JOIN PRODUCT ON (ORDERLINE.PROD_ID = PRODUCT.PROD_ID) GROUP BY CUSTOMER.CUSTOMERID 
ORDER BY MAX(PRICE) DESC, LASTNAME ASC;
/*
 Sort  (cost=4099.10..4124.10 rows=10000 width=29) (actual time=105.928..106.882
 rows=4063 loops=1)
   Sort Key: (max(product.price)), customer.lastname
   Sort Method: quicksort  Memory: 350kB
   ->  GroupAggregate  (cost=3222.47..3434.71 rows=10000 width=29) (actual time=
78.510..92.985 rows=4063 loops=1)
         ->  Sort  (cost=3222.47..3259.89 rows=14965 width=29) (actual time=78.4
96..84.036 rows=15090 loops=1)
               Sort Key: customer.customerid
               Sort Method: external merge  Disk: 576kB
               ->  Hash Join  (cost=1096.01..2184.70 rows=14965 width=29) (actua
l time=23.267..59.646 rows=15090 loops=1)
                     Hash Cond: (orderline.prod_id = product.prod_id)
                     ->  Hash Join  (cost=942.86..1750.96 rows=14965 width=26) (
actual time=19.441..44.562 rows=15090 loops=1)
                           Hash Cond: (orderline.orderid = cust_order.orderid)
*/

-------------------------PUNTO 2----------------------------------

EXPLAIN ANALYZE DELETE FROM CUSTOMER WHERE FIRSTNAME = 'JUHWSM' AND
LASTNAME = 'NDOHBDLYR';

/*
 Delete on customer  (cost=0.00..373.00 rows=1 width=6) (actual time=2.460..2.460 rows
=0 loops=1)
   ->  Seq Scan on customer  (cost=0.00..373.00 rows=1 width=6) (actual time=2.456..2.
456 rows=0 loops=1)
         Filter: (((firstname)::text = 'JUHWSM'::text) AND ((lastname)::text = 'NDOHBD
LYR'::text))
 Total runtime: 2.493 ms
(4 filas)

*/

--A) 2.493 MS
--B) 
CREATE INDEX PUNTO2 ON CUSTOMER (FIRSTNAME, LASTNAME);
--C)
EXPLAIN ANALYZE DELETE FROM CUSTOMER WHERE FIRSTNAME = 'GLZLWE' AND
LASTNAME = 'ERMFJHXHIT';

/*
 Delete on customer  (cost=0.00..8.27 rows=1 width=6) (actual time=0.082..0.082 rows=0
 loops=1)
   ->  Index Scan using punto2 on customer  (cost=0.00..8.27 rows=1 width=6) (actual t
ime=0.035..0.036 rows=1 loops=1)
         Index Cond: (((firstname)::text = 'GLZLWE'::text) AND ((lastname)::text = 'ER
MFJHXHIT'::text))
 Trigger for constraint cust_order_customerid_fkey: time=0.077 calls=1
 Total runtime: 0.191 ms
*/


--D) SIN INDICE: 2.493 ms... CON INDICE:0.191 ms

-----------------------------------------------PUNTO 3--------------------------------------------

EXPLAIN ANALYZE SELECT COUNTRY, STATE, CITY, CUSTOMERID, FIRSTNAME FROM CUSTOMER ORDER BY COUNTRY,
STATE, CITY, CUSTOMERID;

--A)  44.992 ms
--B) 
CREATE INDEX PUNTO3 ON CUSTOMER (COUNTRY, STATE, CITY, CUSTOMERID);
--C)  11.083 ms

---------------------------------------------PUNTO 4 ----------------------------------------------
EXPLAIN ANALYZE INSERT INTO CUSTOMER (CUSTOMERID,FIRSTNAME,LASTNAME,ADDRESS1,CITY,COUNTRY,REGION,
CREDITCARDTYPE,CREDITCARD,CREDITCARDEXPIRATION,USERNAME,PASSW) 
VALUES (10501,'AAAAA','BBBBBB','28932 AV. CANASGORDAS', 'CALI','COLOMBIA',2,10,'28983298382829','2014-12-31','UsAAA','PsAB');

--A) Total runtime: 34.969 ms
--B)
DROP INDEX PUNTO2;
DROP INDEX PUNTO3;
--C)
EXPLAIN ANALYZE INSERT INTO CUSTOMER (CUSTOMERID,FIRSTNAME,LASTNAME,ADDRESS1,CITY,COUNTRY,REGION,
CREDITCARDTYPE,CREDITCARD,CREDITCARDEXPIRATION,USERNAME,PASSW) 
VALUES (10500,'DDDDD','EEEEEEE','28937 AV. CANASGORDAS', 'CALI','COLOMBIA',2,10,'74747474774747','2014-12-31','UsDDD','PsDE');
--D) Total runtime: 0.206 ms



---------------------------------------- PUNTO 5 ------------------------------------------------
CREATE VIEW PUNTO5 AS (SELECT CUSTOMER.CUSTOMERID,FIRSTNAME,LASTNAME,CITY FROM CUSTOMER JOIN CUST_ORDER ON (CUSTOMER.CUSTOMERID = CUST_ORDER.CUSTOMERID));

--A) 
CREATE RULE DELP5 AS ON DELETE TO PUNTO5 DO INSTEAD NOTHING; 
CREATE RULE SELP5 AS ON INSERT TO PUNTO5 DO INSTEAD NOTHING;
--B)
CREATE RULE UPDP5 AS ON UPDATE TO PUNTO5 DO INSTEAD UPDATE CUSTOMER SET 
CUSTOMERID = NEW.CUSTOMERID, FIRSTNAME = NEW.FIRSTNAME, LASTNAME = NEW.LASTNAME, CITY = NEW.CITY
WHERE CUSTOMERID = OLD.CUSTOMERID AND FIRSTNAME = OLD.FIRSTNAME AND LASTNAME = OLD.LASTNAME AND CITY = OLD.CITY ;
 



