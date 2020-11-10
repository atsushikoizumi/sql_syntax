#/bin/bash

echo "DB_USER_LIST: taud_adm xx_adm xx_apl1 xx_bat1 xx_ipls xy_adm login_failure"

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
    export PGPASSWORD="YP59#2XGhURCqF+x"
    psql -d taud -U taud_adm -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "xx_adm" ]; then
    export PGPASSWORD="xx_adm_pass"
    psql -d xx00 -U xx_adm   -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "xx_apl1" ]; then
    export PGPASSWORD="xx_apl1_pass"
    psql -d xx00 -U xx_apl1  -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "xx_bat1" ]; then
    export PGPASSWORD="xx_bat1_pass"
    psql -d xx00 -U xx_bat1  -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "xx_ipls" ]; then
    export PGPASSWORD="xx_ipls_pass"
    psql -d xx00 -U xx_ipls  -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "xy_adm" ]; then
    export PGPASSWORD="xy_adm_pass"
    psql -d xy00 -U xy_adm   -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
elif [ $DB_USER == "login_failure" ]; then
    export PGPASSWORD="00_adm_pass"
    psql -d xx00 -U xx_adm   -h rds-t-iwkdba-au-p-01.cluster-cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -p 5432
else
    echo "no user end."
    exit
fi

