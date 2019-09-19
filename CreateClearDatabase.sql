CREATE PROCEDURE HW3SolCreateDatabase
AS

EXEC HW3SolCreateTables;
EXEC HW3SolCreateRelationships;
EXEC HW3SolCreateConstraints;

RETURN
GO



CREATE PROCEDURE HW3SolClearDatabase
AS

EXEC HW3SolDropConstraints;
EXEC HW3SolDropRelationships;
EXEC HW3SolDropTables;

RETURN
GO


------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateDatabaseA
AS

EXEC HW3SolCreateTablesA;
EXEC HW3SolCreateRelationshipsA;
EXEC HW3SolCreateConstraintsA;

RETURN
GO


CREATE PROCEDURE HW3SolClearDatabaseA
AS

EXEC HW3SolDropConstraintsA;
EXEC HW3SolDropRelationshipsA;
EXEC HW3SolDropTablesA;

RETURN
GO


------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolCreateDatabaseB
AS

EXEC HW3SolCreateTablesB;
EXEC HW3SolCreateRelationshipsB;
EXEC HW3SolCreateConstraintsB;

RETURN
GO



CREATE PROCEDURE HW3SolClearDatabaseB
AS

EXEC HW3SolDropConstraintsB;
EXEC HW3SolDropRelationshipsB;
EXEC HW3SolDropTablesB;

RETURN
GO



------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolFullCreateDatabase
AS

EXEC HW3SolCreateTablesA;
EXEC HW3SolCreateTablesB;

EXEC HW3SolCreateRelationshipsA;
EXEC HW3SolCreateRelationshipsB;

---LINKING SECTION-A TO SECTION-B
ALTER TABLE StreamProfiles
	ADD CONSTRAINT FKStreamProfiles_Accounts FOREIGN KEY ( account ) REFERENCES Accounts ( accountID );

ALTER TABLE ProductPrices
	ADD CONSTRAINT FKProdPrices_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );

ALTER TABLE WishlistProducts
	ADD CONSTRAINT FKProdWishlists_Products FOREIGN KEY ( SKU ) REFERENCES Products ( SKU );


EXEC HW3SolCreateConstraintsA;
EXEC HW3SolCreateConstraintsB;

RETURN
GO


--------------------------------------------------------------------------------

CREATE PROCEDURE HW3SolFullClearDatabase
AS

EXEC HW3SolDropConstraintsA;
EXEC HW3SolDropConstraintsB;

---UNLINKING SECTION-A TO SECTION-B
ALTER TABLE StreamProfiles
	DROP CONSTRAINT FKStreamProfiles_Accounts;

ALTER TABLE ProductPrices
	DROP CONSTRAINT FKProdPrices_Products;

ALTER TABLE WishlistProducts
	DROP CONSTRAINT FKProdWishlists_Products;


EXEC HW3SolDropRelationshipsA;
EXEC HW3SolDropRelationshipsB;


EXEC HW3SolDropTablesA;
EXEC HW3SolDropTablesB;

RETURN
GO
