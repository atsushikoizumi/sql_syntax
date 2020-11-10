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
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U taud_adm -P RkyHjCKckqzKwG3th3BQ -d taud
elif [ $DB_USER == "xx_adm" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xx_adm -P xx_adm_pass -d xx00
elif [ $DB_USER == "xx_apl1" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xx_apl1 -P xx_apl1_pass -d xx00
elif [ $DB_USER == "xx_bat1" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xx_bat1 -P xx_bat1_pass -d xx00
elif [ $DB_USER == "xx_ipls" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xx_ipls -P xx_ipls_pass -d xx00
elif [ $DB_USER == "xy_adm" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xy_adm -P xy_adm_pass -d xy00
elif [ $DB_USER == "login_failure" ]; then
    sqlcmd -S rds-t-iwkdba-rd-s-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com,1433 -U xx_adm -P xy_adm_pass -d xy00
else
    echo "no user end."
    exit
fi

