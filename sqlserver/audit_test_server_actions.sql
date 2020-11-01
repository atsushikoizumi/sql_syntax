--
-- login by master user
--
USE [master]
GO

-- server level actions
CREATE LOGIN [test04] WITH PASSWORD=N'test04', DEFAULT_DATABASE=[master];
GO

ALTER LOGIN [test04] DISABLE;
GO

CREATE SERVER ROLE [test-server-01];
GO

ALTER SERVER ROLE [test-server-01] ADD MEMBER [test04];
GO

ALTER SERVER ROLE [test-server-01] DROP MEMBER [test04];
GO

DROP SERVER ROLE [test-server-01];
GO

DROP LOGIN [test04];
GO

-- server audit actions
CREATE SERVER AUDIT [test_sample_audit]
TO FILE 
(	FILEPATH = N'D:\rdsdbdata\SQLAudit\'
	,MAXSIZE = 2 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
)
WHERE ([database_name]<>'rdsadmin')
GO

ALTER SERVER AUDIT [test_sample_audit] WITH (STATE = ON)
GO

ALTER SERVER AUDIT [test_sample_audit] WITH (STATE = OFF)
GO

-- ALTER SERVER AUDIT [test_sample_audit] MODIFY NAME = [test_sample_audit1]  
-- GO

CREATE SERVER AUDIT SPECIFICATION [test_sample_sp]
FOR SERVER AUDIT [test_sample_audit]
ADD (AUDIT_CHANGE_GROUP)
WITH (STATE = OFF)
GO 

DROP SERVER AUDIT SPECIFICATION [test_sample_sp]
GO

DROP SERVER AUDIT [test_sample_audit]
GO

-- server level select
-- SELECT * FROM msdb.dbo.rds_fn_get_audit_file ('D:\rdsdbdata\SQLAudit\*.sqlaudit', default, default ) order by 1 desc;
-- GO