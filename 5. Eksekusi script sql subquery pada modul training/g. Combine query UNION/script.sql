SELECT
	e.*,
	es.numberOfCustomer 
FROM
	( SELECT c.salesRepEmployeeNumber, count( c.customerNumber ) AS numberOfCustomer FROM customers c GROUP BY c.salesRepEmployeeNumber ) es
	RIGHT JOIN employees e ON es.salesRepEmployeeNumber = e.employeeNumber