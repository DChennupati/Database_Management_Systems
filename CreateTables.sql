/*
HW3Sol Solutions, Spring 2019
*/

CREATE PROCEDURE HW3SolCreateTables
AS

---------------------------------------------------------------------------------------------
---LEVEL-0
CREATE TABLE Accounts
(
     accountID             int        NOT NULL		IDENTITY(110001, 1), 
     firstName             varchar(32)    NOT NULL, 
     lastName              varchar(32)    NOT NULL, 
     email                 varchar(128)   NOT NULL, 
     password              varchar(64)    NOT NULL, 
     creationDate          smalldatetime  NOT NULL, 
     subscriptionStartDate smalldatetime  NOT NULL,
     subscriptionEndDate   smalldatetime  NULL,

	 CONSTRAINT PKAccounts PRIMARY KEY (accountID)
);


CREATE TABLE Carriers
(
    carrierCode   varchar(4)	NOT NULL,
    carrierName   varchar(64)	NOT NULL,
    website       varchar(64)	NULL,

	CONSTRAINT PKCarriers PRIMARY KEY (carrierCode)
);


CREATE TABLE DeviceTypes
(
    typeCode          varchar(4)   NOT NULL,
    manufacturer      varchar(64)  NOT NULL,
    name              varchar(64)  NOT NULL,
    description       varchar(128) NOT NULL,
    licensedProduct   bit          NOT NULL,

	CONSTRAINT PKDeviceTypes PRIMARY KEY (typeCode)
);


CREATE TABLE Genres
(
    genreCode   char(2)     NOT NULL,
    genreName   varchar(64) NOT NULL,

	CONSTRAINT PKGenres PRIMARY KEY (genreCode)
);


CREATE TABLE Offers
(
    offerCode              varchar(32)      NOT NULL,
    description            varchar(128)     NOT NULL,
    amountDiscounted       smallmoney		NULL,
    percentageDiscounted   decimal(3,2)		NULL,
    offerStart             smalldatetime	NOT NULL,
    offerEnd               smalldatetime    NOT NULL,

	CONSTRAINT PKOffers PRIMARY KEY (offerCode)
);


CREATE TABLE Products
(
    SKU           varchar(64)   NOT NULL,
    name          varchar(64)   NOT NULL,
    description   varchar(256)  NOT NULL,
    itemWeight    numeric(6,2)	NULL,
    itemHeight    numeric(5,2)	NULL,
    itemWidth     numeric(5,2)	NULL,
    itemLength    numeric(5,2)	NULL,

	CONSTRAINT PKProducts PRIMARY KEY (SKU)
);


CREATE TABLE RentalRequirements
(
    requirementcode    char(2)     NOT NULL,
    description        varchar(64) NOT NULL,
    value              varchar(32) NOT NULL,

	CONSTRAINT PKRentalRequirements PRIMARY KEY (requirementCode)
);


CREATE TABLE StatusCodes
(
    statusCode          varchar(4)   NOT NULL,
    statusDescription   varchar(128) NOT NULL,

	CONSTRAINT PKStatusCodes PRIMARY KEY (statusCode)
);


CREATE TABLE StockingTypes
(
    typeCode          char(1)      NOT NULL,
    typeDescription   varchar(128) NOT NULL,

	CONSTRAINT PKStockingTypes PRIMARY KEY (typeCode)
);


CREATE TABLE Vendors
(
    vendorName         varchar(64)       NOT NULL,
    contactFirstName   varchar(32)       NOT NULL,
    contactLastName    varchar(32)       NOT NULL,
    contactEmail       varchar(128)      NOT NULL,
    contactPhone       varchar(10)       NOT NULL,
    accountAddedDate   smalldatetime     NOT NULL,
    suspensionDate     smalldatetime	 NULL,
    suspensionReason   varchar(1024)	 NULL,
    rating             tinyint			 NULL,

	CONSTRAINT PKVendors PRIMARY KEY (vendorName)
);

---------------------------------------------------------------------------------------------
---LEVEL-1
CREATE TABLE AccountAddresses
(
    account         int				NOT NULL,
    addressNumber   tinyint			NOT NULL,
    address1        varchar(128)	NOT NULL,
    address2        varchar(128)	NULL,
    city            varchar(64)		NOT NULL,
    state           char(2)			NOT NULL,
    zipCode         varchar(16)		NOT NULL,

	CONSTRAINT PKAccountAddresses PRIMARY KEY (account, addressNumber)
);


