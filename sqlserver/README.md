# sqlserver
sqlserver 向けの sql を載せていく。

0. sqlcmd データベース接続
    ```
    sqlcmd -S hostname,port -U user -P password -d dbname -w 10000
    ```

1. データベースの一覧確認
    ```
    select name, database_id, create_date from sys.databases
    GO
    ```

2. ユーザーの一覧確認
    ```
    select sid, name, type_desc, type, is_disabled from sys.server_principals
    GO
    ```

3. テーブルの一覧確認
    ```
    select * from sys.objects;                                      -- 全テーブル
    GO
    select * from sys.objects where type = 'U';                     -- ユーザーテーブルのみ
    GO
    select * from sys.objects where schema_id = schema_id('hoge');  -- 特定スキーマ内のみ
    GO
    ```

4. 監査設定の確認
    ```
    select * from sys.server_audits;
    GO
    select 
        a.server_specification_id,
        a.name,b.audit_action_name,
        b.class_desc,
        a.is_state_enabled,
        a.create_date,
        a.modify_date 
    from sys.server_audit_specifications AS a
    LEFT OUTER JOIN sys.server_audit_specification_details AS b 
        on a.server_specification_id=b.server_specification_id;
    GO
    ```

5. RDS SQLServer 監査ログの確認
    ```
    select TOP 1000 * 
    from msdb.dbo.rds_fn_get_audit_file('D:\rdsdbdata\SQLAudit\*.sqlaudit', default, default) 
    order by 1 desc;
    GO
    -- 転送後の監査ログは ('D:\rdsdbdata\SQLAudit\transmitted\*.sqlaudit', default, default)
    ```


