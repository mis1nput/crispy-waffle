#!/bin/bash

##Functions##
user_exists() {
    getent passwd "$1" >/dev/null 2>&1
  }

user_name_selection {
    if $USER_COUNT="0"
        $TARGET_USER="velociraptor"
    if $USER_COUNT="1"
        $TARGET_USER="tim"
    if $USER_COUNT="2"
        $TARGET_USER="lex"
    if $USER_COUNT="3"
        $TARGET_USER="dr.ian-malcolm"
    if $USER_COUNT="4"
        $TARGET_USER="the-lawyer"
}


##Allows for Functions to be easily accesed##
TARGET_USER=""
USER_COUNT="0"

while [$USER_COUNT != 5]; do

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
      $USER_COUNT+1
    else 
      echo "$TARGET_USER doesn't exist begin creating user...."
      sudo useradd "$TARGET_USER"
      ## User Created ##
      read -p "$TARGET_USER Created, Password Prompting is Next"
      sudo passwd $TARGET_USER
      echo "Password Created!!"
      getent passwd | grep $TARGET_USER
      $USER_COUNT+1
    fi
done



