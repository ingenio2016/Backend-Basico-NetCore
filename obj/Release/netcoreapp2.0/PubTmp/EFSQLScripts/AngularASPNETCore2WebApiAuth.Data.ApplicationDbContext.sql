IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [AccessFailedCount] int NOT NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [Email] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [FacebookId] bigint NULL,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [LockoutEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [PasswordHash] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [PictureUrl] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [UserName] nvarchar(256) NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE TABLE [Customers] (
        [Id] int NOT NULL IDENTITY,
        [Gender] nvarchar(max) NULL,
        [IdentityId] nvarchar(450) NULL,
        [Locale] nvarchar(max) NULL,
        [Location] nvarchar(max) NULL,
        CONSTRAINT [PK_Customers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Customers_AspNetUsers_IdentityId] FOREIGN KEY ([IdentityId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    CREATE INDEX [IX_Customers_IdentityId] ON [Customers] ([IdentityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180104134211_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180104134211_initial', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611123110_IdentificationToCustomers')
BEGIN
    ALTER TABLE [Customers] ADD [Identification] int NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611123110_IdentificationToCustomers')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180611123110_IdentificationToCustomers', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    DROP TABLE [Customers];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE TABLE [Countries] (
        [CountryId] int NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        CONSTRAINT [PK_Countries] PRIMARY KEY ([CountryId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE TABLE [Departments] (
        [DepartmentId] int NOT NULL IDENTITY,
        [CountryId] int NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Departments] PRIMARY KEY ([DepartmentId]),
        CONSTRAINT [FK_Departments_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE TABLE [Cities] (
        [CityId] int NOT NULL IDENTITY,
        [CountryId] int NOT NULL,
        [DepartmentId] int NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Cities] PRIMARY KEY ([CityId]),
        CONSTRAINT [FK_Cities_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Cities_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE INDEX [IX_Cities_CountryId] ON [Cities] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE INDEX [IX_Cities_DepartmentId] ON [Cities] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    CREATE INDEX [IX_Departments_CountryId] ON [Departments] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611151721_CountryDepartmentCityModels')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180611151721_CountryDepartmentCityModels', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE TABLE [Genres] (
        [GenreId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_Genres] PRIMARY KEY ([GenreId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE TABLE [Users] (
        [UserId] int NOT NULL IDENTITY,
        [Address] nvarchar(300) NULL,
        [CityId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DepartmentId] int NOT NULL,
        [FirstName] nvarchar(80) NOT NULL,
        [GenreId] int NOT NULL,
        [LastName] nvarchar(80) NOT NULL,
        [Password] nvarchar(max) NULL,
        [Phone] nvarchar(20) NULL,
        [Photo] nvarchar(max) NULL,
        [UserName] nvarchar(250) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([UserId]),
        CONSTRAINT [FK_Users_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Users_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Users_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Users_Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genres] ([GenreId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE INDEX [IX_Users_CityId] ON [Users] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE INDEX [IX_Users_CountryId] ON [Users] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE INDEX [IX_Users_DepartmentId] ON [Users] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    CREATE INDEX [IX_Users_GenreId] ON [Users] ([GenreId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611153201_AddUserModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180611153201_AddUserModel', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [FK_Users_Genres_GenreId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [Users] DROP CONSTRAINT [PK_Users];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    EXEC sp_rename N'Users', N'DataUsers';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    EXEC sp_rename N'DataUsers.IX_Users_GenreId', N'IX_DataUsers_GenreId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    EXEC sp_rename N'DataUsers.IX_Users_DepartmentId', N'IX_DataUsers_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    EXEC sp_rename N'DataUsers.IX_Users_CountryId', N'IX_DataUsers_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    EXEC sp_rename N'DataUsers.IX_Users_CityId', N'IX_DataUsers_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [DataUsers] ADD CONSTRAINT [PK_DataUsers] PRIMARY KEY ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [DataUsers] ADD CONSTRAINT [FK_DataUsers_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [DataUsers] ADD CONSTRAINT [FK_DataUsers_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [DataUsers] ADD CONSTRAINT [FK_DataUsers_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    ALTER TABLE [DataUsers] ADD CONSTRAINT [FK_DataUsers_Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genres] ([GenreId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180611192929_insertSeedData')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180611192929_insertSeedData', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE TABLE [Communes] (
        [CommuneId] int NOT NULL IDENTITY,
        [CityId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DepartmentId] int NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Communes] PRIMARY KEY ([CommuneId]),
        CONSTRAINT [FK_Communes_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Communes_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Communes_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE TABLE [RedUsers] (
        [RedUserId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_RedUsers] PRIMARY KEY ([RedUserId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE TABLE [VotingPlaces] (
        [VotingPlaceId] int NOT NULL IDENTITY,
        [CityId] int NOT NULL,
        [Code] nvarchar(max) NULL,
        [CountryId] int NOT NULL,
        [DepartmentId] int NOT NULL,
        [Name] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_VotingPlaces] PRIMARY KEY ([VotingPlaceId]),
        CONSTRAINT [FK_VotingPlaces_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_VotingPlaces_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_VotingPlaces_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_Communes_CityId] ON [Communes] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_Communes_CountryId] ON [Communes] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_Communes_DepartmentId] ON [Communes] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_VotingPlaces_CityId] ON [VotingPlaces] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_VotingPlaces_CountryId] ON [VotingPlaces] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    CREATE INDEX [IX_VotingPlaces_DepartmentId] ON [VotingPlaces] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612183851_createCommunesRedUsersAndVotingPlaces')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180612183851_createCommunesRedUsersAndVotingPlaces', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE TABLE [Bosses] (
        [BossId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Bosses] PRIMARY KEY ([BossId]),
        CONSTRAINT [FK_Bosses_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Bosses_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Bosses_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Bosses_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Bosses_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE INDEX [IX_Bosses_CityId] ON [Bosses] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE INDEX [IX_Bosses_CommuneId] ON [Bosses] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE INDEX [IX_Bosses_CountryId] ON [Bosses] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE INDEX [IX_Bosses_DepartmentId] ON [Bosses] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    CREATE INDEX [IX_Bosses_VotingPlaceId] ON [Bosses] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612192834_createBossModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180612192834_createBossModel', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    DROP TABLE [Bosses];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE TABLE [Boss] (
        [BossId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Boss] PRIMARY KEY ([BossId]),
        CONSTRAINT [FK_Boss_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Boss_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Boss_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Boss_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Boss_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]),
        CONSTRAINT [FK_Boss_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE TABLE [Coordinator] (
        [CoordinatorId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Coordinator] PRIMARY KEY ([CoordinatorId]),
        CONSTRAINT [FK_Coordinator_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Coordinator_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Coordinator_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Coordinator_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Coordinator_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]),
        CONSTRAINT [FK_Coordinator_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE TABLE [Leader] (
        [LeaderId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Leader] PRIMARY KEY ([LeaderId]),
        CONSTRAINT [FK_Leader_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Leader_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Leader_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Leader_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Leader_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]),
        CONSTRAINT [FK_Leader_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE TABLE [Link] (
        [LinkId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Link] PRIMARY KEY ([LinkId]),
        CONSTRAINT [FK_Link_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Link_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Link_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Link_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Link_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]),
        CONSTRAINT [FK_Link_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE TABLE [Voter] (
        [LeaderId] int NOT NULL IDENTITY,
        [Address] nvarchar(max) NOT NULL,
        [Association] nvarchar(max) NULL,
        [CellPhone] int NOT NULL,
        [CityId] int NOT NULL,
        [CommuneId] int NOT NULL,
        [CountryId] int NOT NULL,
        [DateOfBirth] datetime2 NOT NULL,
        [DepartmentId] int NOT NULL,
        [Document] int NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Latitude] nvarchar(max) NOT NULL,
        [Longitude] nvarchar(max) NOT NULL,
        [Observation] nvarchar(max) NULL,
        [Ocupation] nvarchar(max) NOT NULL,
        [UserId] int NOT NULL,
        [VotingPlaceId] int NOT NULL,
        [WorkPlace] nvarchar(max) NULL,
        CONSTRAINT [PK_Voter] PRIMARY KEY ([LeaderId]),
        CONSTRAINT [FK_Voter_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]),
        CONSTRAINT [FK_Voter_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]),
        CONSTRAINT [FK_Voter_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]),
        CONSTRAINT [FK_Voter_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]),
        CONSTRAINT [FK_Voter_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]),
        CONSTRAINT [FK_Voter_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_CityId] ON [Boss] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_CommuneId] ON [Boss] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_CountryId] ON [Boss] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_DepartmentId] ON [Boss] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_UserId] ON [Boss] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Boss_VotingPlaceId] ON [Boss] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_CityId] ON [Coordinator] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_CommuneId] ON [Coordinator] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_CountryId] ON [Coordinator] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_DepartmentId] ON [Coordinator] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_UserId] ON [Coordinator] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Coordinator_VotingPlaceId] ON [Coordinator] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_CityId] ON [Leader] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_CommuneId] ON [Leader] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_CountryId] ON [Leader] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_DepartmentId] ON [Leader] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_UserId] ON [Leader] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Leader_VotingPlaceId] ON [Leader] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_CityId] ON [Link] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_CommuneId] ON [Link] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_CountryId] ON [Link] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_DepartmentId] ON [Link] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_UserId] ON [Link] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Link_VotingPlaceId] ON [Link] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_CityId] ON [Voter] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_CommuneId] ON [Voter] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_CountryId] ON [Voter] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_DepartmentId] ON [Voter] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_UserId] ON [Voter] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    CREATE INDEX [IX_Voter_VotingPlaceId] ON [Voter] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612204939_createCoordinatorLinkLeaderAndVoterModels')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180612204939_createCoordinatorLinkLeaderAndVoterModels', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_Communes_CommuneId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_DataUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [FK_Boss_VotingPlaces_VotingPlaceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_Communes_CommuneId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_DataUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [FK_Coordinator_VotingPlaces_VotingPlaceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_Communes_CommuneId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_DataUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [FK_Leader_VotingPlaces_VotingPlaceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_Communes_CommuneId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_DataUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [FK_Link_VotingPlaces_VotingPlaceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_Cities_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_Communes_CommuneId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_Countries_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_Departments_DepartmentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_DataUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [FK_Voter_VotingPlaces_VotingPlaceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voter] DROP CONSTRAINT [PK_Voter];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Link] DROP CONSTRAINT [PK_Link];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leader] DROP CONSTRAINT [PK_Leader];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinator] DROP CONSTRAINT [PK_Coordinator];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Boss] DROP CONSTRAINT [PK_Boss];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'Voter') AND [c].[name] = N'LeaderId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Voter] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Voter] DROP COLUMN [LeaderId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voter', N'Voters';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Link', N'Links';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leader', N'Leaders';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinator', N'Coordinators';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Boss', N'Bosses';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_VotingPlaceId', N'IX_Voters_VotingPlaceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_UserId', N'IX_Voters_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_DepartmentId', N'IX_Voters_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_CountryId', N'IX_Voters_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_CommuneId', N'IX_Voters_CommuneId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Voters.IX_Voter_CityId', N'IX_Voters_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_VotingPlaceId', N'IX_Links_VotingPlaceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_UserId', N'IX_Links_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_DepartmentId', N'IX_Links_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_CountryId', N'IX_Links_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_CommuneId', N'IX_Links_CommuneId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Links.IX_Link_CityId', N'IX_Links_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_VotingPlaceId', N'IX_Leaders_VotingPlaceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_UserId', N'IX_Leaders_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_DepartmentId', N'IX_Leaders_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_CountryId', N'IX_Leaders_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_CommuneId', N'IX_Leaders_CommuneId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Leaders.IX_Leader_CityId', N'IX_Leaders_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_VotingPlaceId', N'IX_Coordinators_VotingPlaceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_UserId', N'IX_Coordinators_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_DepartmentId', N'IX_Coordinators_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_CountryId', N'IX_Coordinators_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_CommuneId', N'IX_Coordinators_CommuneId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Coordinators.IX_Coordinator_CityId', N'IX_Coordinators_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_VotingPlaceId', N'IX_Bosses_VotingPlaceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_UserId', N'IX_Bosses_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_DepartmentId', N'IX_Bosses_DepartmentId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_CountryId', N'IX_Bosses_CountryId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_CommuneId', N'IX_Bosses_CommuneId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    EXEC sp_rename N'Bosses.IX_Boss_CityId', N'IX_Bosses_CityId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD [VoterId] int NOT NULL IDENTITY;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [PK_Voters] PRIMARY KEY ([VoterId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [PK_Links] PRIMARY KEY ([LinkId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [PK_Leaders] PRIMARY KEY ([LeaderId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [PK_Coordinators] PRIMARY KEY ([CoordinatorId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [PK_Bosses] PRIMARY KEY ([BossId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Bosses] ADD CONSTRAINT [FK_Bosses_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Coordinators] ADD CONSTRAINT [FK_Coordinators_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Leaders] ADD CONSTRAINT [FK_Leaders_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Links] ADD CONSTRAINT [FK_Links_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_Communes_CommuneId] FOREIGN KEY ([CommuneId]) REFERENCES [Communes] ([CommuneId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([DepartmentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_DataUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [DataUsers] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    ALTER TABLE [Voters] ADD CONSTRAINT [FK_Voters_VotingPlaces_VotingPlaceId] FOREIGN KEY ([VotingPlaceId]) REFERENCES [VotingPlaces] ([VotingPlaceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180612220554_editVotersModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180612220554_editVotersModel', N'2.0.0-rtm-26452');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180613193448_addUserInRoleModel')
BEGIN
    CREATE TABLE [UserInRoles] (
        [UserInRoleId] int NOT NULL IDENTITY,
        [RoleName] nvarchar(max) NULL,
        [UserId] int NOT NULL,
        CONSTRAINT [PK_UserInRoles] PRIMARY KEY ([UserInRoleId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180613193448_addUserInRoleModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180613193448_addUserInRoleModel', N'2.0.0-rtm-26452');
END;

GO