CREATE TABLE AccountDevices
(
    SN           varchar(32)	NOT NULL,
    MAC          varchar(12)	NOT NULL,
    name		 varchar(64)	NOT NULL,
    deviceType   varchar(4)		NOT NULL,
    account      int			NOT NULL,

	CONSTRAINT PKAccountDevices PRIMARY KEY (SN)
);


CREATE TABLE AccountOffers
(
    account     int       NOT NULL,
    offer       varchar(32)   NOT NULL,
    offerSent   smalldatetime NOT NULL,

	CONSTRAINT PKAccountOffers PRIMARY KEY (offer, account)
);


CREATE TABLE Categories
(
    categoryID       tinyint		NOT NULL,
    name             varchar(64)	NOT NULL,
    parentCategory   tinyint		NULL,

	CONSTRAINT PKCategories PRIMARY KEY (categoryID)

)


CREATE TABLE Employees
(
     employeeID smallint    NOT NULL	IDENTITY(5000,1), 
     firstName  varchar(32) NOT NULL, 
     lastName   varchar(32) NOT NULL, 
     hireDate   date        NOT NULL,
     termDate   date		NULL,
     managerID  smallint	NULL,

	CONSTRAINT PKEmployees PRIMARY KEY (EmployeeID)
);


CREATE TABLE ProductPrices
(
    SKU         varchar(64)     NOT NULL,
    startDate   date		    NOT NULL,
    endDate     date			NULL,
    price       smallmoney      NOT NULL,

	CONSTRAINT PKProductPrices PRIMARY KEY (SKU, startDate)
);


CREATE TABLE ProductRentalRequirements
(
    rentedProduct   varchar(64) NOT NULL,
    requirement     char(2)     NOT NULL,

	CONSTRAINT PKProductRentalRequirements PRIMARY KEY (rentedProduct, requirement)
);


CREATE TABLE ProductStockTransactions
(
    SKU                   varchar(64)   NOT NULL,
    stockingCode          char(1)       NOT NULL,
    transactionDate       smalldatetime NOT NULL,
    transactionQuantity   smallint      NOT NULL,

	CONSTRAINT PKProductStockTransactions PRIMARY KEY (SKU, stockingCode, transactionDate)
);


CREATE TABLE StreamingMedia
(
    mediaID       varchar(64)   NOT NULL,
    releaseDate   date          NOT NULL,
    length        smallint		NOT NULL,
    synopsis      varchar(512)	NULL,
    rating        varchar(8)	NULL,

	CONSTRAINT PKStreamingMedia PRIMARY KEY (mediaID)
);


CREATE TABLE StreamProfiles
(
    account               int			   NOT NULL,
    profileName           varchar(32)      NOT NULL,
    createDate            smalldatetime    NOT NULL,
    parentalRestriction   bit              NOT NULL,

	CONSTRAINT PKStreamProfiles PRIMARY KEY (account, profileName)
);


CREATE TABLE VendorProducts
(
    SKU            varchar(64)      NOT NULL,
    vendor         varchar(64)      NOT NULL,
    purchaseDate   smalldatetime    NOT NULL,
    quantity       smallint         NOT NULL,
    paidPrice      smallmoney		NULL,
    receivedDate   smalldatetime	NULL,

	CONSTRAINT PKVendorProducts PRIMARY KEY (SKU, vendor, purchaseDate)
);


CREATE TABLE Wishlists
(
    account        int			 NOT NULL,
    wishlistName   varchar(64)   NOT NULL,
    creationDate   smalldatetime NOT NULL,
    privateList    bit           NOT NULL,

	CONSTRAINT PKWishlists PRIMARY KEY (account, wishlistName)
);



---------------------------------------------------------------------------------------------
---LEVEL-2
CREATE TABLE AccountCards
( 
     cardID           int		  NOT NULL	IDENTITY(12000,1), 
     issuedName       varchar(64) NOT NULL, 
     creditCardNumber varchar(32) NOT NULL, 
     expireDate       date        NOT NULL, 
     CVV              varchar(4)  NOT NULL, 
     billingAccount   int     NOT NULL, 
     billingAddress   tinyint     NOT NULL,

	 CONSTRAINT PKAccountCards PRIMARY KEY (cardID)
);


CREATE TABLE MediaGenres
(
    media		varchar(64) NOT NULL,
    genreCode   char(2)     NOT NULL,

	CONSTRAINT PKMediaGenres PRIMARY KEY (media, genreCode)
);


