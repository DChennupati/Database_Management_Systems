CREATE PROCEDURE HW4AddtionalData
AS

--------------------------------------------------------------------------------
/*
D4A:  For profiles flagged with parental restriction, delete any media reviews that have media with a rating of R.

Note:  Add review to R-rated media & associate to parent-restrict profile
*/

INSERT INTO Products( SKU, name, description, itemWeight, itemHeight, itemWidth, itemLength) 
	VALUES  ( 'DB074ZMJZ6P', 'IT', 'Get scared',NULL,NULL,NULL, NULL );

INSERT INTO StreamingMedia( mediaID, releaseDate, length, synopsis, rating) 
	VALUES  ( 'DB074ZMJZ6P', '1/9/2018', 120, 'Scary clown terrorizes kids...', 'R' );

INSERT INTO MediaReviews(account, profile, media, rating, ratingDate, reviewComments) 
	VALUES  ( 113001, 'KidsStuff', 'DB074ZMJZ6P', 4, '4/17/2019 12:24:00 PM', 'blah blah blah blah' );

SELECT * FROM MediaReviews


--------------------------------------------------------------------------------
/*
D3B:  If a rental has not been returned after 60 days, delete the order.

Note:  Add rental that has not been returned since 1/1/2019
*/

INSERT INTO Products( SKU, name, description, itemWeight, itemHeight, itemWidth, itemLength) 
	VALUES  ( 'B074ZMJZ6PR', 'IT', 'Get scared over and over again',NULL,NULL,NULL, NULL );

INSERT INTO ProductPrices(SKU, startDate, endDate, price) 
	VALUES  ( 'B074ZMJZ6PR', '1/9/2018', '4/1/2019', 2.5 );

SET IDENTITY_INSERT Orders ON
INSERT INTO Orders( orderNumber, orderDate, card, orderOffer, rentalOrder) 
	VALUES  ( 200001, '10/31/2019 10:01', 12000, NULL, 1 );
SET IDENTITY_INSERT Orders OFF

INSERT INTO ShipmentBoxes(boxID, boxWeight, boxHeight, boxWidth, boxLength, packager, shipDate) 
	VALUES  ( '555555555', 29, 0.5, 1.75, 1, 5001, '10/31/2018 1:34' );

INSERT INTO OrderProducts(orderNumber, SKU, priceStartDate, quantity, account, shippingAddress, box, productOffer) 
	VALUES  (200001, 'B074ZMJZ6PR', '1/9/2018', 1, 110001, 1, NULL, NULL );

INSERT INTO Rentals(orderNumber, expectedDueDate, actualReturnDate) 
	VALUES  ( 200001, '12/1/2018 19:24', NULL );

SELECT * FROM Rentals


--------------------------------------------------------------------------------
/*
R5A:  Return the number of offers sent for an account for people that have last names that begin with “Sm”
and for offers that were sent after a specific date. Include the person’s name and the number of offers.

Note:  Need to add data:  Accounts with "Sm" last name; Offer to new account
*/

SET IDENTITY_INSERT Accounts ON
INSERT INTO Accounts (accountID, firstName, lastName, email, password, creationDate, subscriptionStartDate, subscriptionEndDate) 
	VALUES  (210001, 'Guy', 'Smiley', 'smileyman@aol.com', 'pwpwpwpw', '4/17/2019 8:17:00', '4/17/2019 13:00', NULL );
SET IDENTITY_INSERT Accounts OFF

INSERT INTO AccountOffers(account, offer, offerSent) VALUES  ( 210001, 'DISNEY2018', '4/2/2019 3:30 pm' );

SELECT * FROM AccountOffers


--------------------------------------------------------------------------------
/*
R10B:  For streaming media that were watched more than 3 times in a specific time frame, return the media’s
information including the name/title of the media item, its release date, media length, and any rental
requirement associated to the item.

Note:  Need to add media watch info for 4 different times or add one more record to existing data set
*/

---USING DATA FROM PREVIOUS QUESTION: HW4D4A
------PRODUCTS, STREAMINGMEDIA

INSERT INTO ProductRentalRequirements (rentedProduct, requirement) 
	VALUES  ( 'DB074ZMJZ6P', 'LL' );

INSERT INTO MediaWatchlog( account, profile, media, dateWatched, viewLength) 
	VALUES  ( 110001, 'Scott', 'DB074ZMJZ6P', '12/12/2018 12:24:00 PM', 10 );

INSERT INTO MediaWatchlog( account, profile, media, dateWatched, viewLength) 
	VALUES  ( 110001, 'Scott', 'DB074ZMJZ6P', '12/13/2018 1:24:00 PM', 15 );

INSERT INTO MediaWatchlog( account, profile, media, dateWatched, viewLength) 
	VALUES  ( 110001, 'Scott', 'DB074ZMJZ6P', '12/14/2018 2:24:00 PM', 20 );

