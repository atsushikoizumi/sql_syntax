# oracle
oracle 向けの sql を載せていく。

0. データベースへの接続
    ```
    sqlplus user/pass@hostname:port/service
    ex) sqlplus masteruser/'password'@instance-name.xxxxx.eu-north-1.rds.amazonaws.com:1521/dbname

    sqlplus user/pass@hostname:port/service @sample.sql
    sqlplus user/pass@hostname:port/service @/full_pasth/sample.sql arg1 arg2 ...
    ```

1. sqlplus での結果を見やすく
    ```
    set linesize 1000
    set pagesize 1000
    ```

2. ユーザーの一覧確認
    ```
    column USERNAME format a30
    select USERNAME,CREATED from user_users order by USERNAME; 

    column USERNAME format a30
    select USERNAME,CREATED from all_users order by USERNAME;

    column USERNAME format a30
    column ACCOUNT_STATUS format a20
    column DEFAULT_TABLESPACE format a20
    column TEMPORARY_TABLESPACE format a20
    column LAST_LOGIN format a20
    select USERNAME,ACCOUNT_STATUS,CREATED,TO_CHAR(LAST_LOGIN, 'YYYY/MM/DD HH24:MI:SS') as "LAST_LOGIN",DEFAULT_TABLESPACE,TEMPORARY_TABLESPACE from dba_users order by USERNAME;
    ```

3. ロールの一覧確認
    ```
    column USERNAME format a30
    column GRANTED_ROLE format a30
    select USERNAME,GRANTED_ROLE,ADMIN_OPTION,INHERITED from user_role_privs order by USERNAME,GRANTED_ROLE;

    column GRANTEE format a30
    column GRANTED_ROLE format a30
    select GRANTEE,GRANTED_ROLE,ADMIN_OPTION,INHERITED from dba_role_privs order by GRANTEE,GRANTED_ROLE;
    ```


4. テーブルの一覧確認
    ```
    column TABLE_NAME format a30
    column TABLESPACE_NAME format a20
    column CLUSTER_NAME format a20
    select TABLE_NAME,TABLESPACE_NAME,CLUSTER_NAME from user_tables;

    column OWNER format a20
    column TABLE_NAME format a30
    column TABLESPACE_NAME format a20
    column CLUSTER_NAME format a20
    select OWNER,TABLE_NAME,TABLESPACE_NAME,CLUSTER_NAME from all_tables order by OWNER,TABLE_NAME;
    select OWNER,TABLE_NAME,TABLESPACE_NAME,CLUSTER_NAME from all_tables where OWNER in ('XX_ADM','XY_ADM','TEST_USER') order by OWNER,TABLE_NAME;

    column OWNER format a20
    column TABLE_NAME format a30
    column TABLESPACE_NAME format a20
    column CLUSTER_NAME format a20
    select OWNER,TABLE_NAME,TABLESPACE_NAME,CLUSTER_NAME from dba_tables order by OWNER,TABLE_NAME;
    select OWNER,TABLE_NAME,TABLESPACE_NAME,CLUSTER_NAME from dba_tables where OWNER in ('XX_ADM','XY_ADM') order by OWNER,TABLE_NAME;
    ```

5. テーブルへのアクセス権限確認
    ```
    column GRANTEE format a20
    column OWNER format a20
    column TABLE_NAME format a30
    column GRANTOR format a20
    column PRIVILEGE format a20
    select GRANTEE,OWNER,TABLE_NAME,GRANTOR,PRIVILEGE from user_tab_privs order by GRANTEE,OWNER,TABLE_NAME,PRIVILEGE;
    ```

6. ビューの一覧確認
    ```
    column VIEW_NAME format a30
    select VIEW_NAME from user_views order by VIEW_NAME;

    column OWNER format a30
    column VIEW_NAME format a30
    select OWNER,VIEW_NAME from all_views where OWNER in ('XX_ADM','XY_ADM') order by OWNER,VIEW_NAME;

6. 監査設定の確認
    ```
    show parameters audit_trail;
    
    column user_name format a12
    column proxy_name format a12
    column audit_option format a20
    column success format a12
    column failure format a12
    select * from DBA_STMT_AUDIT_OPTS;
    
    column owner format a13
    column object_name format a13
    column object_type format a13
    column alt format a5
    column aud format a5
    column com format a5
    column del format a5
    column gra format a5
    column ind format a5
    column ins format a5
    column loc format a5
    column ren format a5
    column sel format a5
    column upd format a5
    column ref format a5
    column exe format a5
    column cre format a5
    column rea format a5
    column wri format a5
    column fbk format a5
    select * from DBA_OBJ_AUDIT_OPTS;
    
    column alt format a5
    column aud format a5
    column com format a5
    column del format a5
    column gra format a5
    column ind format a5
    column ins format a5
    column loc format a5
    column ren format a5
    column sel format a5
    column upd format a5
    column ref format a5
    column exe format a5
    column cre format a5
    column rea format a5
    column wri format a5
    column fbk format a5
    select * from ALL_DEF_AUDIT_OPTS;
    ```
