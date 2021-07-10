#!/bin/bash

echo "Initializing..."
stty -echo
clear
until $(ls /var/tmp/configure-scenario.sh &> /dev/null); do (echo -n .; sleep 2); done;
clear
stty echo
/bin/bash /var/tmp/configure-scenario.sh
