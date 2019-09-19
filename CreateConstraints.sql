CREATE PROCEDURE HW3SolCreateConstraints
AS

---RESTRICT#2
ALTER TABLE Vendors
	ADD CONSTRAINT CHKPhoneVendor CHECK (contactPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');		----https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s14.html

---RESTRICT#3
ALTER TABLE AccountAddresses
	ADD CONSTRAINT CHKZipAddresses CHECK (zipCode LIKE '^[A-Z0-9]{9}*');		----https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s14.html

---RESTRICT#5; CK ENFORCEMENT WITH SK
ALTER TABLE Accounts 
	ADD CONSTRAINT UNQAccounts UNIQUE (Email);

---RESTRICT#9
ALTER TABLE ProductPrices
	ADD CONSTRAINT CHKPrice CHECK (price > 0.10);

---RESTRICT#13
ALTER TABLE AccountAddresses
	ADD CONSTRAINT CHKAddrNum CHECK (addressNumber BETWEEN 1 AND 10);

---RESTRICT#14
ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKMACChar CHECK (MAC LIKE '^[0-9A-F]+$');						----https://stackoverflow.com/questions/5317320/regex-to-check-string-contains-only-hex-characters?rq=1

ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKMACLen CHECK (LEN(MAC) = 12);

---RESTRICT#16
ALTER TABLE MediaReviews
	ADD CONSTRAINT CHKReviewRating CHECK (rating BETWEEN 1 AND 4);

ALTER TABLE Vendors
	ADD CONSTRAINT CHKVendorRating CHECK (rating BETWEEN 1 AND 4);

---RESTRICT#17
ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT CHKTransQty CHECK (transactionQuantity > 0);

---RESTRICT#18; CK ENFORCEMENT WITH SK
ALTER TABLE AccountCards 
	ADD CONSTRAINT UNQAccountCards UNIQUE (billingAccount, billingAddress, CVV);


---RESTRICT#21
ALTER TABLE StreamingMedia
	ADD CONSTRAINT CHKMediaLen CHECK (length > 0);

---RESTRICT#22
ALTER TABLE StreamingMedia
	ADD CONSTRAINT CHKMediaRating CHECK (rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR', 'TV-Y', 'TV-Y7', 'TV-G', 'TV-PG'));

---RESTRICT#23
ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKSNLen CHECK (LEN(SN) BETWEEN 10 AND 32);

---RESTRICT#26; CK ENFORCEMENT WITH SK
ALTER TABLE Orders 
	ADD CONSTRAINT UNQOrders UNIQUE (orderDate,	card);

---RESTRICT#29; CK ENFORCEMENT WITH SK
ALTER TABLE Employees 
	ADD CONSTRAINT UNQEmployees UNIQUE (firstName, lastName, hireDate);

---RESTRICT#30
ALTER TABLE TrackingLog
	ADD CONSTRAINT CHKTrackNumLen CHECK (LEN(trackingNumber) BETWEEN 10 AND 32);

---RESTRICT#31
ALTER TABLE StockingTypes
	ADD CONSTRAINT CHKStockType CHECK (typeCode IN ('A', 'R', 'S'));

---RESTRICT#32
ALTER TABLE Categories
	ADD CONSTRAINT CHKCateID CHECK (categoryID BETWEEN 1 AND 100);

---RESTRICT#33
ALTER TABLE ShipmentBoxes
	ADD CONSTRAINT CHKBoxLen CHECK (LEN(boxID) BETWEEN 4 AND 16);

---RESTRICT#34
ALTER TABLE WishlistProducts
	ADD CONSTRAINT DEFWLProdQty DEFAULT 0 FOR desiredQuantity;

ALTER TABLE OrderProducts
	ADD CONSTRAINT DEFOrdProdQty DEFAULT 0 FOR quantity;

RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateConstraintsA
AS

---RESTRICT#2
ALTER TABLE Vendors
	ADD CONSTRAINT CHKPhoneVendor CHECK (contactPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');		----https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s14.html

---RESTRICT#16
ALTER TABLE MediaReviews
	ADD CONSTRAINT CHKReviewRating CHECK (rating BETWEEN 1 AND 4);

ALTER TABLE Vendors
	ADD CONSTRAINT CHKVendorRating CHECK (rating BETWEEN 1 AND 4);

---RESTRICT#17
ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT CHKTransQty CHECK (transactionQuantity > 0);

---RESTRICT#21
ALTER TABLE StreamingMedia
	ADD CONSTRAINT CHKMediaLen CHECK (length > 0);

---RESTRICT#22
ALTER TABLE StreamingMedia
	ADD CONSTRAINT CHKMediaRating CHECK (rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR', 'TV-Y', 'TV-Y7', 'TV-G', 'TV-PG'));

---RESTRICT#31
ALTER TABLE StockingTypes
	ADD CONSTRAINT CHKStockType CHECK (typeCode IN ('A', 'R', 'S'));

---RESTRICT#32
ALTER TABLE Categories
	ADD CONSTRAINT CHKCateID CHECK (categoryID BETWEEN 1 AND 100);

RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


CREATE PROCEDURE HW3SolCreateConstraintsB
AS

---RESTRICT#3
ALTER TABLE AccountAddresses
	ADD CONSTRAINT CHKZipAddresses CHECK (zipCode LIKE '^[A-Z0-9]{9}*');		----https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s14.html

---RESTRICT#5; CK ENFORCEMENT WITH SK
ALTER TABLE Accounts 
	ADD CONSTRAINT UNQAccounts UNIQUE (Email);

---RESTRICT#9
ALTER TABLE ProductPrices
	ADD CONSTRAINT CHKPrice CHECK (price > 0.10);

---RESTRICT#13
ALTER TABLE AccountAddresses
	ADD CONSTRAINT CHKAddrNum CHECK (addressNumber BETWEEN 1 AND 10);

---RESTRICT#14
ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKMACChar CHECK (MAC LIKE '^[0-9A-F]+$');						----https://stackoverflow.com/questions/5317320/regex-to-check-string-contains-only-hex-characters?rq=1

ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKMACLen CHECK (LEN(MAC) = 12);

---RESTRICT#18; CK ENFORCEMENT WITH SK
ALTER TABLE AccountCards 
	ADD CONSTRAINT UNQAccountCards UNIQUE (billingAccount, billingAddress, CVV);

---RESTRICT#23
ALTER TABLE AccountDevices
	ADD CONSTRAINT CHKSNLen CHECK (LEN(SN) BETWEEN 10 AND 32);

---RESTRICT#26; CK ENFORCEMENT WITH SK
ALTER TABLE Orders 
	ADD CONSTRAINT UNQOrders UNIQUE (orderDate,	card);

---RESTRICT#29; CK ENFORCEMENT WITH SK
ALTER TABLE Employees 
	ADD CONSTRAINT UNQEmployees UNIQUE (firstName, lastName, hireDate);

---RESTRICT#30
ALTER TABLE TrackingLog
	ADD CONSTRAINT CHKTrackNumLen CHECK (LEN(trackingNumber) BETWEEN 10 AND 32);

---RESTRICT#33
ALTER TABLE ShipmentBoxes
	ADD CONSTRAINT CHKBoxLen CHECK (LEN(boxID) BETWEEN 4 AND 16);

---RESTRICT#34
ALTER TABLE WishlistProducts
	ADD CONSTRAINT DEFWLProdQty DEFAULT 0 FOR desiredQuantity;

ALTER TABLE OrderProducts
	ADD CONSTRAINT DEFOrdProdQty DEFAULT 0 FOR quantity;

RETURN
GO

