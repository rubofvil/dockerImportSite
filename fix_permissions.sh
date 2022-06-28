#!/bin/bash

LOCAL_PATH=`pwd`
LOCAL_USER=$(whoami)

#----------------------------------------------------------------------------------------
# FUNCTIONS
#----------------------------------------------------------------------------------------

fix_ssh_permissions(){
  # SSH
  echo "====> Fixing ssh permissions   <===="
  sudo chmod ug+rwx,o-rwx "$LOCAL_PATH/ssh"
  sudo chown -R ${LOCAL_USER}:${LOCAL_USER} "$LOCAL_PATH/ssh"
  sudo chmod ugo-rwx,u+rw "$LOCAL_PATH/ssh/id_rsa"
  sudo chmod ugo-rwx,ug+rw "$LOCAL_PATH/ssh/id_rsa.pub"

  # Repositories
  sudo chown -R ${LOCAL_USER}:${LOCAL_USER} "$LOCAL_PATH/repositories"
}

fix_ssh_permissions