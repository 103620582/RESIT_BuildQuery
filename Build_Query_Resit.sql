/*

JOY AMBROSE | 103620582

SELECT name, database_id, create_date  
FROM sys.databases ;  


------- TASK 1 -------


OGANISATION (OrgID, OrganisationName)
PK - (OrgID)

CLIENT (ClientID, Name, Phone, OrgID)
PK - (ClientID)
FK - (OrgID) References ORGANISATION

MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice)
PK - (ItemID)

ORDER (ClientID, OrderDate, DeliveryAddress)
PK - (ClientID, OrderDate)
FK - (ClientID) References CLIENT

ORDERLINE (ItemID, ClientID, OrderDate, Qty)
PK - (ItemID, ClientID, OrderDate)
FK - (ItemID) References MENUITEM
     (ClientID, OrderDate) References ORDER
    
*/

-- USE JAResit;

CREATE TABLE ORGANISATION (
    OrgID               NVARCHAR(4)
,   OrganisationName    NVARCHAR(200) NOT NULL
,   PRIMARY KEY (OrgID)
);

CREATE TABLE CLIENT (
    ClientID    INT
,   Name        NVARCHAR(100) NOT NULL
,   Phone       NVARCHAR(15) NOT NULL
,   OrgID       NVARCHAR(4)
,   PRIMARY KEY (ClientID)
);

CREATE TABLE MENUITEM (
    ItemID          INT
,   Desceription    NVARCHAR(100) NOT NULL
,   ServesPerUnit   INT NOT NULL
,   UnitPrice       MONEY NOT NULL
,   PRIMARY KEY (ItemID)
);

CREATE TABLE [ORDER] (
    ClientID        INT
,   OrderDate       DATE
,   DeliveryAddress NVARCHAR(MAX)
,   PRIMARY KEY (ClientID, OrderDate)
,   FOREIGN KEY (ClientID) REFERENCES CLIENT
);

CREATE TABLE ORDERLINE (
    ItemID          INT
,   ClientID        INT
,   OrderDate       DATE
,   Qty             INT
, PRIMARY KEY (ItemID, ClientID, OrderDate)
, FOREIGN KEY (ItemID) References MENUITEM
, FOREIGN KEY (ClientID, OrderDate) References [ORDER]
);

SELECT * FROM ORGANISATION;
GO
SELECT * FROM CLIENT;
GO
SELECT * FROM MENUITEM;
GO
SELECT * FROM [ORDER];
GO
SELECT * FROM ORDERLINE;
GO


