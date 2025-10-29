


.
├── etc
│   ├── sudoers
│   └── systemd
│       └── system
│           ├── lowbatt-check.service
│           └── lowbatt-check.timer
│  
│  
│  
│  
│  
│ sudo systemctl daemon-reload 
│ sudo systemctl enable --now lowbatt-check.timer 
│  journalctl -u lowbatt-check.service -e
│ systemctl list-timers | grep lowbatt 
│  
└── usr
    └── local
        └── bin
            ├── force-poweroff.sh   ==> chown root:root, chmod 700
            └── lowbatt-check.sh	==> chown root:root, chmod 700


Below is for waybar or polybar from battery-notify custom script,
if battery is below 10% it will run from polybar or waybar:

sudo EDITOR=vim visudo and include below lines

%wheel ALL=(ALL:ALL) ALL
%wheel ALL=(ALL) NOPASSWD: /usr/local/bin/force-poweroff.sh
%wheel ALL=(ALL) NOPASSWD: /usr/local/bin/lowbatt-check.sh

