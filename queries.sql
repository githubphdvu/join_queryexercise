--in Terminal, run:
--$psql < seedingfilename.sql
--$psql dbname
--joins_exercise=#\l,\dt,\d tablename,(\d,\dl),q(quit)
--(owners; id,first_name,last_name),(vehicles; id,make,model,year,price,owner_id)
--$ psql -U username -d dbname -f filename.sql 

--1.Join 2 tables so that every column and record appears, regardless of if there is not an owner_id
SELECT * FROM owners o FULL OUTER JOIN vehicles v ON o.id=v.owner_id;

--2.Count each owner's cars. Display first_name(ascending),last_name,count of vehicles
SELECT first_name, last_name, COUNT(owner_id) FROM owners o JOIN vehicles v on o.id=v.owner_id 
GROUP BY (first_name, last_name) ORDER BY first_name;


--3.Display first_name(descending),last_name,car average price>10000,each owner's vehicle count>1
SELECT first_name, last_name,ROUND(AVG(price)) as average_price,COUNT(owner_id) FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY (first_name, last_name) 
HAVING COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;