#!/bin/sh
FILE_NAME=node_exporter-0.15.1.linux-amd64
INSTALL_PATH=https://github.com/prometheus/node_exporter/releases/download/v0.15.1/$FILE_NAME

cd /usr/local/src
sudo wget $INSTALL_PATH.tar.gz
sudo tar -C /usr/local -xvf $FILE_NAME
cd /usr/local
sudo mv node_exporter-* node_exporter

sudo ln -s /usr/local/node_exporter/node_exporter /bin/node_exporter
node_exporter --version

sudo cat << 'EOF' | sudo tee /etc/init/node_exporter.conf
# Run node_exporter
start on startup

script
   /bin/node_exporter
 end script
EOF

sudo service node_exporter start
