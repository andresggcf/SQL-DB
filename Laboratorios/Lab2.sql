-- punto 1

SELECT firstname, lastname, orderid, orderdate FROM customer NATURAL JOIN cust_order WHERE customerid = 2846;

--punto 2

SELECT firstname, lastname, orderid, orderdate, prod_id, quantity FROM customer NATURAL JOIN cust_order NATURAL JOIN orderline LIMIT (20);

--punto 3

SELECT prod_id, title, categoryname FROM product JOIN category ON (category = code) limit 20;

--punto 4

SELECT orderid, prod_id, title FROM orderline JOIN product USING (prod_id) limit 20;

-- punto 5

SELECT prod_id, orderline.quantity FROM orderline JOIN product USING (prod_id) WHERE orderid = 298; 

-- punto 6

SELECT orderid, prod_id, title FROM orderline JOIN product USING (prod_id) WHERE orderid = 298;

-- punto 7

SELECT lastname, title, categoryname FROM customer NATURAL JOIN cust_order NATURAL JOIN orderline JOIN product USING (prod_id) JOIN category ON (category = code) limit 20;

-- punto 8

SELECT orderid, orderdate FROM cust_order WHERE customerid = NULL;

--punto 9

SELECT orderid, orderdate, customerid, lastname FROM customer INNER JOIN cust_order USING (customerid) WHERE orderid > 11975;

-- punto 10

SELECT prod_id FROM product WHERE (SELECT prod_id FROM product JOIN orderline USING (prod_id) WHERE  




