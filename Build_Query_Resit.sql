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

INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (12, '20/09/2021', 'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (21, '14/09/2021', 'Room ATC009 - SUT - 1 John Street, Hawthorn, 3122');
INSERT INTO [ORDER] (ClientID, OrderDate, DeliveryAddress) VALUES (21, '27/09/2021', 'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');

INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216, 12, '20/9/21',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4326,	12,	'20/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3218,	21,	'14/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3214,	21,	'14/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4325,	21,	'14/9/21',	4);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	21,	'14/9/21',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	21,	'27/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	21,	'27/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3218,	21,	'27/9/21',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	15,	'20/9/21',	2);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4326,	15,	'20/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (3216,	18,	'30/9/21',	1);
INSERT INTO ORDERLINE (ItemID, ClientID, OrderDate, Qty) VALUES (4327,	18,	'30/9/21',	1);
