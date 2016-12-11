# Installs Python, Ansible, and the Docker Engine on the host
#
#!/bin/bash

echo '====[ STARTING PROVISIONING ]===='

tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum -y install epel-release
yum -y update

yum -y install python-pip ansible docker-engine
python --version
pip --version
ansible --version
docker --version

systemctl enable docker.service
systemctl start docker

docker run --rm hello-world

echo '====[ PROVISIONING COMPLETE ]===='