CREATE TABLE MediaLists
(
    account     int				NOT NULL,
    profile     varchar(32)		NOT NULL,
    listName    varchar(32)		NOT NULL,
    dateAdded   smalldatetime	NOT NULL,

	CONSTRAINT PKMediaLists PRIMARY KEY (account, profile, listName)
);


CREATE TABLE MediaReviews
(
    account          int		   NOT NULL,
    profile          varchar(32)   NOT NULL,
    media            varchar(64)   NOT NULL,
    rating           tinyint       NOT NULL,
    ratingDate       smalldatetime NOT NULL,
    reviewComments   varchar(256)  NULL,

	CONSTRAINT PKMediaReviews PRIMARY KEY (account, profile, media)
);


CREATE TABLE MediaWatchLog
(
    account       int			 NOT NULL,
    profile       varchar(32)    NOT NULL,
    media         varchar(64)    NOT NULL,
    dateWatched   smalldatetime  NOT NULL,
    viewLength    decimal(5,2)   NOT NULL

	CONSTRAINT PKMediaWatchLog PRIMARY KEY (account, profile, media, dateWatched)
);


CREATE TABLE ProductCategories
(
    SKU        varchar(64) NOT NULL,
    category   tinyint     NOT NULL,

	CONSTRAINT PKProductCategories PRIMARY KEY (SKU, category)
);


CREATE TABLE ShipmentBoxes
(
    boxID       varchar(16)		NOT NULL,
    boxWeight   numeric(6,2)	NOT NULL,
    boxHeight   numeric(5,2)	NOT NULL,
    boxWidth    numeric(5,2)	NOT NULL,
    boxLength   numeric(5,2)	NOT NULL,
    packager    smallint		NOT NULL,
    shipDate    smalldatetime	NULL,

	CONSTRAINT PKShipmentBoxes PRIMARY KEY (boxID)
);


CREATE TABLE WishlistProducts
(
    account           int		  NOT NULL,
    wishlistName      varchar(64) NOT NULL,
    SKU               varchar(64) NOT NULL,
    desiredQuantity   smallint    NOT NULL,

	CONSTRAINT PKWishlistProducts PRIMARY KEY (wishlistName, account, SKU)
);


---------------------------------------------------------------------------------------------
---LEVEL-3
CREATE TABLE MediaListItems
(
    account          int			NOT NULL,
    profile          varchar(32)	NOT NULL,
    listName         varchar(32)	NOT NULL,
    media            varchar(64)	NOT NULL,
    dateLastPlayed   smalldatetime	NULL,

	CONSTRAINT PKMediaListItems PRIMARY KEY (account, profile, listName, media)
);


CREATE TABLE Orders
(
     orderNumber int			NOT NULL	IDENTITY(100001, 1), 
     orderDate   smalldatetime	NOT NULL, 
     card        int			NOT NULL, 
     orderOffer  varchar(32)	NULL, 
     rentalOrder bit			NOT NULL,

	CONSTRAINT PKOrders PRIMARY KEY (OrderNumber)
);


CREATE TABLE TrackingLog
(
    trackingNumber   varchar(36)   NOT NULL,
    logDateTime      smalldatetime NOT NULL,
    currentCity      varchar(64)   NOT NULL,
    currentState     char(2)       NOT NULL,
    box              varchar(16)   NOT NULL,
    carrier          varchar(4)    NOT NULL,
    status           varchar(4)    NOT NULL,

	CONSTRAINT PKTrackingLog PRIMARY KEY (trackingNumber, logDateTime)
);


---------------------------------------------------------------------------------------------
---LEVEL-4
CREATE TABLE OrderProducts
(
    orderNumber       int			NOT NULL,
    SKU               varchar(64)   NOT NULL,
    priceStartDate    date			NOT NULL,
    quantity          smallint      NOT NULL,
    account           int			NOT NULL,
    shippingAddress   tinyint       NOT NULL,
    box               varchar(16)	NULL,
    productOffer      varchar(32)	NULL,

	CONSTRAINT PKOrderProducts PRIMARY KEY (orderNumber, SKU, priceStartDate)
);


CREATE TABLE Rentals
(
    orderNumber        int		NOT NULL,
    expectedDueDate    datetime NOT NULL,
    actualReturnDate   datetime NOT NULL,

	CONSTRAINT PKRentals PRIMARY KEY (orderNumber)
);

RETURN
GO



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


CREATE PROCEDURE HW3SolCreateTablesA
AS

