#!/bin/bash
cd /app

# build python bytecode
/build/.venv/bin/nuitka --show-progress --module --nofollow-imports --output-dir=out src/throttled.py
# pack bytecode
/build/.venv/bin/pyinstaller --add-data out:lib --paths=/usr/lib/python3.12/site-packages/ -D -F src/run.py
