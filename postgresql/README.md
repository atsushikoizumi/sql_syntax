# postgresql
postgresql 向けの sql を載せていく。

0. データベースへの接続
    ```
    psql -h host -U user -p port -d dbname
    ```

1. データベースの一覧確認
    ```
    ¥l
    ```

2. ロールの一覧確認
    ```
    ¥du+
    ```

3. スキーマの一覧確認
    ```
    ¥dn+
    ```

4. テーブルの一覧
    ```
    ¥dt+
    ```

5. テーブル毎の権限確認
    ```
    ¥z
    ```

