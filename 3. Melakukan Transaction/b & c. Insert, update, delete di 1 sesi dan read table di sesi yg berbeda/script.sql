START TRANSACTION;

INSERT INTO `employees` ( `employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle` ) VALUES ( 1708, 'Prakoso', 'Dian', 'x102', 'dian@classicmodelcars.com', '6', 1088, 'Sales Rep' );

UPDATE `employees` SET `email` = 'chandika7d@classicmodelcars.com' WHERE `employeeNumber` = 1703;

DELETE FROM `employees` WHERE `employeeNumber` = 1707;

ROLLBACK;