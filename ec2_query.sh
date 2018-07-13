#!/usr/bin/bash -x 
IFS=""

printf "choose from below, Use space if you want to display more Properties (Eg: 1 3 5) :"
read choice
echo ""
echo "1. Display Instance Ids"
echo "2. Display Public Dns Name"
echo "3. Display Public Ip Address"
echo "4. Display Private Ip Address"
echo "5. Display Vpc IDs"
echo "6. Display Image IDs"
echo "7. Display Instance Status"
howmany() { echo $#; }

n=1

command="aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|{"
InstanceId_String="Instance_Id: .InstanceId"
PublicDns_String="Public_Dns: .PublicDnsName"
PublicIp_String="Public_IP: .PublicIpAddress"
PrivateIp_String="Private_Ip: .PrivateIpAddress"
VpcId_String="Vpc: .VpcId"
ImageId_String="Image_Id: .ImageId"
Status_String="Status: .State.Name"



for i in `echo $choice | tr " " "\n"`;
do


  if [ $i == 1 ] && [ $n == 1 ] && [ `howmany $choice` == 1]; then
        command_string="aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|{$InstanceId_String}'"

  elif [ $i == 1 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$InstanceId_String"

  elif [ $i == 1 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$InstanceId_String"
  else
	:	
  fi


  if [ $i == 2 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$PublicDns_String"

  elif [ $i == 2 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$PublicDns_String"

  elif [ $i == 2 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$PublicDns_String"
  else
	:	
  fi
  

  if [ $i == 3 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$PublicIp_String"

  elif [ $i == 3 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$PublicIp_String"

  elif [ $i == 3 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$PublicIp_String"
  else
	:	
  fi

  if [ $i == 4 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$PrivateIp_String"

  elif [ $i == 4 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$PrivateIp_String"

  elif [ $i == 4 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$PrivateIp_String"
  else
	:	
  fi

  if [ $i == 5 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$VpcId_String"

  elif [ $i == 5 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$VpcId_String"

  elif [ $i == 5 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$VpcId_String"
  else
	:	
  fi
  
  if [ $i == 6 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$ImageId_String"

  elif [ $i == 6 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$ImageId_String"

  elif [ $i == 6 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$ImageId_String"
  else
	:	
  fi
  
  if [ $i == 7 ] && [ $n == 1 ] && [ `howmany $choice` == 1 ]; then
        command_string="$Status_String"

  elif [ $i == 7 ] && [ $n > 1 ] && [ `howmany $choice` > 1 ]; then
	command_string=",$Status_String"

  elif [ $i == 7 ] && [ $n == 1 ] && [ `howmany $choice` > 1 ]; then
        command_string="$Status_String"
  else
	:	
  fi


  ((n++))

done
echo $command_string
