/*
HW3 Solutions, Spring 2019
*/

CREATE PROCEDURE HW3SolDropTables
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
DROP TABLE OrderProducts;
DROP TABLE Rentals;

---------------------------------------------------------------------------------------------
---LEVEL-3
DROP TABLE MediaListItems;
DROP TABLE Orders;
DROP TABLE TrackingLog;


---------------------------------------------------------------------------------------------
---LEVEL-2
DROP TABLE AccountCards;
DROP TABLE MediaGenres;
DROP TABLE MediaLists;
DROP TABLE MediaReviews;
DROP TABLE MediaWatchLog;
DROP TABLE ProductCategories;
DROP TABLE ShipmentBoxes;
DROP TABLE WishlistProducts;


---------------------------------------------------------------------------------------------
---LEVEL-1
DROP TABLE AccountAddresses;
DROP TABLE AccountDevices;
DROP TABLE AccountOffers;
DROP TABLE Categories;
DROP TABLE Employees;
DROP TABLE ProductPrices;
DROP TABLE ProductRentalRequirements;
DROP TABLE ProductStockTransactions;
DROP TABLE StreamingMedia;
DROP TABLE StreamProfiles;
DROP TABLE VendorProducts;
DROP TABLE Wishlists;


---------------------------------------------------------------------------------------------
---LEVEL-0
DROP TABLE Accounts;
DROP TABLE Carriers;
DROP TABLE DeviceTypes;
DROP TABLE Genres;
DROP TABLE Offers;
DROP TABLE Products;
DROP TABLE RentalRequirements;
DROP TABLE StatusCodes;
DROP TABLE StockingTypes;
DROP TABLE Vendors;


RETURN
GO

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


CREATE PROCEDURE HW3SolDropTablesA
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
------NONE

---------------------------------------------------------------------------------------------
---LEVEL-3
DROP TABLE MediaListItems;

---------------------------------------------------------------------------------------------
---LEVEL-2
DROP TABLE MediaGenres;
DROP TABLE MediaLists;
DROP TABLE MediaReviews;
DROP TABLE MediaWatchLog;
DROP TABLE ProductCategories;


---------------------------------------------------------------------------------------------
---LEVEL-1
DROP TABLE Categories;
DROP TABLE ProductRentalRequirements;
DROP TABLE ProductStockTransactions;
DROP TABLE StreamingMedia;
DROP TABLE StreamProfiles;
DROP TABLE VendorProducts;


---------------------------------------------------------------------------------------------
---LEVEL-0
DROP TABLE Genres;
DROP TABLE Products;
DROP TABLE RentalRequirements;
DROP TABLE StockingTypes;
DROP TABLE Vendors;

RETURN
GO

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolDropTablesB
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
DROP TABLE OrderProducts;
DROP TABLE Rentals;

---------------------------------------------------------------------------------------------
---LEVEL-3
DROP TABLE Orders;
DROP TABLE TrackingLog;


---------------------------------------------------------------------------------------------
---LEVEL-2
DROP TABLE AccountCards;
DROP TABLE ShipmentBoxes;
DROP TABLE WishlistProducts;


---------------------------------------------------------------------------------------------
---LEVEL-1
DROP TABLE AccountAddresses;
DROP TABLE AccountDevices;
DROP TABLE AccountOffers;
DROP TABLE Employees;
DROP TABLE ProductPrices;
DROP TABLE Wishlists;


---------------------------------------------------------------------------------------------
---LEVEL-0
DROP TABLE Accounts;
DROP TABLE Carriers;
DROP TABLE DeviceTypes;
DROP TABLE Offers;
DROP TABLE StatusCodes;

RETURN
GO
