#!/bin/bash
if [ ${EUID:-${UID}} != 0 ]; then
    echo "Try: sudo $0"
	exit 1
fi
#
# Install Docker
echo `cat /proc/uptime | cut -f 1 -d ' '`  Installing: docker
apt update && apt-get install -y curl jq bash-completion
if [ ! -f /usr/bin/docker ]; then sh -c 'curl -sSL https://get.docker.com/ | sh'; fi

# docker-compose - https://docs.docker.com/compose/install/
if [ ! $(which docker-compose) ] ; then
	echo `cat /proc/uptime | cut -f 1 -d ' '`  Installing: docker-compose
	#curl -sL $(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[] | select(.name | test(\\\"`uname -s`-`uname -m`$\\\")) | .browser_download_url") -o /usr/local/bin/docker-compose
	DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
	curl -sL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
	curl -sL https://raw.githubusercontent.com/docker/compose/${DOCKER_COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
	docker-compose --version
fi
