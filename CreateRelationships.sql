CREATE PROCEDURE HW3SolCreateRelationships
AS

---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE AccountAddresses
    ADD CONSTRAINT FKAcctAddresses_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID )


ALTER TABLE AccountDevices
    ADD CONSTRAINT FKAcctDevice_Accounts FOREIGN KEY ( Account ) REFERENCES Accounts ( AccountID )

ALTER TABLE AccountDevices
	ADD CONSTRAINT FKAcctDevices_DevType FOREIGN KEY ( deviceType ) REFERENCES DeviceTypes ( typeCode );


ALTER TABLE AccountOffers
    ADD CONSTRAINT FKAccountsOffers_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID )

ALTER TABLE AccountOffers
	ADD CONSTRAINT FKAccountsOffers_Offers FOREIGN KEY ( offer ) REFERENCES Offers ( offerCode )


ALTER TABLE Categories
	ADD CONSTRAINT FKParentCat_Cate FOREIGN KEY ( parentCategory ) REFERENCES Categories ( categoryID );


ALTER TABLE Employees
	ADD CONSTRAINT FKManager_Employee FOREIGN KEY ( managerID ) REFERENCES Employees ( employeeID );


ALTER TABLE ProductPrices
	ADD CONSTRAINT FKProdPrices_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );


ALTER TABLE ProductRentalRequirements
	ADD CONSTRAINT FKProdRentRequire_Products FOREIGN KEY ( rentedProduct ) REFERENCES Products ( SKU );

ALTER TABLE ProductRentalRequirements
	ADD CONSTRAINT FKProdRentRequire_RentRequire FOREIGN KEY ( requirement ) REFERENCES RentalRequirements ( requirementCode );


ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT FKProdStockTrans_Prods FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT FKProdStockTrans_StockType FOREIGN KEY ( stockingCode ) REFERENCES StockingTypes ( typeCode );


ALTER TABLE StreamingMedia
	ADD CONSTRAINT FKStreamMedia_Products FOREIGN KEY ( mediaID ) REFERENCES Products ( SKU );


ALTER TABLE StreamProfiles
	ADD CONSTRAINT FKStreamProfiles_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID );


ALTER TABLE VendorProducts
	ADD CONSTRAINT FKVendorProd_Prod FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE VendorProducts
	ADD CONSTRAINT FKVendorProd_Vendors FOREIGN KEY ( vendor ) REFERENCES Vendors ( vendorName );


ALTER TABLE Wishlists
	ADD CONSTRAINT FKWishlists_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID );


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE AccountCards
	ADD CONSTRAINT FKCard_Addresses FOREIGN KEY ( billingAccount, billingAddress ) REFERENCES AccountAddresses ( account, addressNumber );


ALTER TABLE MediaGenres
	ADD CONSTRAINT FKMediaGenres_Genres FOREIGN KEY ( genreCode ) REFERENCES Genres ( genreCode );

ALTER TABLE MediaGenres
	ADD CONSTRAINT FKMediaGenres_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


ALTER TABLE MediaLists
	ADD CONSTRAINT FKMLists_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );


ALTER TABLE MediaReviews
	ADD CONSTRAINT FKMediaReviews_Media FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );

ALTER TABLE MediaReviews
	ADD CONSTRAINT FKMediaReviews_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );


ALTER TABLE MediaWatchLog
	ADD CONSTRAINT FKMWatchLog_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );

ALTER TABLE MediaWatchLog
	ADD CONSTRAINT FKMWatchLog_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


ALTER TABLE ProductCategories
	ADD CONSTRAINT FKProdCat_Cate FOREIGN KEY ( category ) REFERENCES Categories ( categoryID );

ALTER TABLE ProductCategories
	ADD CONSTRAINT FKProdCat_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );


ALTER TABLE ShipmentBoxes
	ADD CONSTRAINT FKProductBox_Employees FOREIGN KEY ( packager ) REFERENCES Employees ( employeeID );


ALTER TABLE WishlistProducts
	ADD CONSTRAINT FKProdWishlists_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE WishlistProducts
	ADD CONSTRAINT FKProdWishlists_Wishlists FOREIGN KEY ( account, wishlistName ) REFERENCES Wishlists ( account, wishlistName );


