-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--- HW4-A SOLUTIONS:  DELETES
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4D1A
AS

/*
D1:  Remove any media review that is at or below a 2‐rating.
*/

SELECT * FROM MediaReviews
WHERE rating <= 2

DELETE FROM MediaReviews
WHERE rating <= 2

SELECT * FROM MediaReviews
WHERE rating <= 2

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4D2A
AS

/*
D2:  Delete any account’s devices that are associated to a specific device manufacturer.
*/

SELECT * FROM AccountDevices
WHERE SN IN (
	SELECT D.SN 
	FROM DeviceTypes AS T INNER JOIN AccountDevices AS D ON T.typeCode = D.deviceType
	WHERE T.manufacturer = 'Anki'
)

DELETE FROM AccountDevices
WHERE SN IN (
	SELECT D.SN 
	FROM DeviceTypes AS T INNER JOIN AccountDevices AS D ON T.typeCode = D.deviceType
	WHERE T.manufacturer = 'Anki'
)

SELECT * FROM AccountDevices
WHERE SN IN (
	SELECT D.SN 
	FROM DeviceTypes AS T INNER JOIN AccountDevices AS D ON T.typeCode = D.deviceType
	WHERE T.manufacturer = 'Anki'
)


RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4D3A
AS

/*
D3:  Delete account cards that have not been used for an order.

Note:  Need to add account-card with no order
*/

SELECT * FROM AccountCards
WHERE cardID IN (
	SELECT DISTINCT cardID
	FROM AccountCards AS AC LEFT OUTER JOIN Orders AS O ON AC.cardID = O.card
	WHERE O.orderNumber IS NULL
)

DELETE FROM AccountCards
WHERE cardID IN (
	SELECT DISTINCT cardID
	FROM AccountCards AS AC LEFT OUTER JOIN Orders AS O ON AC.cardID = O.card
	WHERE O.orderNumber IS NULL
)

SELECT * FROM AccountCards
WHERE cardID IN (
	SELECT DISTINCT cardID
	FROM AccountCards AS AC LEFT OUTER JOIN Orders AS O ON AC.cardID = O.card
	WHERE O.orderNumber IS NULL
)

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4D4A
AS

/*
D4:  For profiles flagged with parental restriction, delete any media reviews that have media with a rating of R.

Note:  Add review to R-rated media & associate to parent-restrict profile
*/

SELECT *
FROM MediaReviews
WHERE (CONVERT(varchar, account) + '-' + profile + '-' + media) IN (
	SELECT CONVERT(varchar, R.account) + '-' + R.profile + '-' + R.media
	FROM ( (StreamProfiles AS P INNER JOIN MediaReviews AS R ON (P.account = R.account AND P.profileName = R.profile))
		INNER JOIN StreamingMedia AS M ON R.media = M.mediaID)
	WHERE P.parentalRestriction = 1
		AND M.rating = 'R'
)

DELETE
FROM MediaReviews
WHERE (CONVERT(varchar, account) + '-' + profile + '-' + media) IN (
	SELECT CONVERT(varchar, R.account) + '-' + R.profile + '-' + R.media
	FROM ( (StreamProfiles AS P INNER JOIN MediaReviews AS R ON (P.account = R.account AND P.profileName = R.profile))
		INNER JOIN StreamingMedia AS M ON R.media = M.mediaID)
	WHERE P.parentalRestriction = 1
		AND M.rating = 'R'
)

SELECT *
FROM MediaReviews
WHERE (CONVERT(varchar, account) + '-' + profile + '-' + media) IN (
	SELECT CONVERT(varchar, R.account) + '-' + R.profile + '-' + R.media
	FROM ( (StreamProfiles AS P INNER JOIN MediaReviews AS R ON (P.account = R.account AND P.profileName = R.profile))
		INNER JOIN StreamingMedia AS M ON R.media = M.mediaID)
	WHERE P.parentalRestriction = 1
		AND M.rating = 'R'
)

RETURN
GO

-----------------------------------------------------------------------------------



CREATE PROCEDURE HW4D5A
AS

/*
D5:  Remove an order and its information if the order has not shipped in 30 days.
*/

---BUILDING TEMP TABLE TO STORE ORDER NUMBERS AS DATA IS BASED ON CHILD TABLE; WHEN CHILD DATA IS DELETED, PARENT CAN'T BE DELETED UNLESS STORE INFO IN TEMPORARY LOCATION
SELECT O.orderNumber
INTO #tmpOrders
FROM (Orders AS O INNER JOIN OrderProducts AS OP ON O.orderNumber = OP.orderNumber)
	LEFT OUTER JOIN ShipmentBoxes AS B ON OP.box = B.boxID
WHERE B.shipDate IS NULL
	AND DATEDIFF(dd, O.orderDate, GETDATE()) >= 30


---DELETE FROM CHILDREN:  OrderProducts, Rentals

SELECT * FROM Rentals
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

DELETE FROM Rentals
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

SELECT * FROM Rentals
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)


SELECT * FROM OrderProducts
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

DELETE FROM OrderProducts
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

SELECT * FROM OrderProducts
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)


---DELETE FROM PARENT
SELECT * FROM Orders
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

DELETE FROM Orders
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)

SELECT * FROM Orders
WHERE orderNumber IN (
	SELECT orderNumber FROM #tmpOrders
)


---DROP TEMP TABLE
DROP TABLE #tmpOrders

RETURN
GO
