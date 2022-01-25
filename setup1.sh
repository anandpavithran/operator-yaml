#!/bin/bash
cd /root
git clone https://github.com/anandpavithran/operator-yaml
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
tar -C /usr/local -xzf /root/go1.17.6.linux-amd64.tar.gz
rm -rf /root/go*
echo "PATH=\$PATH:/usr/local/go/bin" >> /root/.bash_profile
echo "GOPATH=/usr/local/go" >> /root/.bash_profile
source /root/.bash_profile
cd /root 
mkdir -p $GOPATH/src/github.com/operator-framework
cd $GOPATH/src/github.com/operator-framework
git clone https://github.com/operator-framework/operator-sdk
cd operator-sdk
git checkout tags/v0.19.4 -b v0.19.4
dnf install make -y
make tidy
make install
cd /root
operator-sdk new web --kind=Web --api-version=web.operator.io/v1 --type=ansible
cd /root/web
cp /root/operator-yaml/main.yml /root/web/roles/web/tasks/main.yml 
kill -9 $(pgrep bash)