---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE MediaListItems
	ADD CONSTRAINT FKMediaListItems_MediaLists FOREIGN KEY ( account, profile, listName ) REFERENCES MediaLists ( account, profile, listName );

ALTER TABLE MediaListItems
	ADD CONSTRAINT FKMediaListItems_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


ALTER TABLE Orders
	ADD CONSTRAINT FKOrders_AcctCards FOREIGN KEY ( card ) REFERENCES AccountCards ( cardID );

ALTER TABLE Orders
	ADD CONSTRAINT FKOrders_Offers FOREIGN KEY ( orderOffer ) REFERENCES Offers ( offerCode );


ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_ShipmentBoxes FOREIGN KEY ( box ) REFERENCES ShipmentBoxes ( boxID );

ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_Carrier FOREIGN KEY ( carrier ) REFERENCES Carriers ( carrierCode );

ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_Status FOREIGN KEY ( status ) REFERENCES StatusCodes ( statusCode );


---------------------------------------------------------------------------------------------
---LEVEL-4
ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_ShipmentBoxes FOREIGN KEY ( box ) REFERENCES ShipmentBoxes ( boxID );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_ProdPrices FOREIGN KEY ( SKU, priceStartDate ) REFERENCES ProductPrices ( SKU, startDate );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_AcctAddresse FOREIGN KEY ( account, shippingAddress ) REFERENCES AccountAddresses ( account, addressNumber );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_Offers FOREIGN KEY ( productOffer ) REFERENCES Offers ( offerCode );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_Orders FOREIGN KEY ( orderNumber ) REFERENCES Orders ( orderNumber );


ALTER TABLE Rentals
	ADD CONSTRAINT FKRentals_Orders FOREIGN KEY ( orderNumber ) REFERENCES Orders ( orderNumber );


RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateRelationshipsA
AS

---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE Categories
	ADD CONSTRAINT FKParentCat_Cate FOREIGN KEY ( parentCategory ) REFERENCES Categories ( categoryID );


ALTER TABLE ProductRentalRequirements
	ADD CONSTRAINT FKProdRentRequire_Products FOREIGN KEY ( rentedProduct ) REFERENCES Products ( SKU );

ALTER TABLE ProductRentalRequirements
	ADD CONSTRAINT FKProdRentRequire_RentRequire FOREIGN KEY ( requirement ) REFERENCES RentalRequirements ( requirementCode );


ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT FKProdStockTrans_Prods FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE ProductStockTransactions
	ADD CONSTRAINT FKProdStockTrans_StockType FOREIGN KEY ( stockingCode ) REFERENCES StockingTypes ( typeCode );


ALTER TABLE StreamingMedia
	ADD CONSTRAINT FKStreamMedia_Products FOREIGN KEY ( mediaID ) REFERENCES Products ( SKU );


/*---VALID IFF SECTION-B IS COMPLETE
ALTER TABLE StreamProfiles
	ADD CONSTRAINT FKStreamProfiles_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID );
---*/

ALTER TABLE VendorProducts
	ADD CONSTRAINT FKVendorProd_Prod FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE VendorProducts
	ADD CONSTRAINT FKVendorProd_Vendors FOREIGN KEY ( vendor ) REFERENCES Vendors ( vendorName );


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE MediaGenres
	ADD CONSTRAINT FKMediaGenres_Genres FOREIGN KEY ( genreCode ) REFERENCES Genres ( genreCode );

ALTER TABLE MediaGenres
	ADD CONSTRAINT FKMediaGenres_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


ALTER TABLE MediaLists
	ADD CONSTRAINT FKMLists_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );


ALTER TABLE MediaReviews
	ADD CONSTRAINT FKMediaReviews_Media FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );

ALTER TABLE MediaReviews
	ADD CONSTRAINT FKMediaReviews_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );


ALTER TABLE MediaWatchLog
	ADD CONSTRAINT FKMWatchLog_Profiles FOREIGN KEY ( account, profile ) REFERENCES StreamProfiles ( account, profileName );

ALTER TABLE MediaWatchLog
	ADD CONSTRAINT FKMWatchLog_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


ALTER TABLE ProductCategories
	ADD CONSTRAINT FKProdCat_Cate FOREIGN KEY ( category ) REFERENCES Categories ( categoryID );

ALTER TABLE ProductCategories
	ADD CONSTRAINT FKProdCat_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );


