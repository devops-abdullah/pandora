#!/bin/bash
function pandora() {
if systemctl list-units | grep 'pandora_agent_daemon.service'; then
  echo "[Pandora Agent] Already installed ....!!!" |& tee -a $LOG
else
  echo "[Pandora Agent] Adding repositories" |& tee -a $LOG
  wget https://excellmedia.dl.sourceforge.net/project/pandora/Pandora%20FMS%207.0NG/730/RHEL_CentOS/pandorafms_agent_unix-7.0NG.730-1.noarch.rpm |& tee -a $LOG
  yum install perl-IO-Compress-Zlib perl-Sys-Syslog -y |& tee -a $LOG
  rpm -i pandorafms_agent_unix-7.0NG.730-1.noarch.rpm |& tee -a $LOG
  echo "[Pandora Agent] Installed" |& tee -a $LOG
  git clone https://github.com/devops-abdullah/pandora.git && \
  cat pandora.conf > /etc/pandora/pandora_agent.conf
fi
}
pandora
