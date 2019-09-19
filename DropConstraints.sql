CREATE PROCEDURE HW3SolDropConstraints
AS

---RESTRICT#2
ALTER TABLE Vendors
	DROP CONSTRAINT CHKPhoneVendor;

---RESTRICT#3
ALTER TABLE AccountAddresses
	DROP CONSTRAINT CHKZipAddresses;

---RESTRICT#5; CK ENFORCEMENT WITH SK
ALTER TABLE Accounts 
	DROP CONSTRAINT UNQAccounts;

---RESTRICT#9
ALTER TABLE ProductPrices
	DROP CONSTRAINT CHKPrice;

---RESTRICT#13
ALTER TABLE AccountAddresses
	DROP CONSTRAINT CHKAddrNum;

---RESTRICT#14
ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKMACChar;

ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKMACLen;

---RESTRICT#16
ALTER TABLE MediaReviews
	DROP CONSTRAINT CHKReviewRating;

ALTER TABLE Vendors
	DROP CONSTRAINT CHKVendorRating;

---RESTRICT#17
ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT CHKTransQty;

---RESTRICT#18; CK ENFORCEMENT WITH SK
ALTER TABLE AccountCards 
	DROP CONSTRAINT UNQAccountCards;

---RESTRICT#21
ALTER TABLE StreamingMedia
	DROP CONSTRAINT CHKMediaLen;

---RESTRICT#22
ALTER TABLE StreamingMedia
	DROP CONSTRAINT CHKMediaRating;

---RESTRICT#23
ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKSNLen;

---RESTRICT#26; CK ENFORCEMENT WITH SK
ALTER TABLE Orders 
	DROP CONSTRAINT UNQOrders;

---RESTRICT#29; CK ENFORCEMENT WITH SK
ALTER TABLE Employees 
	DROP CONSTRAINT UNQEmployees;

---RESTRICT#30
ALTER TABLE TrackingLog
	DROP CONSTRAINT CHKTrackNumLen;

---RESTRICT#31
ALTER TABLE StockingTypes
	DROP CONSTRAINT CHKStockType;

---RESTRICT#32
ALTER TABLE Categories
	DROP CONSTRAINT CHKCateID;

---RESTRICT#33
ALTER TABLE ShipmentBoxes
	DROP CONSTRAINT CHKBoxLen;

---RESTRICT#34
ALTER TABLE WishlistProducts
	DROP CONSTRAINT DEFWLProdQty;

ALTER TABLE OrderProducts
	DROP CONSTRAINT DEFOrdProdQty;

RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolDropConstraintsA
AS

---RESTRICT#2
ALTER TABLE Vendors
	DROP CONSTRAINT CHKPhoneVendor;

---RESTRICT#16
ALTER TABLE MediaReviews
	DROP CONSTRAINT CHKReviewRating;

ALTER TABLE Vendors
	DROP CONSTRAINT CHKVendorRating;

---RESTRICT#17
ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT CHKTransQty;

---RESTRICT#21
ALTER TABLE StreamingMedia
	DROP CONSTRAINT CHKMediaLen;

---RESTRICT#22
ALTER TABLE StreamingMedia
	DROP CONSTRAINT CHKMediaRating;

---RESTRICT#31
ALTER TABLE StockingTypes
	DROP CONSTRAINT CHKStockType;

---RESTRICT#32
ALTER TABLE Categories
	DROP CONSTRAINT CHKCateID;

RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolDropConstraintsB
AS

---RESTRICT#3
ALTER TABLE AccountAddresses
	DROP CONSTRAINT CHKZipAddresses;

---RESTRICT#5; CK ENFORCEMENT WITH SK
ALTER TABLE Accounts 
	DROP CONSTRAINT UNQAccounts;

---RESTRICT#9
ALTER TABLE ProductPrices
	DROP CONSTRAINT CHKPrice;

---RESTRICT#13
ALTER TABLE AccountAddresses
	DROP CONSTRAINT CHKAddrNum;

---RESTRICT#14
ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKMACChar;

ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKMACLen;

---RESTRICT#18; CK ENFORCEMENT WITH SK
ALTER TABLE AccountCards 
	DROP CONSTRAINT UNQAccountCards;

---RESTRICT#23
ALTER TABLE AccountDevices
	DROP CONSTRAINT CHKSNLen;

---RESTRICT#26; CK ENFORCEMENT WITH SK
ALTER TABLE Orders 
	DROP CONSTRAINT UNQOrders;

---RESTRICT#29; CK ENFORCEMENT WITH SK
ALTER TABLE Employees 
	DROP CONSTRAINT UNQEmployees;

---RESTRICT#30
ALTER TABLE TrackingLog
	DROP CONSTRAINT CHKTrackNumLen;

---RESTRICT#33
ALTER TABLE ShipmentBoxes
	DROP CONSTRAINT CHKBoxLen;

---RESTRICT#34
ALTER TABLE WishlistProducts
	DROP CONSTRAINT DEFWLProdQty;

ALTER TABLE OrderProducts
	DROP CONSTRAINT DEFOrdProdQty;

RETURN
GO