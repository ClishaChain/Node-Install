#!/bin/bash

# Create systemd Service File
cd /etc/systemd/system
echo "Starting ClishaChain..."
echo "
	[Unit]
	Description=Clisha Node Service
	[Service]
	Type=simple
	Restart=always
	RestartSec=1
	User=$USER
	Group=$USER
	LimitNOFILE=4096
	WorkingDirectory=/home/$USER/node/
	ExecStart=/home/$USER/node/../besu/bin/besu --data-path=./besu/node/data --genesis-file=./besu/node/genesis.json --bootnodes=enode://d07678140bcfb5c9f9986f2b36dedb1c3e0ed1a270220caebada14966cbd1f33116bde87416dc76d7eeba38a4f28a83561fc4aa0c67766223076221547de29d3@134.195.198.233:30303 enode://1059a2b16f531b475a06e8370eb16ac2e50e9e663dd2d05dd40d6136875bee5040dc154d6df47b892513265a1143cb80ff0aea50c693400cc516f1552b0b26b4@158.51.120.41:30303 --p2p-port=30303 --rpc-http-enabled=true --rpc-http-api=ETH,NET,WEB3,TRACE,TXPOOL --host-allowlist="*" --rpc-http-cors-origins="all" --revert-reason-enabled=true --rpc-http-port=8545 --data-storage-format=FOREST --sync-mode=FULL
	[Install]
	WantedBy=multi-user.target
" | sudo tee besu.service

if grep -q ForwardToSyslog=yes "/etc/systemd/journald.conf"; then
  sudo sed -i '/#ForwardToSyslog=yes/c\ForwardToSyslog=no' /etc/systemd/journald.conf
  sudo sed -i '/ForwardToSyslog=yes/c\ForwardToSyslog=no' /etc/systemd/journald.conf
elif ! grep -q ForwardToSyslog=no "/etc/systemd/journald.conf"; then
  echo "ForwardToSyslog=no" | sudo tee -a /etc/systemd/journald.conf
fi
cd -
echo

# Start systemd Service
sudo systemctl force-reload systemd-journald
sudo systemctl daemon-reload
sudo systemctl start besu.service
sudo systemctl enable besu.service

read -n 1 -s -r -p "Service successfully started! Press any key to continue..."
echo