---------------------------------------------------------------------------------------------
---LEVEL-0
CREATE TABLE Genres
(
    genreCode   char(2)     NOT NULL,
    genreName   varchar(64) NOT NULL,

	CONSTRAINT PKGenres PRIMARY KEY (genreCode)
);


CREATE TABLE Products
(
    SKU           varchar(64)   NOT NULL,
    name          varchar(64)   NOT NULL,
    description   varchar(256)  NOT NULL,
    itemWeight    numeric(6,2)	NULL,
    itemHeight    numeric(5,2)	NULL,
    itemWidth     numeric(5,2)	NULL,
    itemLength    numeric(5,2)	NULL,

	CONSTRAINT PKProducts PRIMARY KEY (SKU)
);


CREATE TABLE RentalRequirements
(
    requirementcode    char(2)     NOT NULL,
    description        varchar(64) NOT NULL,
    value              varchar(32) NOT NULL,

	CONSTRAINT PKRentalRequirements PRIMARY KEY (requirementCode)
);


CREATE TABLE StockingTypes
(
    typeCode          char(1)      NOT NULL,
    typeDescription   varchar(128) NOT NULL,

	CONSTRAINT PKStockingTypes PRIMARY KEY (typeCode)
);


CREATE TABLE Vendors
(
    vendorName         varchar(64)       NOT NULL,
    contactFirstName   varchar(32)       NOT NULL,
    contactLastName    varchar(32)       NOT NULL,
    contactEmail       varchar(128)      NOT NULL,
    contactPhone       varchar(10)       NOT NULL,
    accountAddedDate   smalldatetime     NOT NULL,
    suspensionDate     smalldatetime	 NULL,
    suspensionReason   varchar(1024)	 NULL,
    rating             tinyint			 NULL,

	CONSTRAINT PKVendors PRIMARY KEY (vendorName)
);


---------------------------------------------------------------------------------------------
---LEVEL-1
CREATE TABLE Categories
(
    categoryID       tinyint		NOT NULL,
    name             varchar(64)	NOT NULL,
    parentCategory   tinyint		NULL,

	CONSTRAINT PKCategories PRIMARY KEY (categoryID)

)


CREATE TABLE ProductRentalRequirements
(
    rentedProduct   varchar(64) NOT NULL,
    requirement     char(2)     NOT NULL,

	CONSTRAINT PKProductRentalRequirements PRIMARY KEY (rentedProduct, requirement)
);


CREATE TABLE ProductStockTransactions
(
    SKU                   varchar(64)   NOT NULL,
    stockingCode          char(1)       NOT NULL,
    transactionDate       smalldatetime NOT NULL,
    transactionQuantity   smallint      NOT NULL,

	CONSTRAINT PKProductStockTransactions PRIMARY KEY (SKU, stockingCode, transactionDate)
);


CREATE TABLE StreamingMedia
(
    mediaID       varchar(64)   NOT NULL,
    releaseDate   date          NOT NULL,
    length        smallint		NOT NULL,
    synopsis      varchar(512)	NULL,
    rating        varchar(8)	NULL,

	CONSTRAINT PKStreamingMedia PRIMARY KEY (mediaID)
);


CREATE TABLE StreamProfiles
(
    account               int			   NOT NULL,
    profileName           varchar(32)      NOT NULL,
    createDate            smalldatetime    NOT NULL,
    parentalRestriction   bit              NOT NULL,

	CONSTRAINT PKStreamProfiles PRIMARY KEY (account, profileName)
);


CREATE TABLE VendorProducts
(
    SKU            varchar(64)      NOT NULL,
    vendor         varchar(64)      NOT NULL,
    purchaseDate   smalldatetime    NOT NULL,
    quantity       smallint         NOT NULL,
    paidPrice      smallmoney		NULL,
    receivedDate   smalldatetime	NULL,

	CONSTRAINT PKVendorProducts PRIMARY KEY (SKU, vendor, purchaseDate)
);



---------------------------------------------------------------------------------------------
---LEVEL-2
CREATE TABLE MediaGenres
(
    media		varchar(64) NOT NULL,
    genreCode   char(2)     NOT NULL,

	CONSTRAINT PKMediaGenres PRIMARY KEY (media, genreCode)
);


CREATE TABLE MediaLists
(
    account     int				NOT NULL,
    profile     varchar(32)		NOT NULL,
    listName    varchar(32)		NOT NULL,
    dateAdded   smalldatetime	NOT NULL,

	CONSTRAINT PKMediaLists PRIMARY KEY (account, profile, listName)
);


