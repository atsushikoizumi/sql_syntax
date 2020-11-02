--
-- login by master user
--

set linesize 1000
set pagesize 1000
column USERNAME format a30
column GRANTEE format a30
column GRANTED_ROLE format a30

-- user/schema
CREATE USER XX_ADM IDENTIFIED BY "XX_ADM_DBA" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;
CREATE USER XX_APL1 IDENTIFIED BY "XX_APL1_PASS" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;
CREATE USER XX_BAT1 IDENTIFIED BY "XX_BAT1_PASS" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;
CREATE USER XY_ADM IDENTIFIED BY "XY_ADM_DBA" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;
SELECT USERNAME FROM ALL_USERS WHERE USERNAME like 'XX_%' or USERNAME like 'XY_%' order by USERNAME;

-- grant role to user
GRANT DBA TO XX_ADM;
GRANT DBA TO XY_ADM;
GRANT CONNECT TO XX_APL1;
GRANT CONNECT TO XX_BAT1;
SELECT GRANTEE,GRANTED_ROLE FROM dba_role_privs where GRANTEE like 'XX_%' or GRANTEE like 'XY_%' order by GRANTEE;



--
-- login by xx_adm
--

set linesize 1000
set pagesize 1000
column id format 9999
column name format a30

CREATE TABLE xx_adm.tab1_xx00 (id integer, name varchar(30));
INSERT INTO xx_adm.tab1_xx00 (id, name) VALUES ('10', '赤鬼');
INSERT INTO xx_adm.tab1_xx00 (id, name) VALUES ('20', '青鬼');
COMMIT;
GRANT SELECT ON xx_adm.tab1_xx00 TO XX_APL1;
GRANT ALL ON xx_adm.tab1_xx00 TO XX_BAT1;

CREATE TABLE xx_adm.tab2_xx00 (id integer, name varchar(30));
INSERT INTO xx_adm.tab2_xx00 (id, name) VALUES ('10', 'みかん');
INSERT INTO xx_adm.tab2_xx00 (id, name) VALUES ('20', 'もも');
COMMIT;
GRANT SELECT ON xx_adm.tab2_xx00 TO XX_APL1;
GRANT ALL ON xx_adm.tab2_xx00 TO XX_BAT1;

CREATE TABLE xx_adm.tab3_xx00 (id integer, name varchar(30));
INSERT INTO xx_adm.tab3_xx00 (id, name) VALUES ('10', 'にんじん');
INSERT INTO xx_adm.tab3_xx00 (id, name) VALUES ('20', 'だいこん');
COMMIT;
GRANT SELECT ON xx_adm.tab3_xx00 TO XX_APL1;
GRANT ALL ON xx_adm.tab3_xx00 TO XX_BAT1;

CREATE TABLE xx_adm.tab4_xx00 (id integer, name varchar(30));
INSERT INTO xx_adm.tab4_xx00 (id, name) VALUES ('10', 'ガンダム');
INSERT INTO xx_adm.tab4_xx00 (id, name) VALUES ('20', 'ザク');
COMMIT;
GRANT SELECT ON xx_adm.tab4_xx00 TO XX_APL1;
GRANT ALL ON xx_adm.tab4_xx00 TO XX_BAT1;

CREATE VIEW xx_adm.view1_xx00 AS SELECT * FROM xx_adm.tab1_xx00;

CREATE MATERIALIZED VIEW xx_adm.mview1_xx00  AS SELECT * FROM xx_adm.tab4_xx00;

select * from tab2_xx00;
select * from tab3_xx00;
select * from view1_xx00;
select * from mview1_xx00;


--
-- login by xy_adm
-- 

set linesize 1000
set pagesize 1000
column id format 9999
column name format a30

CREATE TABLE xy_adm.tab1_xx00 (id integer, name varchar(30));
INSERT INTO xy_adm.tab1_xx00 (id, name) VALUES ('10', '黄鬼');
INSERT INTO xy_adm.tab1_xx00 (id, name) VALUES ('20', '緑鬼');
COMMIT;
GRANT SELECT ON xy_adm.tab1_xx00 TO XX_APL1;
GRANT ALL ON xy_adm.tab1_xx00 TO XX_BAT1;

CREATE TABLE xy_adm.tab2_xx00 (id integer, name varchar(30));
INSERT INTO xy_adm.tab2_xx00 (id, name) VALUES ('10', 'りんご');
INSERT INTO xy_adm.tab2_xx00 (id, name) VALUES ('20', 'いちご');
COMMIT;
GRANT SELECT ON xy_adm.tab2_xx00 TO XX_APL1;
GRANT ALL ON xy_adm.tab2_xx00 TO XX_BAT1;

CREATE TABLE xy_adm.tab3_xx00 (id integer, name varchar(30));
INSERT INTO xy_adm.tab3_xx00 (id, name) VALUES ('10', 'じゃがいも');
INSERT INTO xy_adm.tab3_xx00 (id, name) VALUES ('20', 'たまねぎ');
COMMIT;
GRANT SELECT ON xy_adm.tab3_xx00 TO XX_APL1;
GRANT ALL ON xy_adm.tab3_xx00 TO XX_BAT1;

CREATE TABLE xy_adm.tab4_xx00 (id integer, name varchar(30));
INSERT INTO xy_adm.tab4_xx00 (id, name) VALUES ('10', 'アムロ');
INSERT INTO xy_adm.tab4_xx00 (id, name) VALUES ('20', 'シャア');
COMMIT;
GRANT SELECT ON xy_adm.tab4_xx00 TO XX_APL1;
GRANT ALL ON xy_adm.tab4_xx00 TO XX_BAT1;

CREATE VIEW xy_adm.view1_xx00 AS SELECT * FROM xy_adm.tab1_xx00;

CREATE MATERIALIZED VIEW xy_adm.mview1_xx00  AS SELECT * FROM xy_adm.tab4_xx00;

select * from tab2_xx00;
select * from tab3_xx00;
select * from view1_xx00;
select * from mview1_xx00;



--
-- login by xx_apl1
-- 

select * from xx_adm.tab2_xx00;
select * from xx_adm.tab3_xx00;
select * from xx_adm.view1_xx00;
select * from xx_adm.mview1_xx00;
select * from xy_adm.tab2_xx00;
select * from xy_adm.tab3_xx00;
select * from xy_adm.view1_xx00;
select * from xy_adm.mview1_xx00;

