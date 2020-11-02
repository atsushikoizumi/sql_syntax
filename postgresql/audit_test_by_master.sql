
-- login by master user
CREATE ROLE xx_text WITH LOGIN PASSWORD 'xx_test_pass';
ALTER ROLE xx_text WITH NOLOGIN;
DROP ROLE xx_text;

CREATE DATABASE xx99 lc_collate 'ja_JP.UTF-8' lc_ctype 'ja_JP.UTF-8' ENCODING 'UTF8' TEMPLATE template0;
DROP DATABASE xx99;

\c xx00
CREATE TABLE xx_adm.family (family_id int,first_name VARCHAR(20),last_name VARCHAR(25));
INSERT INTO xx_adm.family VALUES(1,'atsushi','koizumi');
INSERT INTO xx_adm.family VALUES(2,'emiri','moromizato');
SELECT * FROM xx_adm.family;
UPDATE xx_adm.family SET last_name = 'koizumi' WHERE family_id=2;
DELETE FROM xx_adm.family WHERE family_id=1;
GRANT ALL ON xx_adm.family TO xx_apl1;
REVOKE ALL ON xx_adm.family FROM xx_apl1;
TRUNCATE TABLE xx_adm.family;
ALTER TABLE xx_adm.family ALTER COLUMN last_name TYPE varchar(80);
DROP TABLE xx_adm.family;
