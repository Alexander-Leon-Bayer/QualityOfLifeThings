#!/bin/bash

function create_ssh_key() {
  read -p "Enter a name for the SSH key: " key_name
  ssh-keygen -t ecdsa -b 256 -m pem -f ~/.ssh/"$key_name" -N ""
  cat ~/.ssh/"$key_name".pub | pbcopy
  echo "Your public key has been copied to your clipboard, paste it into GitHub after the next step. Under SSH and GPG keys."

  read -p "Do you want to add GitHub to your SSH config file? (y/n) " response
  if [[ $response =~ ^[Yy]$ ]]; then
    if [ ! -f ~/.ssh/config ]; then
      touch ~/.ssh/config
      echo "" >> ~/.ssh/config
      echo "Host *" >> ~/.ssh/config
      echo "    IdentitiesOnly yes" >> ~/.ssh/config
      echo "    IdentityFile ~/.ssh/$key_name" >> ~/.ssh/config
      echo "Created SSH config file"
  fi
  open "https://github.com/settings/keys"
  fi
}

create_ssh_key