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
string1='InstanceId:.InstanceId'
string2='Public_Dns:.PublicDnsName'
string3='Public_IP:.PublicIpAddress' 
string4='Private_Ip:.PrivateIpAddress'
string5='Vpc:.VpcId'
string6='Image_Id:.ImageId'
string7='Status:.State.Name'
string8='SubnetId:.SubnetId'
string9='InstanceType:.InstanceType'
string10="$string1,$string2,$string3,$string4,$string5,$string6,$string7,$string8,$string9"
n=1

for i in $choice;
   do
	
        if [ $i == 1 ];then
           if [ `howmany $choice` == 1 ]; then
               command_string+="$string1"
	   elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
		command_string+=",$string1"
	   elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
		command_string+="$string1"
           fi 
        elif [ $i == 2 ];then   
           if [ `howmany $choice` == 1 ];then
               command_string+="$string2"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string2"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string2"
           fi

        elif [ $i == 3 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string3"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string3"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string3"
           fi

	elif [ $i == 4 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string4"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string4"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string4"
           fi

	elif [ $i == 5 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string5"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string5"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string5"
           fi

	elif [ $i == 6 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string6"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string6"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string6"
           fi

	elif [ $i == 7 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string7"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string7"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string7"
           fi
	elif [ $i == 8 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string8"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string8"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string8"
           fi
	elif [ $i == 9 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string9"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string9"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string9"
           fi
	elif [ $i == 10 ];then
           if [ `howmany $choice` == 1 ];then
               command_string+="$string10"
           elif [ `howmany $choice` > 1 ] && [ $n != 1 ];then
                command_string+=",$string10"
           elif [ `howmany $choice` > 1 ] && [ $n == 1 ];then
                command_string+="$string9"
           fi

        fi


   ((n++))
 done    
echo `aws ec2 describe-instances | jq -r -C ".Reservations[].Instances[]|{$command_string}"`