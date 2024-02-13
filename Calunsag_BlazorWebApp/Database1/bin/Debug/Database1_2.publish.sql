﻿/*
Deployment script for Database1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Database1"
:setvar DefaultFilePrefix "Database1"
:setvar DefaultDataPath "C:\Users\kizum\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\kizum\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'The following operation was generated from a refactoring log file c70744f8-c837-419a-a7f8-d63298f16e4e';

PRINT N'Rename [dbo].[Table1].[name] to FName';


GO
EXECUTE sp_rename @objname = N'[dbo].[Table1].[name]', @newname = N'FName', @objtype = N'COLUMN';


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c70744f8-c837-419a-a7f8-d63298f16e4e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c70744f8-c837-419a-a7f8-d63298f16e4e')

GO

GO
PRINT N'Update complete.';


GO