#!/bin/bash

##Functions##
user_exists() {
    getent passwd "$1" >/dev/null 2>&1
  }

user_name_selection() {
    case "$USER_COUNT" in
       0) TARGET_USER="velociraptor" ;;
       1) TARGET_USER="tim" ;;
       2) TARGET_USER="lex" ;;
       3) TARGET_USER="dr,ian-malcolm" ;;
       4) TARGET_USER="the-lawyer" ;;
    esac
}


##Allows for Functions to be easily accesed##
TARGET_USER=""
USER_COUNT="0"

## User Creations ## 
while ["$USER_COUNT" -lt 5 ]; do

    echo "
################################
##       Creating Users       ##
################################
"
    ## Sets User for Search
    user_name_selection
    ##Checking For the User##
    echo "Checking if Exists"
    if user_exists "$TARGET_USER"; then
      echo ""$TARGET_USER" exists skipping user creation"
    else 
      echo "$TARGET_USER doesn't exist begin creating user...."
      sudo useradd "$TARGET_USER"
      ## User Created ##
      read -p "$TARGET_USER Created, Password Prompting is Next"
      sudo passwd $TARGET_USER
      echo "Password Created!!"
      getent passwd | grep $TARGET_USER
      
    fi

    USER_COUNT+$((USER_COUNT + 1))
done



