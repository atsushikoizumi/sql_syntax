--
-- require by master user
--
-- CREATE LOGIN xx_test WITH PASSWORD = 'xx_test_pass', DEFAULT_LANGUAGE = Japanese;


--
-- login by xx_adm
-- 
USE xx00;
GO

-- database level actions
-- CREATE LOGIN [xx_test] WITH PASSWORD=N'xx_test';
CREATE USER [xx_test] FOR LOGIN [xx_test] WITH DEFAULT_SCHEMA=[xx_adm];
GO

ALTER USER [xx_test] WITH DEFAULT_SCHEMA = [xx_ips]; 
GO

CREATE ROLE [test_role];
GO

ALTER ROLE [test_role] ADD MEMBER [xx_test];
GO

ALTER ROLE [test_role] DROP MEMBER [xx_test];
GO

CREATE SCHEMA [xx_test];
GO

ALTER SCHEMA [xx_test] TRANSFER [xx_adm].[tab1_xx00];
GO

ALTER SCHEMA [xx_adm] TRANSFER [xx_test].[tab1_xx00];
GO

DROP SCHEMA [xx_test];
GO

CREATE TABLE [xx_adm].[test_table] ([id] [int] NULL,[name] [nchar](10) NULL) ON [PRIMARY]
GO

INSERT INTO [xx_adm].[test_table] VALUES(1,'test')
GO

INSERT INTO [xx_adm].[test_table] VALUES(2,'sample')
GO

UPDATE [xx_adm].[test_table] SET [name]='test-1' WHERE [id]=1
GO

SELECT * FROM [xx_adm].[test_table]
GO

DELETE [xx_adm].[test_table] WHERE [id]=2
GO

ALTER TABLE [xx_adm].[test_table] ADD [address] VARCHAR (10) DEFAULT '' NOT NULL
GO

GRANT SELECT ON [xx_adm].[test_table] TO [xx_test]
GO

REVOKE SELECT ON [xx_adm].[test_table] FROM [xx_test]
GO

TRUNCATE TABLE [xx_adm].[test_table]
GO

DROP TABLE [xx_adm].[test_table]
GO

DROP USER [xx_test];
GO

DROP ROLE [test_role];
GO
