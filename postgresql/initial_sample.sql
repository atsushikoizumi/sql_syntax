--
-- login by master user
--
-- ユーザー作成
CREATE ROLE xx_adm WITH LOGIN PASSWORD 'xx_adm_pass';
CREATE ROLE xx_apl1 WITH LOGIN PASSWORD 'xx_apl1_pass';
CREATE ROLE xx_bat1 WITH LOGIN PASSWORD 'xx_bat1_pass' NOINHERIT;
CREATE ROLE xx_ipls WITH LOGIN PASSWORD 'xx_ipls_pass';
CREATE ROLE xy_adm WITH LOGIN PASSWORD 'xy_adm_pass';


-- マスターユーザーに db-owner の権限を付与
GRANT xx_adm TO aurora;
GRANT xx_ipls TO aurora;
GRANT xy_adm TO aurora;

-- xx_bat1 に xx_adm の権限を付与
GRANT xx_adm TO xx_bat1;


-- データベース作成
CREATE DATABASE xx00 lc_collate 'ja_JP.UTF-8' lc_ctype 'ja_JP.UTF-8' ENCODING 'UTF8' TEMPLATE template0 OWNER xx_adm;
CREATE DATABASE xy00 lc_collate 'ja_JP.UTF-8' lc_ctype 'ja_JP.UTF-8' ENCODING 'UTF8' TEMPLATE template0 OWNER xy_adm;


-- public ロールのデータベースアクセス権限を剥奪
REVOKE ALL ON DATABASE postgres FROM public;
REVOKE ALL ON DATABASE aurora FROM public;
REVOKE ALL ON DATABASE xx00 FROM public;
REVOKE ALL ON DATABASE xy00 FROM public;


-- データベースアクセス権限付与
GRANT CONNECT ON DATABASE xx00 TO xx_apl1;
GRANT CONNECT, TEMPORARY ON DATABASE xx00 TO xx_bat1;
GRANT CONNECT, TEMPORARY ON DATABASE xx00 TO xx_ipls;
GRANT CONNECT ON DATABASE xy00 TO xx_apl1;
GRANT CONNECT, TEMPORARY ON DATABASE xy00 TO xx_bat1;


-- スキーマ作成
\c xx00
ALTER SCHEMA public OWNER TO xx_adm;
REVOKE ALL ON SCHEMA public FROM public;
CREATE SCHEMA xx_adm AUTHORIZATION xx_adm;
CREATE SCHEMA xx_ipls AUTHORIZATION xx_ipls;

-- スキーマへのCREATE,USAGE権限を付与
GRANT ALL ON SCHEMA xx_adm TO xx_adm;
GRANT ALL ON SCHEMA xx_ipls TO xx_adm;
GRANT ALL ON SCHEMA xx_ipls TO xx_ipls;

-- スキーマへのアクセス権限を付与
GRANT USAGE ON SCHEMA xx_adm TO xx_apl1;
GRANT USAGE ON SCHEMA xx_adm TO xx_bat1;
GRANT USAGE ON SCHEMA xx_ipls TO xx_apl1;
GRANT USAGE ON SCHEMA xx_ipls TO xx_bat1;


-- スキーマ作成
\c xy00
ALTER SCHEMA public OWNER TO xy_adm;
REVOKE ALL ON SCHEMA public FROM public;
CREATE SCHEMA xy_adm AUTHORIZATION xy_adm;

-- スキーマへのCREATE,USAGE権限を付与
GRANT ALL ON SCHEMA xy_adm TO xy_adm;

-- スキーマへのUSAGE権限を付与
GRANT USAGE ON SCHEMA xy_adm TO xx_apl1;
GRANT USAGE ON SCHEMA xy_adm TO xx_bat1;


-- サーチパス変更
ALTER ROLE xx_adm IN DATABASE xx00 SET search_path TO xx_adm,xx_ipls;
ALTER ROLE xx_apl1 IN DATABASE xx00 SET search_path TO xx_adm,xx_ipls;
ALTER ROLE xx_bat1 IN DATABASE xx00 SET search_path TO xx_adm,xx_ipls;
ALTER ROLE xx_ipls IN DATABASE xx00 SET search_path TO xx_ipls;
ALTER ROLE xy_adm IN DATABASE xx00 SET search_path TO xx_adm,xx_ipls;

ALTER ROLE xx_adm IN DATABASE xy00 SET search_path TO xy_adm;
ALTER ROLE xx_apl1 IN DATABASE xy00 SET search_path TO xy_adm;
ALTER ROLE xx_bat1 IN DATABASE xy00 SET search_path TO xy_adm;
ALTER ROLE xx_ipls IN DATABASE xy00 SET search_path TO xy_adm;
ALTER ROLE xy_adm IN DATABASE xy00 SET search_path TO xy_adm;


