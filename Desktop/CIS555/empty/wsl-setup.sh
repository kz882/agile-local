#!/bin/bash

    cp /etc/apt/sources.list .
    echo "deb http://cz.archive.ubuntu.com/ubuntu bionic main universe" >> sources.list
    sudo cp sources.list /etc/apt
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk openjdk-11-source maven git zip libswt-gtk-4-java libwebkitgtk-dev
    #git config --global core.sshCommand "ssh -i /vagrant/cis555-key"

    wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/2020-12/R/eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz > /dev/null 2&>1
    tar xzf eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz
    cp -r eclipse /usr/lib/
    sudo ln -s /usr/lib/eclipse/eclipse /bin/eclipse

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
