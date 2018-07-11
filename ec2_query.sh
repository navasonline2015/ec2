#!/usr/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Error: you missed number of instances. usage : $0 <NUMBER>" 
fi
ex_resources=$(aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|[.ImageId,.VpcId,.KeyName,.SecurityGroups[].GroupId]'| grep  -v '\[\|\]'|awk -F ',' '{print $1}')
i="1"
while [ "$i" -le 4 ]
do
 for resource in $ex_resources;
  do
     if [ "$i" -eq 1 ]; then
        ImageId="$resource"
    elif [ "$i" -eq 2 ]; then
        VpcId="$resource"
    elif [ "$i" -eq 3 ]; then
        KeyName="$resource"
    elif [ "$i" -eq 4 ]; then
        Sec_Group="$resource"
    else
	:
    fi
    i=$[$i+1]
 done
done
exec `aws ec2 run-instances  --image-id $ImageId  --security-group-ids $Sec_Group  --count $1 --instance-type t2.micro  --key-name $KeyName`

