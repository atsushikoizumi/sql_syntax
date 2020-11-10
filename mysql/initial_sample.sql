-- CREATE USER
CREATE USER `xx_adm`@`%` IDENTIFIED BY 'xx_adm_pass' ACCOUNT UNLOCK;
CREATE USER `xx_apl1`@`%` IDENTIFIED BY 'xx_apl1_pass' ACCOUNT UNLOCK;
CREATE USER `xx_bat1`@`%` IDENTIFIED BY 'xx_bat1_pass' ACCOUNT UNLOCK;
CREATE USER `xx_ipls`@`%` IDENTIFIED BY 'xx_ipls_pass' ACCOUNT UNLOCK;
CREATE USER `xy_adm`@`%` IDENTIFIED BY 'xy_adm_pass' ACCOUNT UNLOCK;
select user, host from mysql.user;
select current_user(),database();

-- mysql_config_editor set -G NAME -h host -u db_user -p -P 3306
-- mysql_config_editor print --all
-- mysql_config_editor print --login-path=NAME
-- mysql --login-path=NAME


-- CREATE DATABASE
CREATE DATABASE xx00 CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE DATABASE xy00 CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
select SCHEMA_NAME, DEFAULT_CHARACTER_SET_NAME, DEFAULT_COLLATION_NAME from INFORMATION_SCHEMA.SCHEMATA;


-- GRANT
GRANT ALL ON xx00.* TO `xx_adm`@`%` WITH GRANT OPTION;
GRANT SELECT ON xx00.* TO `xx_apl1`@`%`;
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON xx00.* TO `xx_bat1`@`%`;
GRANT ALL ON xx00.* TO `xx_ipls`@`%`;

GRANT ALL ON xy00.* TO `xx_adm`@`%`;
GRANT SELECT ON xy00.* TO `xx_apl1`@`%`;
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON xy00.* TO `xx_bat1`@`%`;
GRANT ALL ON xy00.* TO `xy_adm`@`%` WITH GRANT OPTION;

SHOW GRANTS FOR `xx_adm`@`%`;
SHOW GRANTS FOR `xx_apl1`@`%`;
SHOW GRANTS FOR `xx_bat1`@`%`;
SHOW GRANTS FOR `xx_ipls`@`%`;
SHOW GRANTS FOR `xy_adm`@`%`;


-- CREATE TABLE in xx00
CREATE TABLE xx00.tab1_xx00 (id integer, name varchar(10));
INSERT INTO xx00.tab1_xx00 (id, name) VALUES ('10', '赤鬼');
INSERT INTO xx00.tab1_xx00 (id, name) VALUES ('20', '青鬼');
SELECT * FROM xx00.tab1_xx00;

CREATE TABLE xx00.tab2_xx00 (id integer, name varchar(10));
INSERT INTO xx00.tab2_xx00 (id, name) VALUES ('10', 'みかん');
INSERT INTO xx00.tab2_xx00 (id, name) VALUES ('20', 'もも');
SELECT * FROM xx00.tab2_xx00;

CREATE TABLE xx00.tab3_xx00 (id integer, name varchar(12));
INSERT INTO xx00.tab3_xx00 (id, name) VALUES ('10', 'にんじん');
INSERT INTO xx00.tab3_xx00 (id, name) VALUES ('20', 'だいこん');
SELECT * FROM xx00.tab3_xx00;

CREATE TABLE xx00.tab4_xx00 (id integer, name varchar(12));
INSERT INTO xx00.tab4_xx00 (id, name) VALUES ('10', '神奈川県');
INSERT INTO xx00.tab4_xx00 (id, name) VALUES ('20', '千葉県');
SELECT * FROM xx00.tab4_xx00;

CREATE TABLE xx00.tab5_xx00 (id integer, name varchar(12));
INSERT INTO xx00.tab5_xx00 (id, name) VALUES ('10', '大江戸線');
INSERT INTO xx00.tab5_xx00 (id, name) VALUES ('20', '山手線');
SELECT * FROM xx00.tab5_xx00;

CREATE TABLE xx00.tab6_xx00 (id integer, name varchar(10));
INSERT INTO xx00.tab6_xx00 (id, name) VALUES ('10', '山崎');
INSERT INTO xx00.tab6_xx00 (id, name) VALUES ('20', '白州');
SELECT * FROM xx00.tab6_xx00;



-- CREATE TABLE in xx00
CREATE TABLE xx00.itab1_xx00 (id integer, name varchar(10));
INSERT INTO xx00.itab1_xx00 (id, name) VALUES ('10', '紫鬼');
INSERT INTO xx00.itab1_xx00 (id, name) VALUES ('20', '黒鬼');
SELECT * FROM xx00.itab1_xx00;

CREATE TABLE xx00.itab2_xx00 (id integer, name varchar(12));
INSERT INTO xx00.itab2_xx00 (id, name) VALUES ('10', 'なし');
INSERT INTO xx00.itab2_xx00 (id, name) VALUES ('20', 'きゅうい');
SELECT * FROM xx00.itab2_xx00;

CREATE TABLE xx00.itab3_xx00 (id integer, name varchar(12));
INSERT INTO xx00.itab3_xx00 (id, name) VALUES ('10', 'きゃべつ');
INSERT INTO xx00.itab3_xx00 (id, name) VALUES ('20', 'いんげん');
SELECT * FROM xx00.itab3_xx00;

CREATE TABLE xx00.itab4_xx00 (id integer, name varchar(10));
INSERT INTO xx00.itab4_xx00 (id, name) VALUES ('10', 'まぐろ');
INSERT INTO xx00.itab4_xx00 (id, name) VALUES ('20', 'かつお');
SELECT * FROM xx00.itab4_xx00;

CREATE TABLE xx00.itab5_xx00 (id integer, name varchar(12));
INSERT INTO xx00.itab5_xx00 (id, name) VALUES ('10', 'ガンダム');
INSERT INTO xx00.itab5_xx00 (id, name) VALUES ('20', 'ザク');
SELECT * FROM xx00.itab5_xx00;


GRANT SELECT ON xx00.tab1_xx00 TO `xy_adm`@`%`;
GRANT SELECT ON xx00.tab2_xx00 TO `xy_adm`@`%`;
GRANT SELECT ON xx00.tab3_xx00 TO `xy_adm`@`%`;
GRANT SELECT ON xx00.tab4_xx00 TO `xy_adm`@`%`;
GRANT SELECT ON xx00.tab5_xx00 TO `xy_adm`@`%`;
GRANT SELECT ON xx00.tab6_xx00 TO `xy_adm`@`%`;


-- xy_adm
CREATE TABLE xy00.tab1_xy00 (id integer, name varchar(10));
INSERT INTO xy00.tab1_xy00 (id, name) VALUES ('10', '黄鬼');
INSERT INTO xy00.tab1_xy00 (id, name) VALUES ('20', '緑鬼');
SELECT * FROM xy00.tab1_xy00;

GRANT SELECT ON xy00.tab1_xy00 TO `xx_ipls`@`%`;


