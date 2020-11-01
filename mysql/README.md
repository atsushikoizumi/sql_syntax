# mysql
mysql 向けの sql のサンプルを載せていく。<br>

0. データベース接続
    ```
    mysql -h host -u user -p -P 3306 -D dbname
    ```

1. データベースの一覧確認
    ```
    show databases;
    select SCHEMA_NAME, DEFAULT_CHARACTER_SET_NAME, DEFAULT_COLLATION_NAME from INFORMATION_SCHEMA.SCHEMATA;
    ```

2. ユーザーの一覧確認
    ```
    select User,Host,account_locked from mysql.user;
    ```

3. 接続中のユーザーとデータベースの確認
    ```
    select current_user(),database();
    ```

4. テーブル一覧の確認
    ```
    show tables;
    show tables in dbname;
    show tbales in dbname like '%pattern%';
    show table status\G
    show table status like '%pattern%'\G
    ```

5. ユーザーの所有権限の確認
    ```
    show grants for `user`@`hostname`;
    ```

