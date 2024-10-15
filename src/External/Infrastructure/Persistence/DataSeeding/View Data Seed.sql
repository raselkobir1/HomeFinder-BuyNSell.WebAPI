-- View Seeded Data

select * from Users
select * from PropertyTypes
select * from FurnishingTypes
select * from Cities
select * from Properties

-------------------------------------------------------------------------
SELECT 
p.Name, 
pt.Name as PropertyTypeName,
ft.Name as FurnishTypeName, 
c.Name as CityName,
country.Name as CountryName, 
* 
FROM dbo.Properties as p
inner join [dbo].[PropertyTypes] as pt on pt.Id = p.PropertyTypeId
inner join [dbo].[FurnishingTypes] as ft on ft.Id = p.FurnishingTypeId
inner join [dbo].[Cities] as c on c.Id = p.CityId
inner join [dbo].[Countries] as country on country.Id = p.CountryId
inner join [dbo].[Photos] as pho on pho.PropertyId = p.Id
where p.IsDeleted = 0 
and p.SellRent = 2 and p.Status = 'A'