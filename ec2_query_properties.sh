#!/usr/bin/bash
IFS="$ "
echo ""
echo "1. Display Instance Ids"
echo "2. Display Public Dns Name"
echo "3. Display Public Ip Address"
echo "4. Display Private Ip Address"
echo "5. Display Vpc IDs"
echo "6. Display Image IDs"
echo "7. Display Instance Status"
echo "8. Display SubnetId"
echo "9. Display InstanceType"
echo "10. All of the Above"
printf "choose from above, Use space if you want to display more Properties (Eg: 1 3 5) :"
read choice

howmany() { echo $#; }
n=1
for i in $choice;
do
	if [ $i == 10 ] && [ `howmany $choice` == 1 ];
	then
   	  echo `aws ec2 describe-instances | jq -r -C ".Reservations[].Instances[]|{InstanceId:.InstanceId,Public_Dns:.PublicDnsName,Public_IP:.PublicIpAddress,Private_Ip:.PrivateIpAddress,Vpc:.VpcId,Image_Id:.ImageId,Status:.State.Name,SubnetId:.SubnetId,InstanceType:.InstanceType}"| grep -v '{}'`
	else
  		if [ $i == 1 ]; then
    		  string1='InstanceId:.InstanceId'
         	  string=$string1
  		elif [ $i == 2 ]; then
    		  string2='Public_Dns:.PublicDnsName'
    		  string=$string2
  		elif [ $i == 3 ]; then
    		  string3='Public_IP:.PublicIpAddress'
    		  string=$string3
  		elif [ $i == 4 ]; then
    		  string4='Private_Ip:.PrivateIpAddress'
    		  string=$string4
 		elif [ $i == 5 ]; then
    		  string5='Vpc:.VpcId'
    		  string=$string5
 		elif [ $i == 6 ]; then
    		  string6='Image_Id:.ImageId'
    		  string=$string6
		 elif [ $i == 7 ]; then
    		  string7='Status:.State.Name'
    		  string=$string7
 		elif [ $i == 8 ]; then
    		  string8='SubnetId:.SubnetId'
    		  string=$string8
 		elif [ $i == 9 ]; then
    		 string9='InstanceType:.InstanceType'
    		 string=$string9
 		fi 
	
 		if [ `howmany $choice` == 1 ] || [ `howmany $choice` > 1 ] && [ $n == 1 ]; then
                  command_string+="$string"
		
		elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
		  command_string+=",$string"
		fi
	fi   
 ((n++))
done
echo `aws ec2 describe-instances | jq -r -C ".Reservations[].Instances[]|{$command_string}"`
