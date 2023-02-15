#!/bin/bash

function create_ssh_key() {
  read -p "Enter a name for the SSH key: " key_name
  ssh-keygen -t ecdsa -b 256 -m pem -f ~/.ssh/"$key_name" -N ""
  cat ~/.ssh/"$key_name".pub | pbcopy
  echo "Your public key has been copied to your clipboard, paste it into GitHub in the next step. Under SSH and GPG keys."
  open "https://github.com/settings/keys"

  read -p "Do you want to add GitHub to your SSH config file? (y/n) " response
  if [[ $response =~ ^[Yy]$ ]]; then
    if [ ! -f ~/.ssh/config ]; then
      touch ~/.ssh/config
      echo "" >> ~/.ssh/config
      echo "Host *" >> ~/.ssh/config
      echo "    IdentitiesOnly yes" >> ~/.ssh/config
      echo "Created SSH config file"
    elif ! grep -q "^Host github.com$" ~/.ssh/config; then
      echo "" >> ~/.ssh/config
      echo "Host github.com" >> ~/.ssh/config
      echo "    IdentityFile ~/.ssh/$key_name" >> ~/.ssh/config
      echo "    IdentitiesOnly yes" >> ~/.ssh/config
      echo "Added GitHub host to SSH config file"
    else
      echo "SSH config file already contains GitHub host"
    fi
  fi
}

create_ssh_key