SELECT TOP 1000 * FROM msdb.dbo.rds_fn_get_audit_file('D:\rdsdbdata\SQLAudit\*.sqlaudit', default, default) order by 1 desc;
SELECT count(*) FROM msdb.dbo.rds_fn_get_audit_file('D:\rdsdbdata\SQLAudit\*.sqlaudit', default, default);
SELECT count(*) FROM msdb.dbo.rds_fn_get_audit_file('D:\rdsdbdata\SQLAudit\transmitted\*.sqlaudit', default, default) order by 1 desc;
GO


SELECT * FROM sys.server_audits;

SELECT 
    a.server_specification_id,
    a.name,b.audit_action_name,
    b.class_desc,
    a.is_state_enabled,
    a.create_date,
    a.modify_date 
FROM sys.server_audit_specifications AS a
LEFT OUTER JOIN sys.server_audit_specification_details AS b 
    on a.server_specification_id=b.server_specification_id;
GO