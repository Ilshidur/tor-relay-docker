# tor-relay-docker

Lightweight TOR relay image, based on Alpine Linux. Configurations can be passed as environment variables.

## Usage

### Bridge mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=bridge \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -v $(pwd)/tor/data:/var/lib/tor:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

### Relay mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=relay \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -v $(pwd)/tor/data:/var/lib/tor:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

### Exit node mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=exit \
  -e TOR_ORPort=9001 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -v $(pwd)/tor/data:/var/lib/tor:Z \
  -p 9001:9001 \
  --restart always \
  ilshidur/tor-relay
```

## Configuration

The configuration is stored in a `/etc/tor/torrc` file.
Everyline can be changed using environment variables as described below :

`TOR_<configuration>=<value>` will uncomment the first line starting with `<configuration>` and set its value to `<value>`.

*Example : setting `TOR_ORPort` to `9002` will change the line `#ORPort 9001` to `ORPort 9002`.*

## License

MIT
