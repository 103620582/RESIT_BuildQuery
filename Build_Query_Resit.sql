/*

JOY AMBROSE | 103620582

SELECT name, database_id, create_date  
FROM sys.databases ;  
USE JAResit;


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
    
