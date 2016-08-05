if which docker-compose > /dev/null; then
    echo "docker-compose already installed. Skipping ..."
else
    curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
    sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi
