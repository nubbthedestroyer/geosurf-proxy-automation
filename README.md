### Install

Just run these commands on a Ubuntu 16.04 virtual server in a public cloud.  A good example would be Amazon Lightsail or Digital Ocean.  Depending on the server, you may need to run them one at a time.

This first:
```bash
sudo bash
```

Then this:
```bash
apt update
apt install git
git clone https://github.com/nubbthedestroyer/geosurf-proxy-automation
cd geosurf-proxy-automation
./non-docker-install.sh
```

after running these commands, you will still need to add the public IP address of your virtual server into the Geosurf control panel here:
> https://client.geosurf.io/#!/manageips

