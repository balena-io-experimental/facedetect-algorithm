#!/bin/bash

mount -t devtmpfs /dev

while [ ! -e /dev/video2 ]; do
	echo "Waiting for video device to be available"
	sleep 2
done

cd ./Webcam-Face-Detect
python2.7 webcam.py haarcascade_frontalface_default.xml
