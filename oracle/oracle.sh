#/bin/bash

ENDPOINT='koizumi-dev-db-oracle-1st.cp18wjhx9brf.eu-north-1.rds.amazonaws.com:1521'
SID=MASTERDB

echo "DB_USER_LIST: MASTERUSER XX_ADM XX_APL1 XX_BAT1 XY_ADM login_failure"

if [ -n "${DB_USER}" ]; then
    echo "DB_USER: ${DB_USER}"
else
    echo -n "DB_USER: "
    read DB_USER
fi

if [ $DB_USER == "MASTERUSER" ]; then
    sqlplus MASTERUSER/'Admin123!'@${ENDPOINT}/${SID}

elif [ $DB_USER == "XX_ADM" ]; then
    sqlplus XX_ADM/XX_ADM_DBA@${ENDPOINT}/${SID}

elif [ $DB_USER == "XX_APL1" ]; then
    sqlplus XX_APL1/XX_APL1_PASS@${ENDPOINT}/${SID}

elif [ $DB_USER == "XX_BAT1" ]; then
    sqlplus XX_BAT1/XX_BAT1_PASS@${ENDPOINT}/${SID}

elif [ $DB_USER == "XY_ADM" ]; then
    sqlplus XY_ADM/XY_ADM_DBA@${ENDPOINT}/${SID}

elif [ $DB_USER == "login_failure" ]; then
    sqlplus -L XX_ADM/00_ADM_DBA@${ENDPOINT}/${SID}

else
    echo "$DB_USER not exists."
fi


