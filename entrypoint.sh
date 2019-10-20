#!/bin/bash

# set -euxo pipefail
set -e

env | grep '^TOR_' | tr "=" " " | cut -c 5- > /etc/tor/torrc

exec tor -f /etc/tor/torrc --defaults-torrc "/etc/tor/torrc.${RELAY_TYPE}.default"
