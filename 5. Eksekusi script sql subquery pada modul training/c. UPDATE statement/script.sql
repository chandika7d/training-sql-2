UPDATE employees e set e.jobTitle = "Sales Manager (NA)" WHERE ( SELECT count( c.customerNumber ) FROM customers c WHERE c.salesRepEmployeeNumber = e.employeeNumber ) >= 10;