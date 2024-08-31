#!/bin/bash

USER=$(whoami)
FILE_PATH="/home/${USER}/domains/${USER}.serv00.net/vless"
CRON_Vless="${FILE_PATH}/check_vless.sh >/dev/null 2>&1"
CRON_JOB="*/12 * * * * ${CRON_Vless}"
echo "重启 check_vless"
${CRON_Vless}
# 检查定时任务是否存在，不存在添加
(crontab -l | grep -F "$CRON_JOB") || (crontab -l; echo "$CRON_JOB") | crontab -
