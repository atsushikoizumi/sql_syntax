
-- Login(Server)作成
-- DEFAULT_DATABASE の設定は multiAZ では変更できない。
CREATE LOGIN xx_adm WITH PASSWORD = 'xx_adm_pass', DEFAULT_LANGUAGE = Japanese;
CREATE LOGIN xx_apl1 WITH PASSWORD = 'xx_apl1_pass', DEFAULT_LANGUAGE = Japanese;
CREATE LOGIN xx_bat1 WITH PASSWORD = 'xx_bat1_pass', DEFAULT_LANGUAGE = Japanese;
CREATE LOGIN xx_ipls WITH PASSWORD = 'xx_ipls_pass', DEFAULT_LANGUAGE = Japanese;
CREATE LOGIN xy_adm WITH PASSWORD = 'xy_adm_pass', DEFAULT_LANGUAGE = Japanese;


-- ALter Login
-- DEFAULT_DATABASE の変更は multiAZ では変更できない。
ALTER LOGIN xx_adm WITH DEFAULT_LANGUAGE = English;
ALTER LOGIN xx_adm WITH DEFAULT_LANGUAGE = Japanese;


-- ALter Role
-- マスターユーザーでもサーバーロールの変更権限はない。
ALTER ROLE securityadmin ADD MEMBER xx_adm;
ALTER ROLE securityadmin ADD MEMBER xy_adm;
ALTER ROLE securityadmin ADD MEMBER xx_bat1;
ALTER ROLE securityadmin DROP MEMBER xx_bat1;


-- Create Database
CREATE DATABASE xx00 COLLATE Japanese_CI_AS;
CREATE DATABASE xy00 COLLATE Japanese_CI_AS;


-- Drop Database
-- multiAZ では変更できない。


------------------------------------------------------------------
use xx00
GO

-- Create Database User　
CREATE USER xx_adm FOR LOGIN xx_adm WITH DEFAULT_SCHEMA = xx_adm;
GO
CREATE USER xx_apl1 FOR LOGIN xx_apl1 WITH DEFAULT_SCHEMA = xx_adm;
GO
CREATE USER xx_bat1 FOR LOGIN xx_bat1 WITH DEFAULT_SCHEMA = xx_adm;
GO
CREATE USER xx_ipls FOR LOGIN xx_ipls WITH DEFAULT_SCHEMA = xx_ipls;
GO
CREATE USER xy_adm FOR LOGIN xy_adm WITH DEFAULT_SCHEMA = xx_ipls;
GO


-- Alter Database Role セットするロールはデフォルトで存在するものを使用
ALTER ROLE db_owner ADD MEMBER xx_adm;
GO
ALTER ROLE db_datareader ADD MEMBER xx_apl1;
GO
ALTER ROLE db_datawriter ADD MEMBER xx_bat1;
GO
ALTER ROLE db_ddladmin DROP MEMBER xx_ipls;
GO


-- Create Schema
CREATE SCHEMA xx_adm AUTHORIZATION xx_adm;
GO
CREATE SCHEMA xx_ipls AUTHORIZATION xx_ipls;
GO


------------------------------------------------------------------
use xx00
GO

-- CREATE TABLE
create table xx_adm.tab1_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab1_xx00 (id, name) VALUES ('10', '赤鬼');
INSERT INTO tab1_xx00 (id, name) VALUES ('20', '青鬼');
GO
select * from tab1_xx00;

create table tab2_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab2_xx00 (id, name) VALUES ('10', 'みかん');
INSERT INTO tab2_xx00 (id, name) VALUES ('20', 'もも');
GO
select * from tab2_xx00;

create table tab3_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab3_xx00 (id, name) VALUES ('10', 'にんじん');
GO
INSERT INTO tab3_xx00 (id, name) VALUES ('20', 'だいこん');
GO
select * from tab3_xx00;

create table tab4_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab4_xx00 (id, name) VALUES ('10', 'ガンダム');
GO
INSERT INTO tab4_xx00 (id, name) VALUES ('20', 'ザク');
GO
select * from tab4_xx00;

create table tab5_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab5_xx00 (id, name) VALUES ('10', '東京都');
GO
INSERT INTO tab5_xx00 (id, name) VALUES ('20', '千葉県');
GO
select * from tab5_xx00;

