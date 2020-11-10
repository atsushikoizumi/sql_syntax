#/bin/bash

ENDPOINT=koizumi-dev-cls-aurora-postgres-1st.cluster-cp18wjhx9brf.eu-north-1.rds.amazonaws.com

echo "DB_USER_LIST: masteruser xx_adm xx_apl1 xx_bat1 xx_ipls xy_adm login_failure"

if [ -n "${DB_USER}" ]; then
    echo "DB_USER: ${DB_USER}"
else
    echo -n "DB_USER: "
    read DB_USER
fi

if [ -z $DB_USER ]; then
    echo "no user end."
    exit
elif [ $DB_USER == "masteruser" ]; then
    export PGPASSWORD="Admin123!"
    psql -d masterdb -U masteruser -h $ENDPOINT -p 5432
elif [ $DB_USER == "xx_adm" ]; then
    export PGPASSWORD="xx_adm_pass"
    psql -d xx00 -U xx_adm   -h $ENDPOINT -p 5432
elif [ $DB_USER == "xx_apl1" ]; then
    export PGPASSWORD="xx_apl1_pass"
    psql -d xx00 -U xx_apl1  -h $ENDPOINT -p 5432
elif [ $DB_USER == "xx_bat1" ]; then
    export PGPASSWORD="xx_bat1_pass"
    psql -d xx00 -U xx_bat1  -h $ENDPOINT -p 5432
elif [ $DB_USER == "xx_ipls" ]; then
    export PGPASSWORD="xx_ipls_pass"
    psql -d xx00 -U xx_ipls  -h $ENDPOINT -p 5432
elif [ $DB_USER == "xy_adm" ]; then
    export PGPASSWORD="xy_adm_pass"
    psql -d xy00 -U xy_adm   -h $ENDPOINT -p 5432
elif [ $DB_USER == "login_failure" ]; then
    export PGPASSWORD="00_adm_pass"
    psql -d xx00 -U xx_adm   -h $ENDPOINT -p 5432
else
    echo "no user end."
    exit
fi

