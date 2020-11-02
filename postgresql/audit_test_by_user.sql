
-- login by user
\c xx00
INSERT INTO xx_adm.tab5_xx00 (id, name) VALUES ('30', '大阪府');
SELECT * FROM xx_adm.tab5_xx00;
UPDATE xx_adm.tab5_xx00 SET name = '京都府' WHERE id = 30;
DELETE FROM xx_adm.tab5_xx00 WHERE id = 30;
TRUNCATE TABLE xx_adm.tab5_xx00;
INSERT INTO xx_adm.tab5_xx00 (id, name) VALUES ('10', '東京都');
INSERT INTO xx_adm.tab5_xx00 (id, name) VALUES ('20', '千葉県');
