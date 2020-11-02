/**********************************
rds_pgaudit の権限確認 version 1
**********************************/
SELECT r.rolname AS "RoleName",
       n.nspname AS "Schema",
       c.relname AS "Table",
       case WHEN c.relkind = 'r' THEN 'Table'
            WHEN c.relkind = 'v' THEN 'View'
            WHEN c.relkind = 'S' THEN 'Sequence'
            WHEN c.relkind = 'm' THEN 'Materialized View'
            WHEN c.relkind = 'p' THEN 'Partitioned Table'
       END AS "Type",
       case WHEN has_table_privilege(r.oid, c.oid, 'SELECT') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'INSERT') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'UPDATE') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'DELETE') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'TRUNCATE') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'REFERENCES') = 't'
                 AND  has_table_privilege(r.oid, c.oid, 'TRIGGER') = 't'
            THEN 't'
            ELSE 'f'
       END AS "ALL",
       has_table_privilege(r.oid, c.oid, 'SELECT') AS "SELECT",
       has_table_privilege(r.oid, c.oid, 'INSERT') AS "INSERT",
       has_table_privilege(r.oid, c.oid, 'UPDATE') AS "UPDATE",
       has_table_privilege(r.oid, c.oid, 'DELETE') AS "DELETE",
       has_table_privilege(r.oid, c.oid, 'TRUNCATE') AS "TRUNCATE",
       has_table_privilege(r.oid, c.oid, 'REFERENCES') AS "REFERENCES",
       has_table_privilege(r.oid, c.oid, 'TRIGGER') AS "TRIGGER"
  FROM pg_roles r, pg_class c, pg_namespace n
  WHERE c.relnamespace = n.oid
  AND c.relkind IN ('r','v','S','m','p')  /* 監査するテーブルオブジェクトのタイプを指定 */
  AND r.rolname = 'rds_pgaudit'  /* オブジェクト監査実行ロールを指定 */
  AND n.nspname NOT IN ('pg_toast','pg_catalog','information_schema')  /* 監査対象外のスキーマ名を指定 */
  ORDER BY "RoleName","Schema","Table","Type"
;


/**********************************
rds_pgaudit の権限確認 version 2
**********************************/
SELECT r.rolname AS "RoleName",
  n.nspname AS "Schema",
  c.relname AS "Table",
  case WHEN c.relkind = 'r' THEN 'Table'
     WHEN c.relkind = 'v' THEN 'View'
     WHEN c.relkind = 'S' THEN 'Sequence'
     WHEN c.relkind = 'm' THEN 'Materialized View'
     WHEN c.relkind = 'p' THEN 'Partitioned Table'
     WHEN c.relkind = 'f' THEN 'Foreign Table'
     WHEN c.relkind = 't' THEN 'TOAST Table'
     WHEN c.relkind = 'I' THEN 'Partitioned Index'
     WHEN c.relkind = 'c' THEN 'Composite Type'
     END AS "Type",
  case WHEN has_table_privilege(r.oid, c.oid, 'SELECT') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'INSERT') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'UPDATE') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'DELETE') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'TRUNCATE') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'REFERENCES') = 't'
     AND  has_table_privilege(r.oid, c.oid, 'TRIGGER') = 't'
     THEN '〇'
     ELSE ''
     END AS "ALL",
  case WHEN has_table_privilege(r.oid, c.oid, 'SELECT') THEN '〇' ELSE '' END AS "SEL",
  case WHEN has_table_privilege(r.oid, c.oid, 'INSERT') THEN '〇' ELSE '' END AS "INS",
  case WHEN has_table_privilege(r.oid, c.oid, 'UPDATE') THEN '〇' ELSE '' END AS "UPD",
  case WHEN has_table_privilege(r.oid, c.oid, 'DELETE') THEN '〇' ELSE '' END AS "DEL",
  case WHEN has_table_privilege(r.oid, c.oid, 'TRUNCATE') THEN '〇' ELSE '' END AS "TRU",
  case WHEN has_table_privilege(r.oid, c.oid, 'REFERENCES') THEN '〇' ELSE '' END AS "REF",
  case WHEN has_table_privilege(r.oid, c.oid, 'TRIGGER') THEN '〇' ELSE '' END AS "TRI"
FROM pg_roles r, pg_class c, pg_namespace n
WHERE c.relnamespace = n.oid
AND r.rolname = 'rds_pgaudit'  /* オブジェクト監査実行ロールを指定 */
AND n.nspname NOT IN ('pg_toast','pg_catalog','information_schema')  /* 監査対象外のスキーマ名を指定 */
AND (has_table_privilege(r.oid, c.oid, 'SELECT')
  or has_table_privilege(r.oid, c.oid, 'UPDATE')
  or has_table_privilege(r.oid, c.oid, 'DELETE')
  or has_table_privilege(r.oid, c.oid, 'TRUNCATE')
  or has_table_privilege(r.oid, c.oid, 'REFERENCES')
  or has_table_privilege(r.oid, c.oid, 'TRIGGER')
  )
ORDER BY "RoleName","Schema","Table","Type"
;


