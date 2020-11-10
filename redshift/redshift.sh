#/bin/bash

echo "DB_USER_LIST: taud_adm xx_adm xx_apl1 xx_bat1 xx_ipls xy_adm login_failure"

ENDPOINT=dba-ra-taud-t-iwkdba.cvi5dfinktjm.ap-northeast-1.redshift.amazonaws.com

if [ -n "${DB_USER}" ]; then
    echo "DB_USER: ${DB_USER}"
else
    echo -n "DB_USER: "
    read DB_USER
fi

if [ -z $DB_USER ]; then
    echo "no user end."
    exit
elif [ $DB_USER == "taud_adm" ]; then
    export PGPASSWORD="9UW7apTtH6ogr#u+"
    psql -d taud -U taud_adm -h $ENDPOINT -p 5439
elif [ $DB_USER == "xx_adm" ]; then
    export PGPASSWORD="X0xx_adm_pass"
    psql -d xx00 -U xx_adm   -h $ENDPOINT -p 5439
elif [ $DB_USER == "xx_apl1" ]; then
    export PGPASSWORD="X0xx_apl1_pass"
    psql -d xx00 -U xx_apl1  -h $ENDPOINT -p 5439
elif [ $DB_USER == "xx_bat1" ]; then
    export PGPASSWORD="X0xx_bat1_pass"
    psql -d xx00 -U xx_bat1  -h $ENDPOINT -p 5439
elif [ $DB_USER == "xx_ipls" ]; then
    export PGPASSWORD="X0xx_ipls_pass"
    psql -d xx00 -U xx_ipls  -h $ENDPOINT -p 5439
elif [ $DB_USER == "xy_adm" ]; then
    export PGPASSWORD="Y0xy_adm_pass"
    psql -d xy00 -U xy_adm   -h $ENDPOINT -p 5439
elif [ $DB_USER == "login_failure" ]; then
    export PGPASSWORD="xx_adm_dba"
    psql -d xx00 -U xx_adm   -h $ENDPOINT -p 5439
else
    echo "no user end."
    exit
fi

