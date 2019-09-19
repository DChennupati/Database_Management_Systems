-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--- HW4-A SOLUTIONS:  RETRIEVES
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R1A
AS

/*
R1:  Return a list of products. Include the name of the product, its SKU, and the weight of the item. Order
the list by the heaviest product to the lightest.
*/

SELECT P.SKU, P.name AS productName, P.itemWeight
FROM Products AS P
ORDER BY P.itemWeight DESC

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R2A
AS

/*
R2:  Return a list of box status’ that were logged after a specific date and a specific status. Include the box
number, the tracking number, the status code, and the date/time of the log. Order the list by the box
number and the log date/time.
*/

SELECT T.box AS boxNumber, T.trackingNumber, T.status, T.logDateTime
FROM TrackingLog AS T
WHERE logDateTime > '6/7/2018'
	AND status = '4028'
ORDER BY T.box, T.logDateTime


RETURN 
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R3A
AS

/*
R3:  Return a list of products and their prices. Include the product’s name, it’s price, and the dates of the
product-price. List the product‐prices by product name and the date of the prices (expensive to least expensive).
*/

SELECT P.SKU, P.name AS productName, PP.price, PP.startDate, PP.endDate
FROM Products AS P INNER JOIN ProductPrices AS PP ON P.SKU = PP.SKU
ORDER BY P.name, PP.price DESC, PP.startDate


RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R4A
AS

/*
R4:  List the media items that were watched in a specific time frame (e.g. May 1 – May 15). Include the ID
of the media item, the date that it was watched and the length of time that it was viewed. Also include
the media rating of the media item.
*/

SELECT M.mediaID, W.dateWatched, W.viewLength, M.rating
FROM StreamingMedia AS M INNER JOIN MediaWatchLog AS W ON M.mediaID = W.media
WHERE W.dateWatched BETWEEN '3/1/2019 12:00' AND '4/30/2019 23:59'

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R5A
AS

/*
R5:  Return the number of offers sent for an account for people that have last names that begin with “Sm”
and for offers that were sent after a specific date. Include the person’s name and the number of offers.

Note:  Need to add data:  Accounts with "Sm" last name; Offer to new account
*/

SELECT A.lastName, A.firstName,
	COUNT(AO.offer) AS numAccountOffers
FROM Accounts AS A LEFT OUTER JOIN AccountOffers AS AO ON A.accountID = AO.account
WHERE AO.offerSent > '1/15/2019'
	AND A.lastName LIKE 'Sm%'
GROUP BY A.lastName, A.firstName
ORDER BY A.lastName, A.firstName

RETURN 
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R6A
AS

/*
R6:  Return a list of profiles that have not submitted a review. Include the account number and profile.
*/

SELECT P.account AS acctNumber, P.profileName
FROM StreamProfiles AS P LEFT OUTER JOIN MediaReviews AS R ON (P.account = R.account AND P.profileName = R.profile)
WHERE R.ratingDate IS NULL

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R7A
AS

/*
R7:  Return the products that were included in a wishlist. Only include products that were requested with
more than two quantities. Include the account number, wishlist name, the date of the wishlist, the
SKU and name of the product, and how many products were requested. Also include the average
number of quantities for each product.
*/

SELECT W.account AS acctNumber, W.wishlistName, W.creationDate, 
	WP.SKU, P.name AS productName,
	avgProductQty = (
		SELECT AVG(WPIN.desiredQuantity*1.0)
		FROM WishlistProducts AS WPIN
		WHERE WPIN.SKU = WP.SKU
	)
FROM (Products AS P INNER JOIN WishlistProducts AS WP ON P.SKU = WP.SKU)
	INNER JOIN Wishlists AS W ON (WP.account = W.account AND WP.wishlistName = W.wishlistName)
WHERE WP.desiredQuantity > 2

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R8A
AS

/*
R8:  Based on a specific category, return the products that were purchased from each vendor. Include the
product’s name, the vendor name, the category, and the total amount paid to vendors.
*/

