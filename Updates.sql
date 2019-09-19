-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--- HW4-A SOLUTIONS:  UPDATES
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4U1A
AS

/*
U1: Update product prices that have a valid date between April 1, 2019 8:00 am ‐ April 1, 2019 5:00 pm.
Increase these prices by 5%.

Note:  Need to add prices within time frame
*/

SELECT * FROM ProductPrices
WHERE startDate BETWEEN '4/1/2019 8:00 AM' AND '4/1/2019 5:00 PM'

UPDATE ProductPrices SET
	price = price * 1.05
WHERE startDate BETWEEN '4/1/2019 8:00 AM' AND '4/1/2019 5:00 PM'

SELECT * FROM ProductPrices
WHERE startDate BETWEEN '4/1/2019 8:00 AM' AND '4/1/2019 5:00 PM'

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4U2A
AS

/*
U2: Decrease vendor product prices by 10% for vendors that have not been suspended.
*/

SELECT * FROM VendorProducts AS VP
WHERE VP.vendor IN (
	SELECT vendorName
	FROM Vendors AS V
	WHERE suspensionDate IS NULL
)

UPDATE VendorProducts SET
	paidPrice = paidPrice * 0.9
WHERE vendor IN (
	SELECT vendorName
	FROM Vendors AS V
	WHERE suspensionDate IS NULL
)

SELECT * FROM VendorProducts AS VP
WHERE VP.vendor IN (
	SELECT vendorName
	FROM Vendors AS V
	WHERE suspensionDate IS NULL
)

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4U3A
AS

/*
U3: Extend the account subscription end date by 2 weeks if an account’s profile was created in June 2018.

Note:  Need to add profile within June 2018
*/

SELECT *
FROM Accounts
WHERE accountID IN (
	SELECT P.account
	FROM StreamProfiles AS P
	WHERE P.createDate BETWEEN '6/1/2018 12:00 AM' AND '6/30/2018 11:59 PM'
)

UPDATE Accounts SET
	subscriptionEndDate = DATEADD(wk, 2, subscriptionEndDate)
WHERE accountID IN (
	SELECT P.account
	FROM StreamProfiles AS P
	WHERE P.createDate BETWEEN '6/1/2018 12:00 AM' AND '6/30/2018 11:59 PM'
)

SELECT *
FROM Accounts
WHERE accountID IN (
	SELECT P.account
	FROM StreamProfiles AS P
	WHERE P.createDate BETWEEN '6/1/2018 12:00 AM' AND '6/30/2018 11:59 PM'
)

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4U4A
AS

/*
U4:  Update the status code from “Out for Delivery” to “Delayed due to weather conditions” for boxes that are
in the hands of USPS on March 31, 2019.

Note:  Need to add status codes, "Out.." and "Delayed"; also need to add records to TrackingLog with new codes with USPS carrier on March 31, 2019
*/

SELECT * 
FROM TrackingLog
WHERE status = 4100
	AND carrier = '3948'
	AND logDateTime BETWEEN '3/31/2019 00:00' AND '3/31/2019 23:59'

UPDATE TrackingLog SET
		status = 4199
WHERE status = 4100
	AND carrier = '3948'
	AND logDateTime BETWEEN '3/31/2019 00:00' AND '3/31/2019 23:59'

SELECT * 
FROM TrackingLog
WHERE status = 4100
	AND carrier = '3948'
	AND logDateTime BETWEEN '3/31/2019 00:00' AND '3/31/2019 23:59'

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4U5A
AS

/*
U5:  A new manager will be supervising employees that failed to package on average 2 boxes between March 29, 2019 
to March 31, 2019. Update the corresponding employee’s manager to the new manager’s ID:  6000.

Note:  Need to add manager with ID = 6000; add data for boxes packed/shipped in March 2019
*/

---METHOD1:  COUNTING NUMBER OF BOXES PER MONTH; BASE FILTER ON COUNT
SELECT *
FROM Employees
WHERE employeeID IN (
	SELECT packager
	FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
	WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
	GROUP BY packager
	HAVING COUNT(boxID) < 2
)

UPDATE Employees SET
	managerID = 6000
WHERE employeeID IN (
	SELECT packager
	FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
	WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
	GROUP BY packager
	HAVING COUNT(boxID) < 2
)

SELECT *
FROM Employees
WHERE employeeID IN (
	SELECT packager
	FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
	WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
	GROUP BY packager
	HAVING COUNT(boxID) < 2
)



---METHOD2:  COUNT NUMBER OF BOXES PER DAY; TAKE AVERAGE & FILTER
SELECT * FROM Employees
WHERE employeeID IN (
	SELECT employeeID
	FROM (
		SELECT E.employeeID, B.shipDate, 
			COUNT(B.boxID) AS numBoxes
		FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
		---WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
		GROUP BY E.employeeID, B.shipDate
	) AS T
	GROUP BY employeeID
	HAVING AVG(numBoxes*1.0) < 2
)

UPDATE Employees SET
	managerID = 6000
WHERE employeeID IN (
	SELECT employeeID
	FROM (
		SELECT E.employeeID, B.shipDate, 
			COUNT(B.boxID) AS numBoxes
		FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
		---WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
		GROUP BY E.employeeID, B.shipDate
	) AS T
	GROUP BY employeeID
	HAVING AVG(numBoxes*1.0) < 2
)

SELECT * FROM Employees
WHERE employeeID IN (
	SELECT employeeID
	FROM (
		SELECT E.employeeID, B.shipDate, 
			COUNT(B.boxID) AS numBoxes
		FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
		---WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
		GROUP BY E.employeeID, B.shipDate
	) AS T
	GROUP BY employeeID
	HAVING AVG(numBoxes*1.0) < 2
)

RETURN
GO

