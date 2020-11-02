/*** create table ***/
CREATE TABLE test_user.tbl_test01 ( 
                          col1   varchar2(10)
                         ,col2   varchar2(10)
                         ,col3   varchar2(10)
                               ) 
TABLESPACE tbs_test_user_01 ;

ALTER TABLE test_user.tbl_test01 ADD ( col4   varchar2(10) ) ;



/*** create cluster ***/
CREATE CLUSTER test_user.clt_test01 (col1   varchar2(10)) SIZE 512;

CREATE TABLE test_user.tbl_test02 ( 
                          col1   varchar2(10)
                         ,col2   varchar2(10)
                         ,col3   varchar2(10)
                               ) 
CLUSTER test_user.clt_test01 (col1) ;

CREATE TABLE test_user.tbl_test03 ( 
                          col1   varchar2(10)
                         ,col4   varchar2(10)
                               ) 
CLUSTER test_user.clt_test01 (col1) ;

ALTER CLUSTER test_user.clt_test01 SIZE 1024 ;


/*** create index ***/
CREATE INDEX test_user.idx_tbl_test01_01 ON test_user.tbl_test01 (col1);
CREATE INDEX test_user.idx_clt_test01_01 ON CLUSTER test_user.clt_test01;


/*** insert data ***/

INSERT INTO test_user.tbl_test01 (col1,col2,col3,col4) 
SELECT ROWNUM,'aaa','xxx','111' FROM all_catalog WHERE ROWNUM <= 100;
COMMIT;

INSERT INTO test_user.tbl_test02 (col1,col2,col3) 
SELECT ROWNUM,'bbb','yyy' FROM all_catalog WHERE ROWNUM <= 100;
COMMIT;

INSERT INTO test_user.tbl_test03 (col1,col4) 
SELECT ROWNUM,'222' FROM all_catalog WHERE ROWNUM <= 500;
COMMIT;


/*** create view ***/
CREATE VIEW test_user.v_test01 AS SELECT a.col1 from test_user.tbl_test01 a,test_user.tbl_test03 b where a.col4=b.col4 ;

ALTER VIEW test_user.v_test01 COMPILE;


/*** create materialized view ***/
CREATE MATERIALIZED VIEW test_user.mv_test01 AS SELECT a.col1 from test_user.tbl_test01 a,test_user.tbl_test03 b where a.col4=b.col4 ;

exec DBMS_MVIEW.REFRESH('mv_test01','c');

CREATE MATERIALIZED VIEW test_user.mv_test02 REFRESH START WITH sysdate NEXT sysdate + 1  AS SELECT col1 from test_user.tbl_test01 ;

CREATE MATERIALIZED VIEW LOG ON test_user.tbl_test01 
 with ROWID,sequence (col1 )
 including new values;

ALTER MATERIALIZED VIEW test_user.mv_test02 REFRESH FAST;


/*** create synonym ***/
CREATE SYNONYM test_user.syn_test01 FOR test_user.tbl_test01 ;

ALTER SYNONYM test_user.syn_test01 COMPILE;


/*** purge table ***/
CREATE TABLE test_user.tbl_test04 ( 
                          col1   varchar2(10)
                               ) 
TABLESPACE tbs_test_user_01_02 ;

INSERT INTO test_user.tbl_test04 (col1) 
SELECT ROWNUM FROM all_catalog WHERE ROWNUM <= 500;
COMMIT;

PURGE TABLESPACE tbs_test_user_01_02 ;

INSERT INTO test_user.tbl_test04 (col1) 
SELECT ROWNUM FROM all_catalog WHERE ROWNUM <= 500;
COMMIT;


/*** create schema ***/
CREATE SCHEMA AUTHORIZATION test_user 
   CREATE TABLE dummy_tbl01 (col1 VARCHAR2(10)) 
   CREATE VIEW dummy_view01 AS SELECT col1 FROM dummy_tbl01
; 


