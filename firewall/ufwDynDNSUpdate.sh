```bash

#!/bin/bash

# this script will check the IP of a hostname (in our case, our 3 homelab wan connections)
# and if they have changed, update ufw accordingly.
# you can run this out of cron.d every minute or so.

HOSTNAME1=fiber.secunit.io
HOSTNAME2=vzw.secunit.io
HOSTNAME3=twc.secunit.io
SSH_PORT=22

#Create a cron /15 * * * * root bash /path/to/dynamicdnsupdater.sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo -e "checking if any of our homelab wan connections needs to be updated in ufw ..."

new_ip1=$(host $HOSTNAME1 | head -n1 | cut -f4 -d ' ')
old_ip1=$(/usr/sbin/ufw status | grep $HOSTNAME1 | head -n1 | tr -s ' ' | cut -f3 -d ' ')
if [ "$new_ip1" = "$old_ip1" ] ; then
    echo -e "   ip address has not changed for: \e[92mfiber\e[39m"
else
    if [ -n "$old_ip1" ] ; then
        /usr/sbin/ufw delete allow from $old_ip1 to any port $SSH_PORT
    fi
    /usr/sbin/ufw allow from $new_ip1 to any port $SSH_PORT comment $HOSTNAME1
    echo -e "fiber ip has been updated from $old_ip1 to $new_ip1" | s-nail -v -s "fiber ip update for server.ca" -S smtp-use-starttls -S ssl-verify=ignore -S smtp=smtp://home.x86txt.com:587 -S from="matt@secunit.io" -S ssl-verify=ignore matt@secunit.io
    echo "   ufw has been updated for: \e[91mfiber\e[39m"
fi
new_ip2=$(host $HOSTNAME2 | head -n1 | cut -f4 -d ' ')
old_ip2=$(/usr/sbin/ufw status | grep $HOSTNAME2 | head -n1 | tr -s ' ' | cut -f3 -d ' ')
if [ "$new_ip2" = "$old_ip2" ] ; then
    echo -e "   ip address has not changed for: \e[92mvzw\e[39m"
else
    if [ -n "$old_ip2" ] ; then
        /usr/sbin/ufw delete allow from $old_ip2 to any port $SSH_PORT
    fi
    /usr/sbin/ufw allow from $new_ip2 to any port $SSH_PORT comment $HOSTNAME2
    echo -e "vzw ip has been updated from $old_ip2 to $new_ip2" | s-nail -v -s "vzw ip update for server.ca" -S smtp-use-starttls -S ssl-verify=ignore -S smtp=smtp://home.x86txt.com:587 -S from="matt@secunit.io" -S ssl-verify=ignore matt@secunit.io
    echo -e "   ufw has been updated for: \e[91mvzw\e[39m"
fi
new_ip3=$(host $HOSTNAME3 | head -n1 | cut -f4 -d ' ')
old_ip3=$(/usr/sbin/ufw status | grep $HOSTNAME3 | head -n1 | tr -s ' ' | cut -f3 -d ' ')
if [ "$new_ip3" = "$old_ip3" ] ; then
    echo -e "   ip address has not changed for: \e[92mtwc\e[39m"
else
    if [ -n "$old_ip3" ] ; then
        /usr/sbin/ufw delete allow from $old_ip3 to any port $SSH_PORT
    fi
    /usr/sbin/ufw allow from $new_ip3 to any port $SSH_PORT comment $HOSTNAME3
    echo -e "twc ip has been updated from $old_ip3 to $new_ip3" | s-nail -v -s "twc ip update for server.ca" -S smtp-use-starttls -S ssl-verify=ignore -S smtp=smtp://home.x86txt.com:587 -S from="matt@secunit.io" -S ssl-verify=ignore matt@secunit.io
    echo -e "   ufw has been updated for: \e[91mtwc\e[39m"
fi
exit 0

```
