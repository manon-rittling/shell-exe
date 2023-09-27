cd /home/manon/shell.exe/job08
nbreco=$(grep "manon" /var/log/auth.log | wc -l)

date=$(date +%F-%T)

echo "$nbreco" "$date" > "number_connection_$date.txt"

mv "number_connection_$date.txt" "backup"

tar -cvf "backup/number_connection_$date.tar" "backup/number_connection_$date.txt"



