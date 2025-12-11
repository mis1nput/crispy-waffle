
#!/Bin/Bash

folder-check-creation(){
  if [ -d "$DIR-PATH" ]; then
      echo '$DIR-PATH' Exists Skipping
  else
      echo "'$DIR-PATH' Doesn't Exist, Starting Creation"
      mkdir $DIR-PATH
      ls $DIR-PATH
  fi
  DIR-COUNT=$((DIR-COUNT+1))
}

change-dir(){
  case "$DIR-COUNT" in
  0) $DIR-PATH="/isla-nublar" ;;
  1) $DIR-PATH="/isla-nublar/visitor-center" ;;
  2) $DIR-PATH="/isla-nublar/visitor-center/kitchen" ;;
  esac
} 

create-files(){
  cd $DIR-PATH
  touch ice-cream.txt
  touch jello.txt
}

give-permissions(){
  $DIR-COUNT="1"
  change-dir
  chmod 777 $DIR-PATH
  $DIR-COUNT="2"
  change-dir
  chmod 700 $DIR-PATH
  setfacl -m u:velociraptor:rwx $DIR-PATH
  setfacl -m u:tim:rwx $DIR-PATH
  setfacl -m u:lex:rwx $DIR-PATH
  chmod 700 ice-cream.txt
  chmod 700 jello.txt
  setfacl -m u:tim:rwx ice-cream.txt
  setfacl -m u:lex:rwx jello.txt
}


DIR-PATH = ""
DIR-COUNT = ""

