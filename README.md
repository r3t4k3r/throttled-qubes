# General
This tool is a fork of [erpalma](https://github.com/erpalma/throttled) original tool

For some reasons original tool support at least fedora40, but in Qubes OS current fedora version is 37.
This tool try to build original python tool into static executable binary

Also you can read [Evv1l thinkguides](https://evv1l.space/thinkguides/mods_and_fixes/fixing-throttling-issues/) for improve Thinkpad permformance

# Requirements
- Docker installed in qube

# How to use
In any qube, for example `personal`, do:
```
git clone https://github.com/r3t4k3r/throttled-qubes # clone the repo
cd throttled-qubes
scripts/build.sh # build the binary
```

after steps above you will see `throttled.zip` in the project folder

Do next steps in `dom0`:
```
qvm-run --pass-io personal 'cat /home/user/Downalods/throttled-qubes/throttled.zip' > throttled.zip
unzip throttled.zip
cd throttled
```

here you can select what to do:
- `sudo ./install.sh` for installing systemd service and copy binary into /opt/... directory
- `sudo ./throttled.bin` for run the tool
