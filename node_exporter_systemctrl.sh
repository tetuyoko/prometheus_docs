#!/bin/sh
sudo cat << 'EOF' | sudo tee /usr/lib/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
[Service]
Type=simple
ExecStart=/bin/node_exporter
PrivateTmp=false
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable node_exporter.service
sudo systemctl start node_exporter.service
sudo systemctl status node_exporter.service -l
