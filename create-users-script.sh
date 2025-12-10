#!/bin/bash

echo "
##############################
##      Creating Users      ## 
##############################
"

echo "
## Creating User Velociraptor ##
"

sudo useradd "velociraptor"
## User Created ##
echo "Please Enter a Password for User"
sudo passwd velociraptor
echo "Password Created!!"
getent passwd | grep velociraptor


