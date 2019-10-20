touch /etc/tor/torrc

#TODO:

exec tor -f "/etc/tor/torrc" --defaults-torrc "/etc/tor/torrc.default"
