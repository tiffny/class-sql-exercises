/* Write a Subquery that lists the Product Country for items that
sold more than $10. Don't include duplicate rows */
SELECT DISTINCT ProductCountry
FROM Product
WHERE ProductID IN(SELECT ProductID
					FROM Sale_Item
					WHERE Itemprice > 10);

/* Write a Subquery that shows the item price that is EQUAL to the avg item price. */
SELECT Itemprice
FROM Sale_Item
WHERE Itemprice = (SELECT AVG(Itemprice)
					FROM Sale_Item);

/* Write a Subquery that shows the salary of employees that make over
$25,000 the minimum salary of all employees.
Don't include the employee with last name 'Mills'. */
SELECT Salary
FROM Employee
WHERE LastName <> 'Mills' AND Salary = (SELECT MIN(Salary)+25000
										FROM Employee);
--Keep WHERE and AND outside of subquery

/* Write a Subquery that shows the first three letters of
the employees last name that earned commission over 100 */
SELECT substring (Lastname,1,3) as '3lettersoflastname'
FROM Employee
WHERE EmployeeID IN(SELECT EmployeeID
					FROM Sale
					WHERE EmployeeCommission >100);
--IN and = seem to be non-major differences for subqueries

/* Write a Subquery that lists the Employees Last Name that have
a sole product with the name 'American Silver Eagle'. */
SELECT LastName
FROM Employee
WHERE EmployeeID IN (SELECT EmployeeID
					FROM Sale
					WHERE SaleID IN
					(SELECT SaleID
						FROM Sale_Item
							WHERE ProductID IN
							(SELECT ProductID
								FROM Product
								WHERE ProductName = 'American Silver Eagle')));