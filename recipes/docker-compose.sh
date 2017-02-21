#!/usr/bin/env bash
should_install=1
last_release=`\curl -i https://api.github.com/repos/docker/compose/releases | grep "\"tag_name\"" | tr "\"" " " | awk '{print $3}' | head -1`
if which docker-compose > /dev/null; then
  installed_version=`docker-compose -v | awk '{print $3}' | tr -d ","`
  if [[ "$installed_version" = "$last_release" ]]; then
      should_install=0
  fi
fi

if [[ "$should_install" = "0" ]]; then
  echo "########## latest version of docker-compose already installed. Skipping ..."
else
  echo "########## Installing docker-compose ..."
  \curl -L https://github.com/docker/compose/releases/download/${last_release}/docker-compose-`uname -s`-`uname -m` > docker-compose
  sudo mv docker-compose /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi
