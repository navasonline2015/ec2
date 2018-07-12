#!/usr/bin/bash
IFS=$'\n'
printf "choose from below, Use space if you want to display more Properties (Eg: 1 3 5) :"
#choice=read
echo ""
echo "1. Display Instance Ids"
echo "2. Display Public Dns Name"
echo "3. Display Public Ip Address"
echo "4. Display Private Ip Address"
echo "5. Display Vpc IDs"
echo "6. Display Image IDs"
echo "7. Display Instance Status"
for i in `aws ec2 describe-instances | jq -r '.Reservations[].Instances[]| {Instance_Id: .InstanceId,Public_Dns: .PublicDnsName,Public_IP: .PublicIpAddress,Private_Ip: .PrivateIpAddress,Vpc: .VpcId,Image_Id: .ImageId,Status: .State.Name}'`
do
	echo "$i"| cut -d "," -f1 | awk -F '"' {'print $2,$3,$4'}  |grep "Instance_Id"
done
