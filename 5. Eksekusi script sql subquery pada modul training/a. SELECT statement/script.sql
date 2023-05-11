SELECT
    e.*,
    ( SELECT count( c.customerNumber ) FROM customers c WHERE c.salesRepEmployeeNumber = e.employeeNumber ) AS number_of_customer 
FROM
    employees e 
WHERE
    ( SELECT count( c.customerNumber ) FROM customers c WHERE c.salesRepEmployeeNumber = e.employeeNumber ) > 5;