create table tab6_xx00 (id integer, name varchar(10));
GO
INSERT INTO tab6_xx00 (id, name) VALUES ('10', '山崎');
GO
INSERT INTO tab6_xx00 (id, name) VALUES ('20', '白州');
GO
select * from tab6_xx00;


-- GRANT XXX ON SCHEMA xx_adm TO xxx;
GRANT SELECT ON xx_adm.tab1_xx00 TO xx_bat1,xx_ipls;
GO
GRANT SELECT ON xx_adm.tab2_xx00 TO xx_bat1,xx_ipls;
GO
GRANT SELECT ON xx_adm.tab3_xx00 TO xx_bat1,xx_ipls;
GO
GRANT SELECT ON xx_adm.tab4_xx00 TO xx_bat1,xx_ipls;
GO
GRANT SELECT ON xx_adm.tab5_xx00 TO xx_bat1,xx_ipls;
GO
GRANT SELECT ON xx_adm.tab6_xx00 TO xx_bat1,xx_ipls;
GO


------------------------------------------------------------------
-- xx_ipls

-- CREATE TABLE
create table itab1_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab1_xx00 (id, name) VALUES ('10', '黄鬼');
GO
INSERT INTO itab1_xx00 (id, name) VALUES ('20', '緑鬼');
GO
select * from itab1_xx00;

create table itab2_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab2_xx00 (id, name) VALUES ('10', 'りんご');
GO
INSERT INTO itab2_xx00 (id, name) VALUES ('20', 'いちご');
GO
select * from itab2_xx00;

create table itab3_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab3_xx00 (id, name) VALUES ('10', 'ほうれん草');
GO
INSERT INTO itab3_xx00 (id, name) VALUES ('20', 'ねぎ');
GO
select * from itab3_xx00;

create table itab4_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab4_xx00 (id, name) VALUES ('10', 'シャア');
GO
INSERT INTO itab4_xx00 (id, name) VALUES ('20', 'アムロ');
GO
select * from itab4_xx00;

create table itab5_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab5_xx00 (id, name) VALUES ('10', '神奈川県');
GO
INSERT INTO itab5_xx00 (id, name) VALUES ('20', '沖縄県');
GO
select * from itab5_xx00;

create table itab6_xx00 (id integer, name varchar(10));
GO
INSERT INTO itab6_xx00 (id, name) VALUES ('10', 'ワイン');
GO
INSERT INTO itab6_xx00 (id, name) VALUES ('20', '焼酎');
GO
select * from itab6_xx00;

----------------------------------------------------------
use xy00
GO


-- Create Database User　
CREATE USER xx_adm FOR LOGIN xx_adm WITH DEFAULT_SCHEMA = xy_adm;
GO
CREATE USER xx_apl1 FOR LOGIN xx_apl1 WITH DEFAULT_SCHEMA = xy_adm;
GO
CREATE USER xx_bat1 FOR LOGIN xx_bat1 WITH DEFAULT_SCHEMA = xy_adm;
GO
CREATE USER xx_ipls FOR LOGIN xx_ipls WITH DEFAULT_SCHEMA = xy_adm;
GO
CREATE USER xy_adm FOR LOGIN xy_adm WITH DEFAULT_SCHEMA = xy_adm;
GO


-- Alter Database Role ※セットするロールはデフォルトで存在するものを使用
ALTER ROLE db_accessadmin ADD MEMBER xx_adm;
GO
ALTER ROLE db_datareader ADD MEMBER xx_apl1;
GO
ALTER ROLE db_datawriter ADD MEMBER xx_bat1;
GO
ALTER ROLE db_ddladmin DROP MEMBER xx_ipls;
GO
ALTER ROLE db_owner ADD MEMBER xy_adm;
GO


-- Create Schema
CREATE SCHEMA xy_adm AUTHORIZATION xy_adm;
GO
create table xy_adm.tab1_xy00 (id integer, name varchar(10));
GO
INSERT INTO xy_adm.tab1_xy00 (id, name) VALUES ('10', '赤鬼');
GO
INSERT INTO xy_adm.tab1_xy00 (id, name) VALUES ('20', '青鬼');
GO
select * from tab1_xy00;

