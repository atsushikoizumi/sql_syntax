#/bin/bash

ENDPOINT='koizumi-dev-sqlserver-1st.cp18wjhx9brf.eu-north-1.rds.amazonaws.com,1433'

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
    sqlcmd -S $ENDPOINT -U masteruser -P 'Admin123!' -d master

elif [ $DB_USER == "xx_adm" ]; then
    sqlcmd -S $ENDPOINT -U xx_adm -P xx_adm_pass -d xx00

elif [ $DB_USER == "xx_apl1" ]; then
    sqlcmd -S $ENDPOINT -U xx_apl1 -P xx_apl1_pass -d xx00

elif [ $DB_USER == "xx_bat1" ]; then
    sqlcmd -S $ENDPOINT -U xx_bat1 -P xx_bat1_pass -d xx00

elif [ $DB_USER == "xx_ipls" ]; then
    sqlcmd -S $ENDPOINT -U xx_ipls -P xx_ipls_pass -d xx00

elif [ $DB_USER == "xy_adm" ]; then
    sqlcmd -S $ENDPOINT -U xy_adm -P xy_adm_pass -d xy00

elif [ $DB_USER == "login_failure" ]; then
    sqlcmd -S $ENDPOINT -U xx_adm -P xy_adm_pass -d xy00

else
    echo "no user end."
    exit
fi

