#/bin/bash

ENDPOINT=koizumi-dev-cls-aurora-mysql-1st.cluster-cp18wjhx9brf.eu-north-1.rds.amazonaws.com

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
    mysql -h $ENDPOINT -P 3306 -u masteruser -p"Admin123!" -D masterdb

elif [ $DB_USER == "xx_adm" ]; then
    mysql -h $ENDPOINT -P 3306 -u xx_adm -pxx_adm_pass -D xx00

elif [ $DB_USER == "xx_apl1" ]; then
    mysql -h $ENDPOINT -P 3306 -u xx_apl1 -pxx_apl1_pass -D xx00

elif [ $DB_USER == "xx_bat1" ]; then
    mysql -h $ENDPOINT -P 3306 -u xx_bat1 -pxx_bat1_pass -D xx00

elif [ $DB_USER == "xx_ipls" ]; then
    mysql -h $ENDPOINT -P 3306 -u xx_ipls -pxx_ipls_pass -D xx00

elif [ $DB_USER == "xy_adm" ]; then
    mysql -h $ENDPOINT -P 3306 -u xy_adm -pxy_adm_pass -D xy00

elif [ $DB_USER == "login_failure" ]; then
    mysql -h $ENDPOINT -u xx_adm -peeeeee -D xx00

else
    echo "no user end."
    exit
fi

