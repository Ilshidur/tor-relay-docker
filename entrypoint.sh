#!/bin/bash

set -e

env | grep '^TOR_' | tr "=" " " | cut -c 5- > /config/torrc

exec tor -f /config/torrc --defaults-torrc "/config/torrc.${RELAY_TYPE}.default"
