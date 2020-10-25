-- exercises for join and alias practice
-- 1. Write a query that shows EmployeeID and Training Descriptions of courses taken
SELECT e.EmployeeID, t.Training
FROM Employee_Training as e JOIN Training_Course as t
ON e.TrainingID = t.TrainingID;

/* 2. Write a query that shows employees first and last names
(joined together in 1 column) that have received an A grade.
Use Aliases where appropriate */
SELECT concat(rtrim(e.firstname),' ',e.lastname) as 'Fullname'
from Employee as e JOIN Employee_Training as et
ON e.EmployeeID = et.EmployeeID
WHERE et.Grade = 'A';

/* 3. Write a JOIN that shows all columns of products that have been sold.
Include all PRODUCT rows regardless. */
SELECT *
FROM SALE_ITEM as s RIGHT OUTER JOIN PRODUCT as p
ON s.productid = p.productid;

/* 4. Write a query that shows the highest employee commission broken down by gender.
Don't include groups with less than $100 max commission. */
SELECT Gender, MAX(EmployeeCommission) as 'maxcommission'
FROM Employee as e JOIN Sale as s
ON e.EmployeeID = s.EmployeeID
GROUP BY Gender
HAVING max(EmployeeCommission) > 100;
-- note: could also do HAVING maxcommission > 100; rather than doing max pre-alias

/* 5. List the last name of the employee and last name of the customer
that sold an item to a customer with a last name starting with the letter 'H'.
Use appropriate aliases. */
SELECT emp.lastname as 'EmployeeLastName', cust.lastname as 'CustomerLastName'
FROM customer as cust JOIN Sale as sa
ON cust.customerid = sa.customerid
JOIN employee as emp
ON emp.EmployeeID = sa.EmployeeID
WHERE cust.LastName lIKE 'H%';

/* 6. Write a query that shows the first name of the customer who bought a product
with a product name of 'American Silver Eagle'
Do not include duplicate values. */
SELECT DISTINCT c.firstname
from customer as cust JOIN Sale as sa
ON cust.customerid = sa.customerid
JOIN sale_item as item
ON sa.saleid = item.saleid
JOIN product as p 
ON item.productid = p.productid
WHERE Productname = 'American Silver Eagle';

/* List the Last Name and average commission of each employee.
Sort from the highest commission to lowest.
Use an alias where appropriate.
Make commission output in currency format. */
SELECT Lastname, FORMAT(AVG(EmployeeCommission),'c') as 'AVGCommission'
FROM Employee as e JOIN Sale as s
ON e.EmployeeID = s.EmployeeID
GROUP BY LastName
ORDER BY AVG(EmployeeCommission) desc;