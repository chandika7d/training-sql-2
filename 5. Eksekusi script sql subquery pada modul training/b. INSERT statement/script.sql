INSERT INTO `employees` ( `employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle` )
VALUES
	(
		1708,
		'Prakoso',
		'Dian',
		'x102',
		'dian@classicmodelcars.com',
		( SELECT o.officeCode FROM offices o WHERE o.city = "Tokyo" ),
		1088,
		'Sales Rep' 
	);