INSERT INTO MediaWatchlog( account, profile, media, dateWatched, viewLength) 
	VALUES  ( 110001, 'Scott', 'DB074ZMJZ6P', '12/15/2018 3:24:00 PM', 25 );


--------------------------------------------------------------------------------
/*
U1A: Update product prices that have a valid date between April 1, 2019 8:00 am ‐ April 1, 2019 5:00 pm.
Increase these prices by 5%.

Note:  Need to add prices within time frame
*/

---USING DATA FROM PREVIOUS QUESTION: HW4D4A

INSERT INTO ProductPrices(SKU, startDate, endDate, price) 
	VALUES  ( 'DB074ZMJZ6P', '1/9/2018', '4/1/2019', 5.00 );

INSERT INTO ProductPrices(SKU, startDate, endDate, price) 
	VALUES  ( 'DB074ZMJZ6P', '4/1/2019', NULL, 7.00 );

SELECT * FROM ProductPrices


--------------------------------------------------------------------------------
/*
U3A: Extend the account subscription end date by 2 weeks if an account’s profile was created in June 2018.

Note:  Need to add profile within June 2018
*/

INSERT INTO StreamProfiles(account, profileName, createDate, parentalRestriction) 
	VALUES  ( 110003, 'Ren', '6/12/2018 7:24:00 PM', 0 );

SELECT * FROM StreamProfiles


--------------------------------------------------------------------------------
/*
U4A:  Update the status code from “Out for Delivery” to “Delayed due to weather conditions” for boxes that are
in the hands of USPS on March 31, 2019.

Note:  Need to add status codes, "Out.." and "Delayed"; also need to add records to TrackingLog with new codes with USPS carrier on March 31, 2019
*/

INSERT INTO StatusCodes (statusCode, statusDescription) 
	VALUES  ( '4100', 'Out for Delivery' );

INSERT INTO StatusCodes (statusCode, statusDescription) 
	VALUES  ( '4199', 'Delayed due to weather conditions' );

SELECT * FROM StatusCodes


INSERT INTO TrackingLog(trackingNumber, logDateTime, currentCity, currentState, box, carrier, status) 
	VALUES  ( '9999999FFFF', '3/31/2019 18:04', 'Albuquerque', 'NM', '114873', '3948', '4100' );

SELECT * FROM TrackingLog


--------------------------------------------------------------------------------
/*
U5A:  A new manager will be supervising employees that failed to package on average 2 boxes between March 29, 2019 
to March 31, 2019. Update the corresponding employee’s manager to the new manager’s ID:  6000.

Note:  Need to add manager with ID = 6000; add data for boxes packed/shipped in March 2019
*/
SELECT *
FROM Employees
WHERE employeeID IN (
	SELECT packager
	FROM Employees AS E LEFT OUTER JOIN ShipmentBoxes AS B ON E.employeeID = B.packager
	WHERE shipDate BETWEEN '3/29/2019 00:00' AND '3/31/2019 23:59'
	GROUP BY packager
	HAVING COUNT(boxID) < 2
)


SET IDENTITY_INSERT Employees ON
INSERT INTO Employees(employeeID, firstName, lastName, hireDate, termDate, managerID) 
	VALUES  ( 6000, 'Geoff', 'Tate', '4/17/2019', NULL, NULL );
SET IDENTITY_INSERT Employees OFF

SELECT * FROM Employees


INSERT INTO ShipmentBoxes(boxID, boxWeight, boxHeight, boxWidth, boxLength, packager, shipDate) 
	VALUES  ( '55667788', 29, 0.5, 1.75, 1, 5003, '3/30/2019 1:34' );

SELECT * FROM ShipmentBoxes


--------------------------------------------------------------------------------
/*
U1B: Update prices of products purchased from vendors that have a valid date between April 1, 2019 ‐ 
April 2, 2019. Decrease the paid prices by 5%.

Note:  Need to add prices in time frame (4/1-4/2)
*/

---USING DATA FROM PREVIOUS QUESTION: HW4D3B

INSERT INTO VendorProducts(SKU, vendor, purchaseDate, quantity, paidPrice, receivedDate) 
	VALUES  ( 'B074ZMJZ6PR', 'DVDEmporium LLC', '4/1/2019 12:00', 100, 7.50, '4/17/2019 11:03' );

SELECT * FROM VendorProducts

--------------------------------------------------------------------------------
/*
U3B: For categories that are unassigned to a product, assign their parent category to another category.

Note:  Need to add category & not assign to any products; add "OTHER" category
*/

INSERT INTO Categories(categoryID, name, parentCategory) 
	VALUES  ( '71', 'Kitchen Utencils', NULL );

INSERT INTO Categories(categoryID, name, parentCategory) 
	VALUES  ( '99', 'Other', NULL );

SELECT * FROM Categories


RETURN
GO
