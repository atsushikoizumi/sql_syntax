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
    mysql --login-path=taud_adm -D taud
elif [ $DB_USER == "xx_adm" ]; then
    mysql --login-path=xx_adm -D xx00
elif [ $DB_USER == "xx_apl1" ]; then
    mysql --login-path=xx_apl1 -D xx00
elif [ $DB_USER == "xx_bat1" ]; then
    mysql --login-path=xx_bat1 -D xx00
elif [ $DB_USER == "xx_ipls" ]; then
    mysql --login-path=xx_ipls -D xx00
elif [ $DB_USER == "xy_adm" ]; then
    mysql --login-path=xy_adm -D xy00
elif [ $DB_USER == "login_failure" ]; then
    mysql -h rds-t-iwkdba-au-m-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com -u xx_adm -peeeeee -D xx00
else
    echo "no user end."
    exit
fi

