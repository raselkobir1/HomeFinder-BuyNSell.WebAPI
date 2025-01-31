USE [BuyRentHomeDb]

--EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

--exec sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ?  CHECK CONSTRAINT all"
--exec sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"


INSERT [dbo].[Countries] ([Name], [LastUpdatedBy], [LastUpdatedOn]) VALUES ( N'Bangladesh', 3, NULL)
INSERT [dbo].[Countries] ([Name], [LastUpdatedBy], [LastUpdatedOn]) VALUES ( N'USA', 3, NULL)
--select * from dbo.Countries

INSERT [dbo].[Cities] ([Id], [Name], [Latitude], [Longitude], [AreaInKM], [CountryId], [LastUpdatedBy], [LastUpdatedOn]) VALUES (2, N'Dhaka', 23.811056, 90.407608, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Cities] ([Id], [Name], [Latitude], [Longitude], [AreaInKM], [CountryId], [LastUpdatedBy], [LastUpdatedOn]) VALUES (3, N'Chittagong', 22.3419, 91.815536, NULL, 2, 0, CAST(N'2022-09-19T22:36:15.5300000' AS DateTime2))
INSERT [dbo].[Cities] ([Id], [Name], [Latitude], [Longitude], [AreaInKM], [CountryId], [LastUpdatedBy], [LastUpdatedOn]) VALUES (4, N'Rajshahi', 24.36164, 88.627054, NULL, 1, 0, CAST(N'2022-09-19T22:36:44.9400000' AS DateTime2))
INSERT [dbo].[Cities] ([Id], [Name], [Latitude], [Longitude], [AreaInKM], [CountryId], [LastUpdatedBy], [LastUpdatedOn]) VALUES (5, N'New York', 40.726933, -73.981737, NULL, 2, 0, CAST(N'2022-09-19T22:39:15.9960000' AS DateTime2))
--select * from dbo.Cities
 

INSERT [dbo].[FurnishingTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'Fully', CAST(N'2022-08-08T09:24:46.8760000' AS DateTime2), 0)
INSERT [dbo].[FurnishingTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'Semi', CAST(N'2022-08-08T09:24:46.8800000' AS DateTime2), 0)
INSERT [dbo].[FurnishingTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'Unfurnished', CAST(N'2022-08-08T09:24:46.8830000' AS DateTime2), 0)
--select * from dbo.[FurnishingTypes]

INSERT [dbo].[PropertyTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'House', CAST(N'2022-08-08T09:24:46.8660000' AS DateTime2), 0)
INSERT [dbo].[PropertyTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'Apartment', CAST(N'2022-08-08T09:24:46.8730000' AS DateTime2), 0)
INSERT [dbo].[PropertyTypes] ([Name], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'Duplex', CAST(N'2022-08-08T09:24:46.8760000' AS DateTime2), 0)
--select * from dbo.[PropertyTypes]

INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (1, N'Habibur''s house', 3, 3, 4, 3, NULL, 3, 4, N'334 Gladys Gateway', 12, 2, 1232, 121212, 12, 1, 1, 0, NULL, NULL, NULL, N'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), CAST(N'2023-05-08T15:31:20.8701989' AS DateTime2), 3, CAST(N'2023-09-11T13:47:44.3004234' AS DateTime2), 3,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (1, N'New Caledonia House', 3, 2, 1, NULL, NULL, 4, 5, N'27677 Rodger Dam', 1, 2, 2222, 32423423, 234234, 1, 1, 0, NULL, NULL, NULL, N'Saturday', CAST(N'10:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'2023-07-07T17:41:15.5394780' AS DateTime2), 3, CAST(N'2023-07-27T13:51:10.2616220' AS DateTime2), 3,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (1, N'Salt Lake City House', 2, 2, 1, 1, NULL, 3, 2, N'272 Ondricka Port', 5, 4, 12312, 2000, 200, 1, 1, 0, 23.827875871535543, 90.5503220668646, N'<p>Test</p>', N'Saturday,Sunday', CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time), CAST(N'2023-07-27T14:12:03.4327592' AS DateTime2), 2, CAST(N'2024-05-19T14:31:04.6438983' AS DateTime2), 2,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (2, N'Arielle Boyer Hom', 1, 2, 1, 2, NULL, 3, 3, N'21835 Bosco Lights', 12, 2, 3456, 121212, NULL, 1, 1, 0, NULL, NULL, NULL, N'Monday,Tuesday,Saturday,Sunday', CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), CAST(N'2023-08-03T13:56:18.3858575' AS DateTime2), 3, CAST(N'2023-09-10T17:10:40.7641122' AS DateTime2), 3,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (1, N'769 Bogan Falls Home Test Name', 2, 2, 2, 2, NULL, 4, 5, N'4588 Barrows Camp', 12, 2, 1212, 23232323, NULL, 1, 1, 0, 40.716455480732535, -73.932678423137915, N'<p>T</p>', N'Monday,Wednesday,Saturday', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), CAST(N'2024-01-14T12:59:20.2328059' AS DateTime2), 2, CAST(N'2024-05-16T16:17:05.5117841' AS DateTime2), 2,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (1, N'Test Habib Property with location', 1, 2, 3, 2, 2, 4, 5, N'Road, City', 12, 2, 1600, 120000, 120, 1, 1, 0, 40.911678865938271, -74.0458159583263, NULL, N'Wednesday,Friday', CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), CAST(N'2024-05-15T15:11:37.8404026' AS DateTime2), 3, CAST(N'2024-05-15T16:36:46.5062712' AS DateTime2), 3,1,0)
INSERT [dbo].[Properties] ([SellRent], [Name], [PropertyTypeId], [FurnishingTypeId], [Bedroom], [Bathroom], [CommonSpace], [CountryId], [CityId], [StreetAddress], [TotalFloor], [Floor], [Area], [RentPrice], [OtherCost], [Gym], [Parking], [SwimmingPool], [Latitude], [Longitude], [Description], [AvailableDays], [AvailableStartTime], [AvailableEndTime], [PostedOn], [PostedBy], [LastUpdatedOn], [LastUpdatedBy],[Status],[Isdeleted]) VALUES (2, N'Test Prop', 2, 3, 2, 2, NULL, 3, 2, N'Test Address', 12, 3, 1444, 124500, NULL, 0, 0, 0, 23.843503241224237, 90.497682723384742, NULL, N'Tuesday', CAST(N'15:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2024-05-19T15:10:52.4304981' AS DateTime2), 3, CAST(N'2024-05-19T15:10:52.4307552' AS DateTime2), 3,1,0)

--select * from dbo.[Properties]


INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638191566812129944.jfif', 1, 8, CAST(N'2023-05-08T15:31:21.2551355' AS DateTime2), 3)
INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638191566812287868.jpeg', 0, 8, CAST(N'2023-05-08T15:31:21.2558055' AS DateTime2), 3)
INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638260626703553463.jpg', 1, 9, CAST(N'2023-07-27T13:51:10.3933899' AS DateTime2), 3)
INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638411048015099414.jpg', 1, 12, CAST(N'2024-01-17T16:13:21.5690893' AS DateTime2), 2)
INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638411048179243971.jpg', 1, 10, CAST(N'2024-01-17T16:13:37.9309392' AS DateTime2), 2)
INSERT [dbo].[Photos] ( [ImageUrl], [IsPrimary], [PropertyId], [LastUpdatedOn], [LastUpdatedBy]) VALUES (N'638517282529922572.jpg', 1, 13, CAST(N'2024-05-19T15:10:53.0443704' AS DateTime2), 3)
--select * from dbo.Photos


INSERT [dbo].[Roles] ([Name], [IsLocked], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (N'Admin', 1, N'Admin of Whole System', 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime), 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime))
INSERT [dbo].[Roles] ([Name], [IsLocked], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (N'Area Manager', 1, N'Manages Some areas', 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime), 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime))
INSERT [dbo].[Roles] ([Name], [IsLocked], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (N'User', 1, N'General Users', 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime), 1, CAST(N'2022-09-19T22:36:15.530' AS DateTime))
--select * from dbo.Roles

