/*** create tablespace ***/
CREATE TABLESPACE tbs_test_user_01;
CREATE TABLESPACE tbs_test_user_01_02;

ALTER TABLESPACE  tbs_test_user_01 RESIZE 200M;


/*** create user ***/
CREATE PROFILE prof_test_user LIMIT 
  FAILED_LOGIN_ATTEMPTS 10
  PASSWORD_LIFE_TIME    366
;

CREATE USER test_user
 IDENTIFIED BY "test_user_dummy"
 DEFAULT TABLESPACE tbs_test_user_01
 TEMPORARY TABLESPACE temp
;


/*** alter user ***/
ALTER PROFILE prof_test_user LIMIT 
  FAILED_LOGIN_ATTEMPTS UNLIMITED
  PASSWORD_LIFE_TIME    UNLIMITED
;

ALTER USER test_user IDENTIFIED BY "test_user_pass" ;


