#!/usr/bin/env bash

rm -rf ~/.hwd

hwd init test --chain-id=test

echo "12345678" | hwcli keys add test1
echo "12345678" | hwcli keys add test2

hwd add-genesis-account $(hwcli keys show test1 -a) 10000000000000000000000000stake,1000000hwc
hwd add-genesis-account $(hwcli keys show test2 -a) 100000000000stake,1000hwc

hwcli config output json
hwcli config indent true
hwcli config chain-id test
hwcli config trust-node true
