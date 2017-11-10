
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/10/2017 17:09:37
-- Generated from EDMX file: C:\Users\Pavlo_Korsun\source\repos\ConsoleApp1\ConsoleApp1\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GameDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CommentTbl_CommentTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblComments] DROP CONSTRAINT [FK_CommentTbl_CommentTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_CommentTbl_GameTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblComments] DROP CONSTRAINT [FK_CommentTbl_GameTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_GenreTbl_GenreTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TblGenres] DROP CONSTRAINT [FK_GenreTbl_GenreTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Game_Genre_Tbl_GameTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Game_Genre_Tbl] DROP CONSTRAINT [FK_Game_Genre_Tbl_GameTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Game_Genre_Tbl_GenreTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Game_Genre_Tbl] DROP CONSTRAINT [FK_Game_Genre_Tbl_GenreTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Game_PlatformType_Tbl_PlatformType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Game_PlatformType_Tbl] DROP CONSTRAINT [FK_Game_PlatformType_Tbl_PlatformType];
GO
IF OBJECT_ID(N'[dbo].[FK_Game_PlatformType_Tbl_GameTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Game_PlatformType_Tbl] DROP CONSTRAINT [FK_Game_PlatformType_Tbl_GameTbl];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TblComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblComments];
GO
IF OBJECT_ID(N'[dbo].[TblGames]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblGames];
GO
IF OBJECT_ID(N'[dbo].[TblGenres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblGenres];
GO
IF OBJECT_ID(N'[dbo].[TblPlatformTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TblPlatformTypes];
GO
IF OBJECT_ID(N'[dbo].[Game_Genre_Tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Game_Genre_Tbl];
GO
IF OBJECT_ID(N'[dbo].[Game_PlatformType_Tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Game_PlatformType_Tbl];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TblComments'
CREATE TABLE [dbo].[TblComments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Body] varchar(50)  NOT NULL,
    [Game_Id] int  NULL,
    [ParentCommentId] int  NULL
);
GO

-- Creating table 'TblGames'
CREATE TABLE [dbo].[TblGames] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Key] varchar(50)  NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Description] varchar(50)  NOT NULL
);
GO

-- Creating table 'TblGenres'
CREATE TABLE [dbo].[TblGenres] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [ParentGenreId] int  NULL
);
GO

-- Creating table 'TblPlatformTypes'
CREATE TABLE [dbo].[TblPlatformTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] varchar(50)  NOT NULL
);
GO

-- Creating table 'Game_Genre_Tbl'
CREATE TABLE [dbo].[Game_Genre_Tbl] (
    [TblGames_Id] int  NOT NULL,
    [TblGenres_Id] int  NOT NULL
);
GO

-- Creating table 'Game_PlatformType_Tbl'
CREATE TABLE [dbo].[Game_PlatformType_Tbl] (
    [TblPlatformTypes_Id] int  NOT NULL,
    [TblGames_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TblComments'
ALTER TABLE [dbo].[TblComments]
ADD CONSTRAINT [PK_TblComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TblGames'
ALTER TABLE [dbo].[TblGames]
ADD CONSTRAINT [PK_TblGames]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TblGenres'
ALTER TABLE [dbo].[TblGenres]
ADD CONSTRAINT [PK_TblGenres]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TblPlatformTypes'
ALTER TABLE [dbo].[TblPlatformTypes]
ADD CONSTRAINT [PK_TblPlatformTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [TblGames_Id], [TblGenres_Id] in table 'Game_Genre_Tbl'
ALTER TABLE [dbo].[Game_Genre_Tbl]
ADD CONSTRAINT [PK_Game_Genre_Tbl]
    PRIMARY KEY CLUSTERED ([TblGames_Id], [TblGenres_Id] ASC);
GO

-- Creating primary key on [TblPlatformTypes_Id], [TblGames_Id] in table 'Game_PlatformType_Tbl'
ALTER TABLE [dbo].[Game_PlatformType_Tbl]
ADD CONSTRAINT [PK_Game_PlatformType_Tbl]
    PRIMARY KEY CLUSTERED ([TblPlatformTypes_Id], [TblGames_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ParentCommentId] in table 'TblComments'
ALTER TABLE [dbo].[TblComments]
ADD CONSTRAINT [FK_CommentTbl_CommentTbl]
    FOREIGN KEY ([ParentCommentId])
    REFERENCES [dbo].[TblComments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentTbl_CommentTbl'
CREATE INDEX [IX_FK_CommentTbl_CommentTbl]
ON [dbo].[TblComments]
    ([ParentCommentId]);
GO

-- Creating foreign key on [Game_Id] in table 'TblComments'
ALTER TABLE [dbo].[TblComments]
ADD CONSTRAINT [FK_CommentTbl_GameTbl]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[TblGames]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentTbl_GameTbl'
CREATE INDEX [IX_FK_CommentTbl_GameTbl]
ON [dbo].[TblComments]
    ([Game_Id]);
GO

-- Creating foreign key on [ParentGenreId] in table 'TblGenres'
ALTER TABLE [dbo].[TblGenres]
ADD CONSTRAINT [FK_GenreTbl_GenreTbl]
    FOREIGN KEY ([ParentGenreId])
    REFERENCES [dbo].[TblGenres]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GenreTbl_GenreTbl'
CREATE INDEX [IX_FK_GenreTbl_GenreTbl]
ON [dbo].[TblGenres]
    ([ParentGenreId]);
GO

-- Creating foreign key on [TblGames_Id] in table 'Game_Genre_Tbl'
ALTER TABLE [dbo].[Game_Genre_Tbl]
ADD CONSTRAINT [FK_Game_Genre_Tbl_GameTbl]
    FOREIGN KEY ([TblGames_Id])
    REFERENCES [dbo].[TblGames]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TblGenres_Id] in table 'Game_Genre_Tbl'
ALTER TABLE [dbo].[Game_Genre_Tbl]
ADD CONSTRAINT [FK_Game_Genre_Tbl_GenreTbl]
    FOREIGN KEY ([TblGenres_Id])
    REFERENCES [dbo].[TblGenres]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Game_Genre_Tbl_GenreTbl'
CREATE INDEX [IX_FK_Game_Genre_Tbl_GenreTbl]
ON [dbo].[Game_Genre_Tbl]
    ([TblGenres_Id]);
GO

-- Creating foreign key on [TblPlatformTypes_Id] in table 'Game_PlatformType_Tbl'
ALTER TABLE [dbo].[Game_PlatformType_Tbl]
ADD CONSTRAINT [FK_Game_PlatformType_Tbl_PlatformType]
    FOREIGN KEY ([TblPlatformTypes_Id])
    REFERENCES [dbo].[TblPlatformTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TblGames_Id] in table 'Game_PlatformType_Tbl'
ALTER TABLE [dbo].[Game_PlatformType_Tbl]
ADD CONSTRAINT [FK_Game_PlatformType_Tbl_GameTbl]
    FOREIGN KEY ([TblGames_Id])
    REFERENCES [dbo].[TblGames]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Game_PlatformType_Tbl_GameTbl'
CREATE INDEX [IX_FK_Game_PlatformType_Tbl_GameTbl]
ON [dbo].[Game_PlatformType_Tbl]
    ([TblGames_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------