#!/bin/bash

# Dump your WiFi info to the WPA supplicant config file before running this command
# wpa_passphrase WiFiSSID WiFiPASSWD | sudo tee /etc/wpa_supplicant.conf

sudo wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 &
