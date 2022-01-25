#!/bin/bash
echo Enter your QUAY Account name:
read var1
echo Enter your QUAY Account Password:
read -r -s var2
podman login quay.io -u $var1 -p $var2
if [ $? -eq 0 ]
then
operator-sdk build quay.io/$var1/web --image-builder podman 
podman push quay.io/$var1/web:latest

else
echo "Something goes wrong"
fi
