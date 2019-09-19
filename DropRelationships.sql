CREATE PROCEDURE HW3SolDropRelationships
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_ShipmentBoxes;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_ProdPrices;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_AcctAddresse;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_Offers;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_Orders;


ALTER TABLE Rentals
	DROP CONSTRAINT FKRentals_Orders;


---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE MediaListItems
	DROP CONSTRAINT FKMediaListItems_MediaLists;

ALTER TABLE MediaListItems
	DROP CONSTRAINT FKMediaListItems_StreamMedia;


ALTER TABLE Orders
	DROP CONSTRAINT FKOrders_AcctCards;

ALTER TABLE Orders
	DROP CONSTRAINT FKOrders_Offers;


ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_ShipmentBoxes;

ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_Carrier;

ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_Status;


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE AccountCards
	DROP CONSTRAINT FKCard_Addresses;


ALTER TABLE MediaGenres
	DROP CONSTRAINT FKMediaGenres_Genres;

ALTER TABLE MediaGenres
	DROP CONSTRAINT FKMediaGenres_StreamMedia;


ALTER TABLE MediaLists
	DROP CONSTRAINT FKMLists_Profiles;


ALTER TABLE MediaReviews
	DROP CONSTRAINT FKMediaReviews_Media;

ALTER TABLE MediaReviews
	DROP CONSTRAINT FKMediaReviews_Profiles;


ALTER TABLE MediaWatchLog
	DROP CONSTRAINT FKMWatchLog_Profiles;

ALTER TABLE MediaWatchLog
	DROP CONSTRAINT FKMWatchLog_StreamMedia;


ALTER TABLE ProductCategories
	DROP CONSTRAINT FKProdCat_Cate;

ALTER TABLE ProductCategories
	DROP CONSTRAINT FKProdCat_Products;


ALTER TABLE ShipmentBoxes
	DROP CONSTRAINT FKProductBox_Employees;


ALTER TABLE WishlistProducts
	DROP CONSTRAINT FKProdWishlists_Products;

ALTER TABLE WishlistProducts
	DROP CONSTRAINT FKProdWishlists_Wishlists;


---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE AccountAddresses
    DROP CONSTRAINT FKAcctAddresses_Accounts;


ALTER TABLE AccountDevices
    DROP CONSTRAINT FKAcctDevice_Accounts;

ALTER TABLE AccountDevices
	DROP CONSTRAINT FKAcctDevices_DevType;


ALTER TABLE AccountOffers
    DROP CONSTRAINT FKAccountsOffers_Accounts;

ALTER TABLE AccountOffers
	DROP CONSTRAINT FKAccountsOffers_Offers;


ALTER TABLE Categories
	DROP CONSTRAINT FKParentCat_Cate;


ALTER TABLE Employees
	DROP CONSTRAINT FKManager_Employee;


ALTER TABLE ProductPrices
	DROP CONSTRAINT FKProdPrices_Products;


ALTER TABLE ProductRentalRequirements
	DROP CONSTRAINT FKProdRentRequire_Products;

ALTER TABLE ProductRentalRequirements
	DROP CONSTRAINT FKProdRentRequire_RentRequire;


ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT FKProdStockTrans_Prods;

ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT FKProdStockTrans_StockType;


ALTER TABLE StreamingMedia
	DROP CONSTRAINT FKStreamMedia_Products;


ALTER TABLE StreamProfiles
	DROP CONSTRAINT FKStreamProfiles_Accounts;


ALTER TABLE VendorProducts
	DROP CONSTRAINT FKVendorProd_Prod;

ALTER TABLE VendorProducts
	DROP CONSTRAINT FKVendorProd_Vendors;


ALTER TABLE Wishlists
	DROP CONSTRAINT FKWishlists_Accounts;


RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolDropRelationshipsA
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
------NONE

---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE MediaListItems
	DROP CONSTRAINT FKMediaListItems_MediaLists;

