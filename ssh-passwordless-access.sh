echo -n "Enter remote username: "
read REMOTEUSER
echo -n "Enter remote hostname/ip: "
read REMOTEHOST
cat .ssh/id_rsa.pub | ssh $REMOTEUSER@$REMOTEHOST 'cat >> .ssh/authorized_keys'