CREATE TABLE MediaReviews
(
    account          int		   NOT NULL,
    profile          varchar(32)   NOT NULL,
    media            varchar(64)   NOT NULL,
    rating           tinyint       NOT NULL,
    ratingDate       smalldatetime NOT NULL,
    reviewComments   varchar(256)  NULL,

	CONSTRAINT PKMediaReviews PRIMARY KEY (account, profile, media)
);


CREATE TABLE MediaWatchLog
(
    account       int			 NOT NULL,
    profile       varchar(32)    NOT NULL,
    media         varchar(64)    NOT NULL,
    dateWatched   smalldatetime  NOT NULL,
    viewLength    decimal(5,2)   NOT NULL

	CONSTRAINT PKMediaWatchLog PRIMARY KEY (account, profile, media, dateWatched)
);


CREATE TABLE ProductCategories
(
    SKU        varchar(64) NOT NULL,
    category   tinyint     NOT NULL,

	CONSTRAINT PKProductCategories PRIMARY KEY (SKU, category)
);


---------------------------------------------------------------------------------------------
---LEVEL-3
CREATE TABLE MediaListItems
(
    account          int			NOT NULL,
    profile          varchar(32)	NOT NULL,
    listName         varchar(32)	NOT NULL,
    media            varchar(64)	NOT NULL,
    dateLastPlayed   smalldatetime	NULL,

	CONSTRAINT PKMediaListItems PRIMARY KEY (account, profile, listName, media)
);


---------------------------------------------------------------------------------------------
---LEVEL-4
------NONE


RETURN
GO



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateTablesB
AS

---------------------------------------------------------------------------------------------
---LEVEL-0
CREATE TABLE Accounts
(
     accountID             int        NOT NULL		IDENTITY(110001, 1), 
     firstName             varchar(32)    NOT NULL, 
     lastName              varchar(32)    NOT NULL, 
     email                 varchar(128)   NOT NULL, 
     password              varchar(64)    NOT NULL, 
     creationDate          smalldatetime  NOT NULL, 
     subscriptionStartDate smalldatetime  NOT NULL,
     subscriptionEndDate   smalldatetime  NULL,

	 CONSTRAINT PKAccounts PRIMARY KEY (accountID)
);


CREATE TABLE Carriers
(
    carrierCode   varchar(4)	NOT NULL,
    carrierName   varchar(64)	NOT NULL,
    website       varchar(64)	NULL,

	CONSTRAINT PKCarriers PRIMARY KEY (carrierCode)
);


CREATE TABLE DeviceTypes
(
    typeCode          varchar(4)   NOT NULL,
    manufacturer      varchar(64)  NOT NULL,
    name              varchar(64)  NOT NULL,
    description       varchar(128) NOT NULL,
    licensedProduct   bit          NOT NULL,

	CONSTRAINT PKDeviceTypes PRIMARY KEY (typeCode)
);


CREATE TABLE Offers
(
    offerCode              varchar(32)      NOT NULL,
    description            varchar(128)     NOT NULL,
    amountDiscounted       smallmoney		NULL,
    percentageDiscounted   decimal(3,2)		NULL,
    offerStart             smalldatetime	NOT NULL,
    offerEnd               smalldatetime    NOT NULL,

	CONSTRAINT PKOffers PRIMARY KEY (offerCode)
);


CREATE TABLE StatusCodes
(
    statusCode          varchar(4)   NOT NULL,
    statusDescription   varchar(128) NOT NULL,

	CONSTRAINT PKStatusCodes PRIMARY KEY (statusCode)
);


---------------------------------------------------------------------------------------------
---LEVEL-1
CREATE TABLE AccountAddresses
(
    account         int				NOT NULL,
    addressNumber   tinyint			NOT NULL,
    address1        varchar(128)	NOT NULL,
    address2        varchar(128)	NULL,
    city            varchar(64)		NOT NULL,
    state           char(2)			NOT NULL,
    zipCode         varchar(16)		NOT NULL,

	CONSTRAINT PKAccountAddresses PRIMARY KEY (account, addressNumber)
);


CREATE TABLE AccountDevices
(
    SN           varchar(32)	NOT NULL,
    MAC          varchar(12)	NOT NULL,
    name		 varchar(64)	NOT NULL,
    deviceType   varchar(4)		NOT NULL,
    account      int			NOT NULL,

	CONSTRAINT PKAccountDevices PRIMARY KEY (SN)
);


