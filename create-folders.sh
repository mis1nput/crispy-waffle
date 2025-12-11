
#!/bin/bash

folder_check_creation(){
  if [ -d "$DIR_PATH" ]; then
      echo "'$DIR_PATH' Exists Skipping"
  else
      echo "'$DIR_PATH' Doesn't Exist, Starting Creation"
      sudo mkdir -p "$DIR_PATH"
      ls "$DIR_PATH"
  fi
  DIR_COUNT=$((DIR_COUNT+1))
}

change_dir(){
  case "$DIR_COUNT" in
  0) DIR_PATH="/isla-nublar" ;;
  1) DIR_PATH="/isla-nublar/visitor-center" ;;
  2) DIR_PATH="/isla-nublar/visitor-center/kitchen" ;;
  esac
} 

create_files(){
  cd "$DIR_PATH"
  touch ice-cream.txt
  touch jello.txt
}

give_permissions(){
  DIR_COUNT=1
  change_dir
  chmod 777 "$DIR_PATH"
  DIR_COUNT=2
  change_dir
  chmod 700 "$DIR_PATH"
  setfacl -m u:velociraptor:rwx "$DIR_PATH"
  setfacl -m u:tim:rwx "$DIR_PATH"
  setfacl -m u:lex:rwx "$DIR_PATH"
  chmod 700 ice-cream.txt
  chmod 700 jello.txt
  setfacl -m u:tim:rwx "$DIR_PATH/ice-cream.txt"
  setfacl -m u:lex:rwx "$DIR_PATH/jello.txt"
}


DIR_PATH=""
DIR_COUNT=0

while [ "$DIR_COUNT" -lt 3 ]; do
  change_dir
  folder_check_creation
done
create_files
give_permissions
