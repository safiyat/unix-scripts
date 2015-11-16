echo -n "Enter remote username: "
read REMOTEUSER
echo -n "Enter remote hostname/ip: "
read REMOTEHOST
ssh-copy-id $REMOTEUSER@$REMOTEHOST

