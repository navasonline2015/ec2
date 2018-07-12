#!/usr/bin/bash 
aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|{Instance_Id: .InstanceId,Public_Dns: .PublicDnsName,Public_IP: .PublicIpAddress,Private_Ip: .PrivateIpAddress,Vpc: .VpcId,Image_Id: .ImageId,Status: .State.Name}'
