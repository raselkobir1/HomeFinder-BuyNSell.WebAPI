﻿DECLARE @UserID as INT
--------------------------
-- Create User -: UserName: Demo Password: pass@123
--------------------------
IF not exists (select Id from Users where Username='Demo')
insert into Users(Username,Password, PasswordKey,LastUpdatedOn,LastUpdatedBy)
select 'Demo',
0x02E64CF1E1A98D1CE3324A7C9C547E91B7F7EA8A2A9519BFE7FF36F70F49236180BC5867A8FD6E052BF69535E2392AEB67EDC004B908CAE82634E0A14727E709,
0x35637FBA591280EFECA1224DCA364D880C326A2D71C3B9A78115E87EB1C164857E1DEFC74E25E179D0947670E96CAF6FD8D0303F5646DD548745AF792439A1D4CB3327591309AF490E165BE371FAB079D8CF80F176B8D27FAEC4539CE74299F2C622B2D0D6A0193A7961EFF18E1171C732D14379E88CA8C23DA0B73EF27D94E9,
getdate(),
0

SET @UserID = (select id from Users where Username='Demo')

--------------------------
-- Seed Property Types
--------------------------
IF not exists (select name from PropertyTypes where Name='House')
insert into PropertyTypes(Name,LastUpdatedOn,LastUpdatedBy)
select 'House', GETDATE(),@UserID

IF not exists (select name from PropertyTypes where Name='Apartment')
insert into PropertyTypes(Name,LastUpdatedOn,LastUpdatedBy)
select 'Apartment', GETDATE(),@UserID
	
IF not exists (select name from PropertyTypes where Name='Duplex')
insert into PropertyTypes(Name,LastUpdatedOn,LastUpdatedBy)
select 'Duplex', GETDATE(),@UserID


--------------------------
-- Seed Furnishing Types
--------------------------
IF not exists (select name from FurnishingTypes where Name='Fully')
insert into FurnishingTypes(Name, LastUpdatedOn, LastUpdatedBy)
select 'Fully', GETDATE(),@UserID
	
IF not exists (select name from FurnishingTypes where Name='Semi')
insert into FurnishingTypes(Name, LastUpdatedOn, LastUpdatedBy)
select 'Semi', GETDATE(),@UserID
	
IF not exists (select name from FurnishingTypes where Name='Unfurnished')
insert into FurnishingTypes(Name, LastUpdatedOn, LastUpdatedBy)
select 'Unfurnished', GETDATE(),@UserID

--------------------------
-- Seed Cities
--------------------------
IF not exists (select top 1 id from Cities)
Insert into Cities(Name,LastUpdatedBy,LastUpdatedOn,Country)
select 'New York',@UserID,getdate(),'USA'
union
select 'Houston',@UserID,getdate(),'USA'
union
select 'Los Angeles',@UserID,getdate(),'USA'
union
select 'New Delhi',@UserID,getdate(),'India'
union
select 'Bangalore',@UserID,getdate(),'India'

--------------------------
-- Seed Properties
--------------------------
-- Seed property for sell
IF not exists (select top 1 name from Properties where Name='White House Demo')
insert into Properties(SellRent,Name,PropertyTypeId,BHK,FurnishingTypeId,Price,BuiltArea,CarpetArea,Address,
Address2,CityId,FloorNo,TotalFloors,ReadyToMove,MainEntrance,Security,Gated,Maintenance,EstPossessionOn,Age,Description,PostedOn,PostedBy,LastUpdatedOn,LastUpdatedBy)
select 
1, --Sell Rent
'White House Demo', --Name
(select Id from PropertyTypes where Name='Apartment'), --Property Type ID
2, --BHK
(select Id from FurnishingTypes where Name='Fully'), --Furnishing Type ID
1800, --Price
1400, --Built Area
900, --Carpet Area
'6 Street', --Address
'Golf Course Road', -- Address2
(select top 1 Id from Cities), -- City ID
3, -- Floor No
3, --Total Floors
1, --Ready to Move
'East', --Main Entrance
0, --Security
1, --Gated
300, -- Maintenance
'2019-01-01', -- Establishment or Posession on
0, --Age
'Well Maintained builder floor available for rent at prime location. # property features- - 5 mins away from metro station - Gated community - 24*7 security. # property includes- - Big rooms (Cross ventilation & proper sunlight) - 
Drawing and dining area - Washrooms - Balcony - Modular kitchen - Near gym, market, temple and park - Easy commuting to major destination. Feel free to call With Query.', --Description
GETDATE(), --Posted on
@UserID, --Posted by
GETDATE(), --Last Updated on
@UserID --Last Updated by

---------------------------
-- Seed property for rent
---------------------------
IF not exists (select top 1 name from Properties where Name='Birla House Demo')
insert into Properties(SellRent,Name,PropertyTypeId,BHK,FurnishingTypeId,Price,BuiltArea,CarpetArea,Address,
Address2,CityId,FloorNo,TotalFloors,ReadyToMove,MainEntrance,Security,Gated,Maintenance,EstPossessionOn,Age,Description,PostedOn,PostedBy,LastUpdatedOn,LastUpdatedBy)
select 
2, --Sell Rent
'Birla House Demo', --Name
(select Id from PropertyTypes where Name='Apartment'), --Property Type ID
2, --BHK
(select Id from FurnishingTypes where Name='Fully'), --Furnishing Type ID
1800, --Price
1400, --Built Area
900, --Carpet Area
'6 Street', --Address
'Golf Course Road', -- Address2
(select top 1 Id from Cities), -- City ID
3, -- Floor No
3, --Total Floors
1, --Ready to Move
'East', --Main Entrance
0, --Security
1, --Gated
300, -- Maintenance
'2019-01-01', -- Establishment or Posession on
0, --Age
'Well Maintained builder floor available for rent at prime location. # property features- - 5 mins away from metro station - Gated community - 24*7 security. # property includes- - Big rooms (Cross ventilation & proper sunlight) - 
Drawing and dining area - Washrooms - Balcony - Modular kitchen - Near gym, market, temple and park - Easy commuting to major destination. Feel free to call With Query.', --Description
GETDATE(), --Posted on
@UserID, --Posted by
GETDATE(), --Last Updated on
@UserID --Last Updated by