CREATE TABLE AccountOffers
(
    account     int       NOT NULL,
    offer       varchar(32)   NOT NULL,
    offerSent   smalldatetime NOT NULL,

	CONSTRAINT PKAccountOffers PRIMARY KEY (offer, account)
);


CREATE TABLE Employees
(
     employeeID smallint    NOT NULL	IDENTITY(5000,1), 
     firstName  varchar(32) NOT NULL, 
     lastName   varchar(32) NOT NULL, 
     hireDate   date        NOT NULL,
     termDate   date		NULL,
     managerID  smallint	NULL,

	CONSTRAINT PKEmployees PRIMARY KEY (EmployeeID)
);


CREATE TABLE ProductPrices
(
    SKU         varchar(64)     NOT NULL,
    startDate   date		    NOT NULL,
    endDate     date			NULL,
    price       smallmoney      NOT NULL,

	CONSTRAINT PKProductPrices PRIMARY KEY (SKU, startDate)
);


CREATE TABLE Wishlists
(
    account        int			 NOT NULL,
    wishlistName   varchar(64)   NOT NULL,
    creationDate   smalldatetime NOT NULL,
    privateList    bit           NOT NULL,

	CONSTRAINT PKWishlists PRIMARY KEY (account, wishlistName)
);



---------------------------------------------------------------------------------------------
---LEVEL-2
CREATE TABLE AccountCards
( 
     cardID           int		  NOT NULL	IDENTITY(12000,1), 
     issuedName       varchar(64) NOT NULL, 
     creditCardNumber varchar(32) NOT NULL, 
     expireDate       date        NOT NULL, 
     CVV              varchar(4)  NOT NULL, 
     billingAccount   int     NOT NULL, 
     billingAddress   tinyint     NOT NULL,

	 CONSTRAINT PKAccountCards PRIMARY KEY (cardID)
);


CREATE TABLE ShipmentBoxes
(
    boxID       varchar(16)		NOT NULL,
    boxWeight   numeric(6,2)	NOT NULL,
    boxHeight   numeric(5,2)	NOT NULL,
    boxWidth    numeric(5,2)	NOT NULL,
    boxLength   numeric(5,2)	NOT NULL,
    packager    smallint		NOT NULL,
    shipDate    smalldatetime	NULL,

	CONSTRAINT PKShipmentBoxes PRIMARY KEY (boxID)
);


CREATE TABLE WishlistProducts
(
    account           int		  NOT NULL,
    wishlistName      varchar(64) NOT NULL,
    SKU               varchar(64) NOT NULL,
    desiredQuantity   smallint    NOT NULL,

	CONSTRAINT PKWishlistProducts PRIMARY KEY (wishlistName, account, SKU)
);


---------------------------------------------------------------------------------------------
---LEVEL-3
CREATE TABLE Orders
(
     orderNumber int			NOT NULL	IDENTITY(100001, 1), 
     orderDate   smalldatetime	NOT NULL, 
     card        int			NOT NULL, 
     orderOffer  varchar(32)	NULL, 
     rentalOrder bit			NOT NULL,

	CONSTRAINT PKOrders PRIMARY KEY (OrderNumber)
);


CREATE TABLE TrackingLog
(
    trackingNumber   varchar(36)   NOT NULL,
    logDateTime      smalldatetime NOT NULL,
    currentCity      varchar(64)   NOT NULL,
    currentState     char(2)       NOT NULL,
    box              varchar(16)   NOT NULL,
    carrier          varchar(4)    NOT NULL,
    status           varchar(4)    NOT NULL,

	CONSTRAINT PKTrackingLog PRIMARY KEY (trackingNumber, logDateTime)
);


---------------------------------------------------------------------------------------------
---LEVEL-4
CREATE TABLE OrderProducts
(
    orderNumber       int			NOT NULL,
    SKU               varchar(64)   NOT NULL,
    priceStartDate    date			NOT NULL,
    quantity          smallint      NOT NULL,
    account           int			NOT NULL,
    shippingAddress   tinyint       NOT NULL,
    box               varchar(16)	NULL,
    productOffer      varchar(32)	NULL,

	CONSTRAINT PKOrderProducts PRIMARY KEY (orderNumber, SKU, priceStartDate)
);


CREATE TABLE Rentals
(
    orderNumber        int		NOT NULL,
    expectedDueDate    datetime NOT NULL,
    actualReturnDate   datetime NOT NULL,

	CONSTRAINT PKRentals PRIMARY KEY (orderNumber)
);


RETURN
GO
