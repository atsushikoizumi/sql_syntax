/*** create role ***/
CREATE ROLE test_user_role IDENTIFIED BY "test_user_pass";


/*** grant ***/
GRANT CREATE SESSION TO test_user_role;
GRANT UNLIMITED TABLESPACE TO test_user;

GRANT test_user_role TO test_user;
GRANT DBA TO test_user;


/*** alter role ***/
ALTER ROLE test_user_role NOT IDENTIFIED;

