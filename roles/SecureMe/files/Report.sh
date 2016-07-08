#! /bin/bash

#Display Audit logs summarily
printf "Today is $(date)" > /home/test/WAOUHMEHost/Audit/SummaryReport.log
aureport >> /home/test/WAOUHMEHost/Audit/SummaryReport.log

#Display kind of failure authentication logs
printf "Today is $(date)" > /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
aureport -au --failed --summary >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
printf "Authentication Failure\n" >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
awk '($(NF-1) = /authentication failure/){print $NF}' /var/log/auth.log | sort | uniq -c | sort -n >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
printf "No passwd entry for the set user\n" >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
awk '($(NF-1) = /No passwd entry for user/){print $NF}' /var/log/auth.log | sort | uniq -c | sort -n >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
printf "Any Failed Action\n" >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
awk '($(NF-1) = /FAILED/){print $NF}' /var/log/auth.log | sort | uniq -c | sort -n >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
printf "Any Invalid Action\n" >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log
awk '($(NF-1) = /Invalid/){print $NF}' /var/log/auth.log | sort | uniq -c | sort -n >> /home/test/WAOUHMEHost/Audit/FailedAuthReport.log

# Display Fail2ban Warnings
awk '($(NF-1) = /WARNING/){print;}' /var/log/fail2ban.log | sort | uniq -c | sort -n > /home/test/WAOUHMEHost/Audit/Fail2banWARNINGS.log

