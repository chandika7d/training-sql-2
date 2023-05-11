-- Query get Order
SELECT
	o.id AS order_id,
	o.orderdate AS order_date,
	c.`name` AS customer_name,
	rt.`name` AS ride_type,
	o.tripfare AS trip_fare,
	o.appservicefee AS platform_fee,
	o.discount AS discount,
	( o.tripfare + o.appservicefee - discount ) AS total_payment,
	pm.`name` AS payment_method,
	d.`name` AS driver_name,
	CONCAT( vb.brand, " ", vb.`name` ) AS vehicle_name,
	v.platenumber AS plate_number,
	o.distance AS distance,
	TIMEDIFF( o.dropdate, o.pickupdate ) AS trip_duration,
	o.pickupdate AS pickup_time,
	pl.addressname AS pickup_address_name,
	pl.address AS pickup_address,
	o.dropdate AS drop_time,
	dl.addressname AS drop_address_name,
	dl.address AS drop_address 
FROM
	`order` o
	INNER JOIN customer c ON o.idcustomer = c.id
	INNER JOIN driver d ON o.iddriver = d.id
	INNER JOIN vehicle v ON o.idvehicle = v.id
	INNER JOIN vehiclebrand vb ON v.idvehiclebrand = vb.id
	INNER JOIN ridetype rt ON v.ridetype = rt.id
	INNER JOIN location pl ON o.idpickup = pl.id
	INNER JOIN location dl ON o.iddrop = dl.id
	LEFT JOIN payment p ON p.idorder = o.id
	LEFT JOIN paymentmethod pm ON p.idpaymentmethod = pm.id