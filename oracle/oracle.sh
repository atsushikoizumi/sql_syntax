#/bin/bash

echo "DB_USER_LIST: taud_adm xa_adm xa_apl1 xa_bat1 xb_adm login_failure"

if [ -n "${DB_USER}" ]; then
    echo "DB_USER: ${DB_USER}"
else
    echo -n "DB_USER: "
    read DB_USER
fi

if [ $DB_USER == "taud_adm" ]; then
    sqlplus taud_adm/YP59#2XGhURCqF+x@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
elif [ $DB_USER == "xa_adm" ]; then
    sqlplus xa_adm/XA_ADM_DBA@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
elif [ $DB_USER == "xa_apl1" ]; then
    sqlplus xa_apl1/XA_APL1_PASS@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
elif [ $DB_USER == "xa_bat1" ]; then
    sqlplus xa_bat1/XA_BAT1_PASS@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
elif [ $DB_USER == "xb_adm" ]; then
    sqlplus xb_adm/XB_ADM_DBA@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
elif [ $DB_USER == "login_failure" ]; then
    sqlplus -L xa_adm/00_ADM_DBA@rds-t-iwkdba-rd-o-01.cw9rwrcfymul.ap-northeast-1.rds.amazonaws.com:1521/TAUD
else
    echo "$DB_USER not exists."
fi


