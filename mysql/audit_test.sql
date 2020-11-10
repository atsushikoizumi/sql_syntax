
CREATE USER `xx_test`@`%` IDENTIFIED BY 'xx_test_pass' ACCOUNT UNLOCK;
ALTER USER `xx_test`@`%` ACCOUNT LOCK;
DROP USER `xx_test`@`%`;

CREATE TABLE xx00.test_xx00 (id integer, name varchar(12));
INSERT INTO xx00.test_xx00 (id, name) VALUES ('10', 'NewYork');
INSERT INTO xx00.test_xx00 (id, name) VALUES ('20', 'washington');
INSERT INTO xx00.test_xx00 (id, name) VALUES ('30', 'las vegas');
SELECT * FROM xx00.test_xx00;
GRANT SELECT ON xx00.test_xx00 TO `xy_adm`@`%`;
REVOKE SELECT ON xx00.test_xx00 FROM `xy_adm`@`%`;
UPDATE xx00.test_xx00 SET name = 'chicago' WHERE id = 20;
DELETE FROM xx00.test_xx00;
ALTER TABLE xx00.test_xx00 RENAME TO xx00.test_xx11;
INSERT INTO xx00.test_xx11 (id, name) VALUES ('10', 'NewYork');
SELECT * FROM xx00.test_xx11;
TRUNCATE TABLE xx00.test_xx11;
DROP TABLE xx00.test_xx11;