SELECT P.SKU, P.name AS productName, 
	PC.category, C.name,
	V.vendorName, SUM(VP.quantity * VP.paidPrice) AS totalAmtPaid
FROM (( (ProductCategories AS PC INNER JOIN Products AS P ON PC.SKU = P.SKU)
	INNER JOIN Categories AS C ON PC.category = C.categoryID
	INNER JOIN VendorProducts AS VP ON P.SKU = VP.SKU)
	INNER JOIN Vendors AS V ON VP.vendor = V.vendorName)
WHERE PC.category = '80'
GROUP BY P.SKU, P.name, PC.category, C.name, V.vendorName

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R9A
AS

/*
R9:  Return the number of devices for an account even if an account does not have any devices. Include
the device manufacturer, the account’s number and name, and the serial number of the device.
*/

SELECT A.accountID AS acctNumber, A.lastName, A.firstName,
	AD.SN, AD.name AS deviceName,
	T.manufacturer,
	COUNT(AD.SN) AS numAcctDevices
FROM ( (Accounts AS A LEFT OUTER JOIN AccountDevices AS AD ON A.accountID = AD.account)
	LEFT OUTER JOIN DeviceTypes AS T ON AD.deviceType = T.typeCode)
GROUP BY A.accountID, A.lastName, A.firstName, AD.SN, AD.name, T.manufacturer

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW410A
AS

/*
R10: Return a list of media lists that only have one item in it. Include the account’s name, profile name, and
the media list name.
*/

SELECT A.lastName, A.firstName, L.profile, L.listName
FROM (MediaLists AS L INNER JOIN MediaListItems AS I ON (L.account = I.account AND L.profile = I.profile AND L.listName = I.listName))
	INNER JOIN Accounts AS A ON L.account = A.accountID
GROUP BY A.lastName, A.firstName, L.profile, L.listName
HAVING COUNT(I.media) = 1

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R11A
AS

/*
R11:  Return a list of orders that were more than a specific amount (amount of the order). The orders must
be associated to accounts that have at least one wishlist. Include the order number, order date, and
the account name.
*/

SELECT O.orderNumber, O.orderDate,
	A.lastName, A.firstName,
	SUM(OP.quantity * PP.price) AS totalOrderAmt
FROM ((( (Orders AS O INNER JOIN OrderProducts AS OP ON O.orderNumber = OP.orderNumber)
	INNER JOIN ProductPrices AS PP ON OP.SKU = PP.SKU AND OP.priceStartDate = PP.startDate)
	INNER JOIN AccountCards AS AC ON O.card = AC.cardID)
	INNER JOIN Accounts AS A ON AC.billingAccount = A.accountID)
WHERE A.accountID IN (
	SELECT DISTINCT account FROM Wishlists
)
GROUP BY O.orderNumber, O.orderDate, A.lastName, A.firstName
HAVING SUM(OP.quantity * PP.price) > 25.00

RETURN
GO

-----------------------------------------------------------------------------------

CREATE PROCEDURE HW4R12A
AS

/*
R12:  Return the shipments/boxes that were shipped with a specific carrier. Include the box’s number,
dimensions, the employee that packaged the box, the employee’s manager’s name, the carrier’s
information, and the order associated to the box.
*/


SELECT B.boxID, B.boxLength, B.boxWidth, B.boxHeight, B.boxWeight,
	E.employeeID, E.lastName, E.firstName,
	M.lastName AS mgrLastName, M.firstName AS mgrFirstName,
	L.carrier, C.carrierName, C.website,
	OP.orderNumber
FROM ((( (ShipmentBoxes AS B INNER JOIN TrackingLog AS L ON B.boxID = L.box)
	INNER JOIN Carriers AS C ON L.carrier = C.carrierCode)
	INNER JOIN Employees AS E ON B.packager = E.employeeID)
	LEFT OUTER JOIN OrderProducts AS OP ON B.boxID = OP.box)
	LEFT OUTER JOIN Employees AS M ON E.managerID = M.employeeID
WHERE L.carrier = '3948'

RETURN
GO

