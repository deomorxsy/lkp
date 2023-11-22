#!/usr/bin/bash
# setting systemctl enable ssh in the bastion machine

#allHosts=("ip1" "ip2")
BAST_USER="bcl01"
BAST_IP="10.1.4.174"
# ip a | grep enp | awk 'NR==2{print $2}'

ssh-keygen -t ecdsa -f $HOME/.ssh/id_ecdsa_auth-keys -N "" 

cat $HOME/.ssh/id_ecdsa_auth-keys.pub >> $HOME/.ssh/authorized_keys
ssh-copy-id $HOME/.ssh/authorized_keys $BAST_USER@$BAST_IP


#for ipaddr in ${allHosts[@]}; do
#done

