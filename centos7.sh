#!/bin/bash
secrets='./secrets/secrets.json'
path='./centos7-md/centos7-md.json'

if ! [ -x "$(command -v packer)" ]; then
  echo "Packer not found - exiting"
else
  if [[ -e $secrets && -e $path ]]; then
      echo "Packer exec found, files found - starting deploy"
      packer validate -var-file="$secrets" "$path"
      if [ $? -ne 0 ]; then
        echo "Packer validation failed - exiting"
        exit 1
      else
        echo "Building image"
        packer build -var-file=$secrets $path
      fi
  else
    echo "Secret: $secrets or path $path does not exist"
    exit 1
  fi
fi
