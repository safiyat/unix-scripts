IPs="1.2.3.4 2.3.4.5 hostname1 hostname2"
password="my_secret_password"
cmd="ls"
user="user"

for ip in $IPs
do
    sshpass -p $password ssh $user@$ip $cmd
done