select c.oid,c.relname,n.nspname 
from pg_class c 
left outer join pg_namespace n on c.relnamespace=n.oid
where n.nspname in ('public')
;

/**********************************
監査設定の確認
**********************************/
-- パッケージ導入の確認
show shared_preload_libraries; -- 'pgaudit'

-- データベースレベルの監査設定
\c testdb02
show pgaudit.log; -- 'ALL'

-- ロールレベルの監査設定
select rolname,rolcanlogin,rolconfig from pg_roles where rolname not like 'pg_%'order by 1;

-- pgaudit role 確認
show pgaudit.role; -- 'rds_pgaudit'



/**********************************
監査設定のパラメータの確認
**********************************/
-- カタログテーブル
show pgaudit.log_catalog; -- 'on'

-- ログレベル
show pgaudit.log_level; -- 'log'

-- SQL内で変数を利用された場合、その変数に代入された値をロギングする設定
show pgaudit.log_parameter; -- 'on'

-- 操作した対象のオブジェクト名を分かりやすく出力する設定
show pgaudit.log_relation; -- on

-- Session Audit LoggingとObject Auditingを併用時、同じSQLログを複数回出力させない設定
show pgaudit.log_statement_once; -- 'on'

-- 接続
show log_connections; -- 'on'

-- 切断
show log_disconnections; -- 'on'

-- 接続中のセッションで監査設定を確認
show pgaudit.log;



/************* rusult *************

  RoleName   |   Schema    |      Table      |       Type        | ALL | SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER
-------------+-------------+-----------------+-------------------+-----+--------+--------+--------+--------+----------+------------+---------
 rds_pgaudit | emilyschema | copy_family     | View              | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | family_no       | Sequence          | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | material_family | Materialized View | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | measurement     | Partitioned Table | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | mybook          | Table             | f   | t      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | myfamily        | Table             | t   | t      | t      | t      | t      | t        | t          | t
 rds_pgaudit | emilyschema | myhobby         | Table             | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | emilyschema | test_array      | Table             | f   | f      | f      | f      | f      | f        | f          | f
 rds_pgaudit | public      | fantastic       | Table             | f   | f      | f      | f      | f      | f        | f          | f
(9 rows)


emilydb02=> \z
                                  Access privileges
   Schema    |   Name   | Type  |    Access privileges    | Column access privileges
-------------+----------+-------+-------------------------+--------------------------
 emilyschema | mybook   | table | user01=arwdDxt/user01  +|
             |          |       | user02=awDx/user01      |
 emilyschema | myfamily | table | user01=arwdDxt/user01  +|
             |          |       | user02=rwdxt/user01    +|
             |          |       | rds_pgaudit=arwd/user01 |
 emilyschema | myhobby  | table | user01=arwdDxt/user01  +|
             |          |       | user02=ardDt/user01     |
(3 rows)


memo

a = INSERT
r = SELECT
w = UPDATE
d = DELETE
D = TRUNCATE
x = REFERENCES
t = TRIGGER

rは通常のテーブル
iはインデックス
Sはシーケンス
tはTOASTテーブル
vはビュー
mはマテリアライズドビュー
cは複合型
fは外部テーブル
pはパーティションテーブル
Iはpartitioned index

View "pg_catalog.pg_roles"
   Column     |           Type           | Modifiers
----------------+--------------------------+-----------
 rolname        | name                     |
 rolsuper       | boolean                  |
 rolinherit     | boolean                  |
 rolcreaterole  | boolean                  |
 rolcreatedb    | boolean                  |
 rolcanlogin    | boolean                  |
 rolreplication | boolean                  |
 rolconnlimit   | integer                  |
 rolpassword    | text                     |
 rolvaliduntil  | timestamp with time zone |
 rolbypassrls   | boolean                  |
 rolconfig      | text[]                   |
 oid            | oid                      |

          Table "pg_catalog.pg_class"
       Column        |     Type     | Modifiers
---------------------+--------------+-----------
 relname             | name         | not null
 relnamespace        | oid          | not null
 reltype             | oid          | not null
 reloftype           | oid          | not null
 relowner            | oid          | not null
 relam               | oid          | not null
 relfilenode         | oid          | not null
 reltablespace       | oid          | not null
 relpages            | integer      | not null
 reltuples           | real         | not null
 relallvisible       | integer      | not null
 reltoastrelid       | oid          | not null
 relhasindex         | boolean      | not null
 relisshared         | boolean      | not null
 relpersistence      | "char"       | not null
 relkind             | "char"       | not null
 relnatts            | smallint     | not null
 relchecks           | smallint     | not null
 relhasoids          | boolean      | not null
 relhasrules         | boolean      | not null
 relhastriggers      | boolean      | not null
 relhassubclass      | boolean      | not null
 relrowsecurity      | boolean      | not null
 relforcerowsecurity | boolean      | not null
 relispopulated      | boolean      | not null
 relreplident        | "char"       | not null
 relispartition      | boolean      | not null
 relrewrite          | oid          | not null
 relfrozenxid        | xid          | not null
 relminmxid          | xid          | not null
 relacl              | aclitem[]    |
 reloptions          | text[]       |
 relpartbound        | pg_node_tree |

	
	