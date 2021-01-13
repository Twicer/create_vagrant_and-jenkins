#!/bin/bash
echo "============Create 2 virtual machine==============="
sleep 3
vagrant up
echo "============Install Jenkins============"
sleep 3
vagrant ssh Centos -- -t 'mkdir ~/ansible/; cd ~/ansible/; git init; git config user.email "mokovski11@gmail.com"; git config user.name "mokovski"; git clone https://mokovski:Android016!@github.com/mokovski/create_vagrant_and-jenkins.git master; cd master/; sudo ansible-playbook playbook.yml; sudo ansible-playbook docker_ubunt.yml'
echo "============Install and configerd Docker And run Images============"
sleep 3
vagrant ssh ubuntu -- -t 'mkdir ~/docker/; cd docker/; git init; git config user.email "mokovski11@gmail.com";  git config user.name "mokovski"; git clone https://mokovski:Android016!@github.com/mokovski/docker.git master; cd master/; docker run -dit -p 8090:80 test:latest; sudo docker run -dit -p 8090:80 test:latest'
echo "============Check status of Nginx============"
sleep 3
vagrant ssh Centos -- -t 'curl http://10.0.0.101:8090'
