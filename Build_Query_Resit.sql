/*

JOY AMBROSE | 103620582

SELECT name, database_id, create_date  
FROM sys.databases ;  


------- TASK 1 -------


ORGANISATION (OrgID, OrganisationName)
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

DROP TABLE IF EXISTS ORGANISATION;
GO
DROP TABLE IF EXISTS CLIENT;
GO
DROP TABLE IF EXISTS MENUITEM;
GO
DROP TABLE IF EXISTS [ORDER];
GO
DROP TABLE IF EXISTS ORDERLINE;
GO



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


INSERT INTO ORGANISATION (OrgID, OrganisationName) VALUES ('DODG', 'Dod & Gy Widget Importers');
INSERT INTO ORGANISATION (OrgID, OrganisationName) VALUES ('SWUT', 'Swinburne University of Technology');

INSERT INTO CLIENT (ClientID, Name, Phone, OrgID) VALUES (12, 'James Hallinan', '(03)5555-1234', 'SWUT');
INSERT INTO CLIENT (ClientID, Name, Phone, OrgID) VALUES (15, 'Any Nguyen', '(03)5555-2345', 'DODG');
INSERT INTO CLIENT (ClientID, Name, Phone, OrgID) VALUES (18, 'Karen Mok', '(03)5555-3456', 'SWUT');
INSERT INTO CLIENT (ClientID, Name, Phone, OrgID) VALUES (21, 'Tim Baird', '(03)5555-4567', 'DODG');
INSERT INTO CLIENT (ClientID, Name, Phone, OrgID) VALUES (33, 'Joy Ambrose', '103620582', 'JOYA');


INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (3214, 'Tropical Pizza - Large', 2, 16.00);
INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (3216, 'Tropical Pizza - Small', 1, 12.00);
INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (3218, 'Tropical Pizza - Family', 4, 23.00);
INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (4325, 'Can - Coke Zero', 1, 2.50);
INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (4326, 'Can - Lemonade', 1, 2.50);
INSERT INTO MENUITEM (ItemID, Desceription, ServesPerUnit, UnitPrice) VALUES (4327, 'Can - Harden Up', 1, 7.50);

INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (12, '2021-09-20', 'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (21, '2021-09-14', 'Room ATC009 - SUT - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (21, '2021-09-27', 'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (15,	'2021-09-20',	'The George - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (18,	'2021-09-30',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');

INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216, 12, '2021-09-20',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4326,	12,	'2021-09-20',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3218,	21,	'2021-09-14',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3214,	21,	'2021-09-14',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4325,	21,	'2021-09-14',	4);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	21,	'2021-09-14',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	21,	'2021-09-27',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	21,	'2021-09-27',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3218,	21,	'2021-09-27',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	15,	'2021-09-20',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4326,	15,	'2021-09-20',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	18,	'2021-09-30',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	18,	'2021-09-30',	1);



---- TASK 4 -----

SELECT OrganisationName
FROM ORGANISATION;

GO

SELECT Name
FROM CLIENT;

GO

SELECT OrderDate, DeliveryAddress
FROM [ORDER];

GO

SELECT Desceription
FROM MENUITEM;

GO

SELECT Qty
FROM ORDERLINE;

GO

SELECT OG.OrgID, M.Desceription, OL.Qty 
FROM [ORDER] O
INNER JOIN CLIENT C ON O.ClientID = C.ClientID
INNER JOIN ORGANISATION OG ON OG.OrgID = C.OrgID
INNER JOIN ORDERLINE OL ON O.ClientID = OL.ClientID AND O.OrderDate = OL.OrderDate
INNER JOIN MENUITEM M ON OL.ItemID = M.ItemID

