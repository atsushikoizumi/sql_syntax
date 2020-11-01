# sqlserver
sqlserver 向けの sql を載せていく。

0. sqlcmd データベース接続
    ```
    sqlcmd -S hostname,port -U user -P password -d dbname -w 10000
    ```

1. データベースの一覧確認
    ```
    SELECT name, database_id, create_date FROM sys.databases
    GO
    ```

2. ユーザーの一覧確認
    ```
    select sid, name, type_desc, type, is_disabled from sys.server_principals
    GO
    ```


