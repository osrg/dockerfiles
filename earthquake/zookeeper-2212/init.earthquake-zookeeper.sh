#!/bin/bash
cat /banner.txt

[[ $1 ]] && exec "$@"
exec bash --login