ALTER TABLE MediaListItems
	DROP CONSTRAINT FKMediaListItems_StreamMedia;


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE MediaGenres
	DROP CONSTRAINT FKMediaGenres_Genres;

ALTER TABLE MediaGenres
	DROP CONSTRAINT FKMediaGenres_StreamMedia;


ALTER TABLE MediaLists
	DROP CONSTRAINT FKMLists_Profiles;


ALTER TABLE MediaReviews
	DROP CONSTRAINT FKMediaReviews_Media;

ALTER TABLE MediaReviews
	DROP CONSTRAINT FKMediaReviews_Profiles;


ALTER TABLE MediaWatchLog
	DROP CONSTRAINT FKMWatchLog_Profiles;

ALTER TABLE MediaWatchLog
	DROP CONSTRAINT FKMWatchLog_StreamMedia;


ALTER TABLE ProductCategories
	DROP CONSTRAINT FKProdCat_Cate;

ALTER TABLE ProductCategories
	DROP CONSTRAINT FKProdCat_Products;


---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE Categories
	DROP CONSTRAINT FKParentCat_Cate;


ALTER TABLE ProductRentalRequirements
	DROP CONSTRAINT FKProdRentRequire_Products;

ALTER TABLE ProductRentalRequirements
	DROP CONSTRAINT FKProdRentRequire_RentRequire;


ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT FKProdStockTrans_Prods;

ALTER TABLE ProductStockTransactions
	DROP CONSTRAINT FKProdStockTrans_StockType;


ALTER TABLE StreamingMedia
	DROP CONSTRAINT FKStreamMedia_Products;

/*---VALID IFF SECTION-B IS COMPLETE
ALTER TABLE StreamProfiles
	DROP CONSTRAINT FKStreamProfiles_Accounts;
---*/

ALTER TABLE VendorProducts
	DROP CONSTRAINT FKVendorProd_Prod;

ALTER TABLE VendorProducts
	DROP CONSTRAINT FKVendorProd_Vendors;


RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolDropRelationshipsB
AS

---------------------------------------------------------------------------------------------
---LEVEL-4
ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_ShipmentBoxes;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_ProdPrices;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_AcctAddresse;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_Offers;

ALTER TABLE OrderProducts
	DROP CONSTRAINT FKOrderProd_Orders;


ALTER TABLE Rentals
	DROP CONSTRAINT FKRentals_Orders;


---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE Orders
	DROP CONSTRAINT FKOrders_AcctCards;

ALTER TABLE Orders
	DROP CONSTRAINT FKOrders_Offers;


ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_ShipmentBoxes;

ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_Carrier;

ALTER TABLE TrackingLog
	DROP CONSTRAINT FKTrackingLog_Status;


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE AccountCards
	DROP CONSTRAINT FKCard_Addresses;


ALTER TABLE ShipmentBoxes
	DROP CONSTRAINT FKProductBox_Employees;


/*---VALID IFF SECTION-A IS COMPLETE
ALTER TABLE WishlistProducts
	DROP CONSTRAINT FKProdWishlists_Products;
---*/

ALTER TABLE WishlistProducts
	DROP CONSTRAINT FKProdWishlists_Wishlists;


---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE AccountAddresses
    DROP CONSTRAINT FKAcctAddresses_Accounts;


ALTER TABLE AccountDevices
    DROP CONSTRAINT FKAcctDevice_Accounts;

ALTER TABLE AccountDevices
	DROP CONSTRAINT FKAcctDevices_DevType;


ALTER TABLE AccountOffers
    DROP CONSTRAINT FKAccountsOffers_Accounts;

ALTER TABLE AccountOffers
	DROP CONSTRAINT FKAccountsOffers_Offers;


ALTER TABLE Employees
	DROP CONSTRAINT FKManager_Employee;


/*---VALID IFF SECTION-A IS COMPLETE
ALTER TABLE ProductPrices
	DROP CONSTRAINT FKProdPrices_Products;
---*/

ALTER TABLE Wishlists
	DROP CONSTRAINT FKWishlists_Accounts;


RETURN
GO
