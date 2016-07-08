#! /bin/bash

# Display auditd status
printf "Today is $(date)\n" > /home/test/WAOUHMEHost/Audit/Status.log
printf "Auditd Settings\n" >> /home/test/WAOUHMEHost/Audit/Status.log
auditctl -s >> /home/test/WAOUHMEHost/Audit/Status.log

# Display auditd set rules
printf "Auditd Rules\n" >> /home/test/WAOUHMEHost/Audit/Status.log
auditctl -l >> /home/test/WAOUHMEHost/Audit/Status.log

# Display fail2ban status
fail2ban-client status >> /home/test/WAOUHMEHost/Audit/Status.log