--All user password userName: Admin pass: pass@123
INSERT [dbo].[Users] ([Username], [Password], [PasswordKey], [Name], [Email], [Mobile]) VALUES (N'Rasel', 0x02E64CF1E1A98D1CE3324A7C9C547E91B7F7EA8A2A9519BFE7FF36F70F49236180BC5867A8FD6E052BF69535E2392AEB67EDC004B908CAE82634E0A14727E709, 0x35637FBA591280EFECA1224DCA364D880C326A2D71C3B9A78115E87EB1C164857E1DEFC74E25E179D0947670E96CAF6FD8D0303F5646DD548745AF792439A1D4CB3327591309AF490E165BE371FAB079D8CF80F176B8D27FAEC4539CE74299F2C622B2D0D6A0193A7961EFF18E1171C732D14379E88CA8C23DA0B73EF27D94E9, N'John', N'abc@test.com', N'0123455')
INSERT [dbo].[Users] ([Username], [Password], [PasswordKey], [Name], [Email], [Mobile]) VALUES (N'Bob', 0x02E64CF1E1A98D1CE3324A7C9C547E91B7F7EA8A2A9519BFE7FF36F70F49236180BC5867A8FD6E052BF69535E2392AEB67EDC004B908CAE82634E0A14727E709, 0x35637FBA591280EFECA1224DCA364D880C326A2D71C3B9A78115E87EB1C164857E1DEFC74E25E179D0947670E96CAF6FD8D0303F5646DD548745AF792439A1D4CB3327591309AF490E165BE371FAB079D8CF80F176B8D27FAEC4539CE74299F2C622B2D0D6A0193A7961EFF18E1171C732D14379E88CA8C23DA0B73EF27D94E9, N'Bob', N'abc@test.com', N'0123455')
INSERT [dbo].[Users] ([Username], [Password], [PasswordKey], [Name], [Email], [Mobile]) VALUES (N'Admin', 0x02E64CF1E1A98D1CE3324A7C9C547E91B7F7EA8A2A9519BFE7FF36F70F49236180BC5867A8FD6E052BF69535E2392AEB67EDC004B908CAE82634E0A14727E709, 0x35637FBA591280EFECA1224DCA364D880C326A2D71C3B9A78115E87EB1C164857E1DEFC74E25E179D0947670E96CAF6FD8D0303F5646DD548745AF792439A1D4CB3327591309AF490E165BE371FAB079D8CF80F176B8D27FAEC4539CE74299F2C622B2D0D6A0193A7961EFF18E1171C732D14379E88CA8C23DA0B73EF27D94E9, N'Admin', N'abc@test.com', N'0123455')
INSERT [dbo].[Users] ([Username], [Password], [PasswordKey], [Name], [Email], [Mobile]) VALUES (N'Demo', 0x02E64CF1E1A98D1CE3324A7C9C547E91B7F7EA8A2A9519BFE7FF36F70F49236180BC5867A8FD6E052BF69535E2392AEB67EDC004B908CAE82634E0A14727E709, 0x35637FBA591280EFECA1224DCA364D880C326A2D71C3B9A78115E87EB1C164857E1DEFC74E25E179D0947670E96CAF6FD8D0303F5646DD548745AF792439A1D4CB3327591309AF490E165BE371FAB079D8CF80F176B8D27FAEC4539CE74299F2C622B2D0D6A0193A7961EFF18E1171C732D14379E88CA8C23DA0B73EF27D94E9, N'Demo User', N'abc@test.com', N'0123455')

--select * from Users

INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[UserPrivileges] ([UserId], [RoleId]) VALUES (4, 3)
--select * from [UserPrivileges]
 

INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (8,  3, CAST(N'2024-02-17' AS Date), CAST(N'2024-02-17T10:00:00.000' AS DateTime), CAST(N'2024-02-17T10:30:00.000' AS DateTime), N'12345678', N'N', 0, 0, N'Not good')
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (9,  3, CAST(N'2024-02-17' AS Date), CAST(N'2024-02-17T10:00:00.000' AS DateTime), CAST(N'2024-02-17T10:30:00.000' AS DateTime), N'3434', N'N', 0, 0, N'Test')
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (10, 4, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22T14:00:00.000' AS DateTime), CAST(N'2024-05-22T14:30:00.000' AS DateTime), N'12334', N'A', 0, 0, NULL)
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (11, 4, CAST(N'2024-05-20' AS Date), CAST(N'2024-05-20T14:30:00.000' AS DateTime), CAST(N'2024-05-20T15:00:00.000' AS DateTime), N'21312323', N'A', 0, 0, NULL)
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (12, 6, CAST(N'2024-02-17' AS Date), CAST(N'2024-02-17T10:00:00.000' AS DateTime), CAST(N'2024-02-17T10:30:00.000' AS DateTime), N'3434', N'N', 0, 0, N'Test')
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (13, 8, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22T14:00:00.000' AS DateTime), CAST(N'2024-05-22T14:30:00.000' AS DateTime), N'12334', N'A', 0, 0, NULL)
INSERT [dbo].[VisitingRequests] ([PropertyId], [TakenBy], [DateOn], [StartTIme], [EndTime], [ContactNumber], [Status], [IsBlocked], [IsActive], [Notes]) VALUES (14, 6, CAST(N'2024-05-20' AS Date), CAST(N'2024-05-20T14:30:00.000' AS DateTime), CAST(N'2024-05-20T15:00:00.000' AS DateTime), N'21312323', N'A', 0, 0, NULL)
--select * from [dbo].[VisitingRequests]