---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE MediaListItems
	ADD CONSTRAINT FKMediaListItems_MediaLists FOREIGN KEY ( account, profile, listName ) REFERENCES MediaLists ( account, profile, listName );

ALTER TABLE MediaListItems
	ADD CONSTRAINT FKMediaListItems_StreamMedia FOREIGN KEY ( media ) REFERENCES StreamingMedia ( mediaID );


---------------------------------------------------------------------------------------------
---LEVEL-4
------NONE

RETURN
GO


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateRelationshipsB
AS

---------------------------------------------------------------------------------------------
---LEVEL-1
ALTER TABLE AccountAddresses
    ADD CONSTRAINT FKAcctAddresses_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID )


ALTER TABLE AccountDevices
    ADD CONSTRAINT FKAcctDevice_Accounts FOREIGN KEY ( Account ) REFERENCES Accounts ( AccountID )

ALTER TABLE AccountDevices
	ADD CONSTRAINT FKAcctDevices_DevType FOREIGN KEY ( deviceType ) REFERENCES DeviceTypes ( typeCode );


ALTER TABLE AccountOffers
    ADD CONSTRAINT FKAccountsOffers_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID )

ALTER TABLE AccountOffers
	ADD CONSTRAINT FKAccountsOffers_Offers FOREIGN KEY ( offer ) REFERENCES Offers ( offerCode )


ALTER TABLE Employees
	ADD CONSTRAINT FKManager_Employee FOREIGN KEY ( managerID ) REFERENCES Employees ( employeeID );

/*---VALID IFF SECTION-A IS COMPLETE
ALTER TABLE ProductPrices
	ADD CONSTRAINT FKProdPrices_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );
---*/


ALTER TABLE Wishlists
	ADD CONSTRAINT FKWishlists_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID );


---------------------------------------------------------------------------------------------
---LEVEL-2
ALTER TABLE AccountCards
	ADD CONSTRAINT FKCard_Addresses FOREIGN KEY ( billingAccount, billingAddress ) REFERENCES AccountAddresses ( account, addressNumber );


ALTER TABLE ShipmentBoxes
	ADD CONSTRAINT FKProductBox_Employees FOREIGN KEY ( packager ) REFERENCES Employees ( employeeID );


/*---VALID IFF SECTION-A IS COMPLETE
ALTER TABLE WishlistProducts
	ADD CONSTRAINT FKProdWishlists_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );
---*/

ALTER TABLE WishlistProducts
	ADD CONSTRAINT FKProdWishlists_Wishlists FOREIGN KEY ( account, wishlistName ) REFERENCES Wishlists ( account, wishlistName );


---------------------------------------------------------------------------------------------
---LEVEL-3
ALTER TABLE Orders
	ADD CONSTRAINT FKOrders_AcctCards FOREIGN KEY ( card ) REFERENCES AccountCards ( cardID );

ALTER TABLE Orders
	ADD CONSTRAINT FKOrders_Offers FOREIGN KEY ( orderOffer ) REFERENCES Offers ( offerCode );


ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_ShipmentBoxes FOREIGN KEY ( box ) REFERENCES ShipmentBoxes ( boxID );

ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_Carrier FOREIGN KEY ( carrier ) REFERENCES Carriers ( carrierCode );

ALTER TABLE TrackingLog
	ADD CONSTRAINT FKTrackingLog_Status FOREIGN KEY ( status ) REFERENCES StatusCodes ( statusCode );


---------------------------------------------------------------------------------------------
---LEVEL-4
ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_ShipmentBoxes FOREIGN KEY ( box ) REFERENCES ShipmentBoxes ( boxID );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_ProdPrices FOREIGN KEY ( SKU, priceStartDate ) REFERENCES ProductPrices ( SKU, startDate );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_AcctAddresse FOREIGN KEY ( account, shippingAddress ) REFERENCES AccountAddresses ( account, addressNumber );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_Offers FOREIGN KEY ( productOffer ) REFERENCES Offers ( offerCode );

ALTER TABLE OrderProducts
	ADD CONSTRAINT FKOrderProd_Orders FOREIGN KEY ( orderNumber ) REFERENCES Orders ( orderNumber );


ALTER TABLE Rentals
	ADD CONSTRAINT FKRentals_Orders FOREIGN KEY ( orderNumber ) REFERENCES Orders ( orderNumber );


RETURN
GO
