# 🐋 ilshidur/tor-relay

> Lightweight TOR relay image (15.04 MB), based on [LinuxServer.io Alpine Linux](https://linuxserver.io). Configurations can be passed as environment variables.

[![dockeri.co](https://dockeri.co/image/ilshidur/tor-relay)](https://hub.docker.com/r/ilshidur/tor-relay)

## Usage

### Bridge mode

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=bridge \
  -e TOR_ORPort=9001 \
  -e TOR_DirPort=9030 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  -p 9030:9030 \
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
  -e TOR_DirPort=9030 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  -p 9030:9030 \
  --restart always \
  ilshidur/tor-relay
```

### Exit node mode

**It is highly recommended against setting up this type of configuration in a home network.**

[Tips for Running an Exit Node.](https://blog.torproject.org/tips-running-exit-node)

```bash
docker run \
  -d \
  --name tor-relay \
  -e RELAY_TYPE=exit \
  -e TOR_ORPort=9001 \
  -e TOR_DirPort=9030 \
  -e TOR_Nickname=ididnteditheconfig \
  -e TOR_RelayBandwidthRate="100 KBytes" \
  -e TOR_RelayBandwidthBurst="200 KBytes" \
  -e TZ=Europe/London \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -v $(pwd)/tor/data:/data:Z \
  -p 9001:9001 \
  -p 9030:9030 \
  --restart always \
  ilshidur/tor-relay
```

## Versions

* Alpine base image : `3.18` using the Edge Repository.
* Tor : `0.4.8.10-r0` ([alpine package](https://pkgs.alpinelinux.org/package/edge/community/x86/tor))

### Docker images versioning

Each build is shipped through 4 identical images with each having a different version :

* `latest`
* `<MAJOR.MINOR>`
  * Having the latest base image and tor versions.
  * e.g.: `ilshidur/tor-relay:2.6`
* `<MAJOR.MINOR>-v<TOR ALPINE PACKAGE VERSION>`
  * Having the latest base image version.
  * e.g.: `ilshidur/tor-relay:2.6-v0.4.8.10-r0`
* `<MAJOR.MINOR>-ls<BASE IMAGE VERSION>-v<TOR ALPINE PACKAGE VERSION>`
  * e.g.: `ilshidur/tor-relay:2.6-ls3.18-v0.4.8.10-r0`

## Configuration

The configuration is stored in a `/etc/tor/torrc` file.
Everyline can be changed using environment variables as described below :

`TOR_<configuration>=<value>` will uncomment the first line starting with `<configuration>` and set its value to `<value>`.

*Example : setting `TOR_ORPort` to `9002` will change the line `#ORPort 9001` to `ORPort 9002`.*

## TODO

* Auto push to the Docker hub on push.
* Add ARM support.

## License

MIT

<hr/>

<p align="center">
  Don't forget to 🌟 Star 🌟 the repo if you like this Docker image !<br/>
  <a href="https://github.com/Ilshidur/tor-relay-docker/issues/new">Your feedback is appreciated</a>
</p>
