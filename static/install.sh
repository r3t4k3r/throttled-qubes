#!/bin/sh

INSTALL_DIR="/opt/throttled"

INIT="$(ps --no-headers -o comm 1)"

systemctl stop throttled.service >/dev/null 2>&1

rm -f "$INSTALL_DIR/lenovo_fix.py" >/dev/null 2>&1
mkdir -p "$INSTALL_DIR" >/dev/null 2>&1
set -e

cd "$(dirname "$0")"

echo "Copying config file"
if [ ! -f /etc/throttled.conf ]; then
	cp throttled.conf /etc
else
	echo "Config file already exists, skipping"
fi

echo "Copying systemd service file"
cp throttled.service /etc/systemd/system

echo "Copying core files"
cp throttled.bin "$INSTALL_DIR/throttled.bin"
cd "$INSTALL_DIR"
echo "Change permissions"
chmod +x throttled.bin

echo "Enabling and starting systemd service"
systemctl daemon-reload
systemctl enable throttled.service
systemctl restart throttled.service

echo "All done."
