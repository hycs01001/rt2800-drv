#!/bin/sh

mod_list=("rt2x00lib.ko" "rt2x00usb.ko" "rt2800lib.ko" "rt2800usb.ko")

PREFIX="./rt2x00"

# check all needs are existed
for item in "${mod_list[@]}"; do
  echo "> checking ${item} ..."
  [ -e ${PREFIX}/${item} ] || { exit 1; }
done
echo "* all needs are existed!"
echo ""

for item in "${mod_list[@]}"; do
  echo "> insmod-ing ${item} ..."
  sudo insmod ${PREFIX}/${item} dyndbg=+pl || { echo "* failed on ${item}"; exit 2; }
done
echo "* job complete!"
