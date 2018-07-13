#!/usr/bin/bash -x 
IFS="$" ""
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

string1="Instance_Id: .InstanceId"
string2="Public_Dns: .PublicDnsName"
string3="Public_IP: .PublicIpAddress"
string4="Private_Ip: .PrivateIpAddress"
string5="Vpc: .VpcId"
string="Image_Id: .ImageId"
string="Status: .State.Name"
argumnents='1 2 3 4 5 6 7'
 for i in $choice;
 do
  if [ `howmany $choice` == 1 ];
  then
     if [ $i == 1 ];
     then
      command_string+="$string$i"
     fi
  elif [ `howmany $choice` > 1 ];
  then
    if [  $i == 2 ];
    then
    command_string+=",$string$i"
    fi
  fi
 done    
`aws ec2 describe-instances | jq -r ".Reservations[].Instances[]|{$command_string}"`
