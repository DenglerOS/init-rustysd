[Unit]
Description=Start {{TYPE}} {{NAME}}

[Service]
ExecStart=/bin/crun --log /var/log/crun.log run --no-pivot --bundle {{DIR}}/ {{NAME}}
ExecStop=/bin/crun kill {{NAME}}
ExecStopPost=/bin/crun delete {{NAME}}
StandardOutput= append:/var/log/{{NAME}}.log
StandardError= append:/var/log/{{NAME}}.log
Type=simple

[Install]
WantedBy={{TYPE}}.target
