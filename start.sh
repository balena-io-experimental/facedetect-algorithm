#!/bin/bash

# Disable DPMS / Screen blanking
xset -dpms
xset s off
xset s noblank

cd ./Webcam-Face-Detect
python2.7 webcam.py haarcascade_frontalface_default.xml
