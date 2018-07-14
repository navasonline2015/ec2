#!/usr/bin/bash -x 
IFS=","
echo ""
echo "1. Display Instance Ids"
echo "2. Display Public Dns Name"
echo "3. Display Public Ip Address"
echo "4. Display Private Ip Address"
echo "5. Display Vpc IDs"
echo "6. Display Image IDs"
echo "7. Display Instance Status"
printf "choose from above, Use space if you want to display more Properties (Eg: 1 3 5) :"
read choice

howmany() { echo $#; }
string="InstanceId:.InstanceId, Public_Dns:.PublicDnsName, Public_IP:.PublicIpAddress, Private_Ip:.PrivateIpAddress, Vpc:.VpcId, Image_Id:.ImageId, Status:.State.Name"
n=1
for i in $choice;
 do
   for m in $string;
    do
        if [ `howmany $choice` == 1 ];
     	then
      	    command_string+=""
  	elif [ `howmany $choice` > 1 ] && [ $n == 1 ];
  	then
    	      command_string+="$[string$i]"
  	elif [ `howmany $choice` > 1 ] && [ $n > 1 ];
  	then
    	      command_string+=",$[string$i]"
        fi
   ((n++))
 done    
#"`aws ec2 describe-instances | jq -r ".Reservations[].Instances[]|{$command_string}"`"
