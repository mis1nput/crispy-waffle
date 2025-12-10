#!/bin/bash

##Functions##
user_exists() {
    getent passwd "$1" >/dev/null 2>&1
  }


##Allows for Functions to be easily accesed##
TARGET_USER=""

echo "
 _____                _   _               _   _                   
/  __ \              | | (_)             | | | |                  
| /  \/_ __ ___  __ _| |_ _ _ __   __ _  | | | |___  ___ _ __ ___ 
| |   | '__/ _ \/ _` | __| | '_ \ / _` | | | | / __|/ _ \ '__/ __|
| \__/\ | |  __/ (_| | |_| | | | | (_| | | |_| \__ \  __/ |  \__ \
 \____/_|  \___|\__,_|\__|_|_| |_|\__, |  \___/|___/\___|_|  |___/
                                   __/ |                          
                                  |___/                           

"

echo "
################################
## Creating User Velociraptor ##
################################
"
## Sets User for Search
TARGET_USER="velociraptor"
##Checking For the User##
if user_exists "$TARGET_USER"; then
  echo "User exists skipping user creation"
else 
  sudo useradd "velociraptor"
  ## User Created ##
  read -p "User Created, Password Prompting is Next"
  sudo passwd velociraptor
  echo "Password Created!!"
  getent passwd | grep velociraptor
fi