--
-- login by xx_adm
--
-- テーブル作成
\c xx00
CREATE TABLE xx_adm.tab1_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab1_xx00 (id, name) VALUES ('10', '赤鬼');
INSERT INTO xx_adm.tab1_xx00 (id, name) VALUES ('20', '青鬼');
CREATE TABLE xx_adm.tab2_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab2_xx00 (id, name) VALUES ('10', 'みかん');
INSERT INTO xx_adm.tab2_xx00 (id, name) VALUES ('20', 'もも');
CREATE TABLE xx_adm.tab3_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab3_xx00 (id, name) VALUES ('10', 'にんじん');
INSERT INTO xx_adm.tab3_xx00 (id, name) VALUES ('20', 'だいこん');
CREATE TABLE xx_adm.tab4_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab4_xx00 (id, name) VALUES ('10', 'ガンダム');
INSERT INTO xx_adm.tab4_xx00 (id, name) VALUES ('20', 'ザク');
CREATE TABLE xx_adm.tab5_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab5_xx00 (id, name) VALUES ('10', '東京都');
INSERT INTO xx_adm.tab5_xx00 (id, name) VALUES ('20', '千葉県');
CREATE TABLE xx_adm.tab6_xx00 (id integer, name varchar(10));
INSERT INTO xx_adm.tab6_xx00 (id, name) VALUES ('10', '山崎');
INSERT INTO xx_adm.tab6_xx00 (id, name) VALUES ('20', '白州');
select * from tab6_xx00;

GRANT SELECT ON ALL TABLES IN SCHEMA xx_adm TO xx_apl1;
GRANT ALL ON ALL TABLES IN SCHEMA xx_adm TO xx_bat1;


--
-- login by xx_ipls
--
-- テーブル作成
\c xx00
CREATE TABLE xx_ipls.itab1_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab1_xx00 (id, name) VALUES ('10', '黄鬼');
INSERT INTO xx_ipls.itab1_xx00 (id, name) VALUES ('20', '緑鬼');
CREATE TABLE xx_ipls.itab2_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab2_xx00 (id, name) VALUES ('10', 'りんご');
INSERT INTO xx_ipls.itab2_xx00 (id, name) VALUES ('20', 'いちご');
CREATE TABLE xx_ipls.itab3_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab3_xx00 (id, name) VALUES ('10', 'ほうれん草');
INSERT INTO xx_ipls.itab3_xx00 (id, name) VALUES ('20', 'ねぎ');
CREATE TABLE xx_ipls.itab4_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab4_xx00 (id, name) VALUES ('10', 'シャア');
INSERT INTO xx_ipls.itab4_xx00 (id, name) VALUES ('20', 'アムロ');
CREATE TABLE xx_ipls.itab5_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab5_xx00 (id, name) VALUES ('10', '神奈川県');
INSERT INTO xx_ipls.itab5_xx00 (id, name) VALUES ('20', '沖縄県');
CREATE TABLE xx_ipls.itab6_xx00 (id integer, name varchar(10));
INSERT INTO xx_ipls.itab6_xx00 (id, name) VALUES ('10', 'ワイン');
INSERT INTO xx_ipls.itab6_xx00 (id, name) VALUES ('20', '焼酎');
select * from itab6_xx00;

GRANT ALL ON TABLES IN SCHEMA xx_ipls TO xx_adm;
GRANT SELECT ON ALL TABLES IN SCHEMA xx_ipls TO xx_apl1;
GRANT ALL ON ALL TABLES IN SCHEMA xx_ipls TO xx_bat1;


--
-- login by xy_adm
--
-- テーブル作成
\c xy00
CREATE TABLE xy_adm.tab1_xy00 (id integer, name varchar(10));
INSERT INTO xy_adm.tab1_xy00 (id, name) VALUES ('10', '赤鬼');
INSERT INTO xy_adm.tab1_xy00 (id, name) VALUES ('20', '青鬼');
select * from tab1_xy00;

GRANT SELECT ON ALL TABLES IN SCHEMA xy_adm TO xx_apl1;
GRANT ALL ON ALL TABLES IN SCHEMA xy_adm TO xx_bat1;


--
-- login by xx_apl1
--
\c xx00
select * from tab5_xx00;
select * from itab6_xx00;

\c xy00
select * from tab1_xy00;
