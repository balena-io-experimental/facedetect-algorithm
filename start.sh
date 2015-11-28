#!/bin/bash

while [ ! -e /foreign-data/video2 ]; do
	echo "Waiting for video pipe to be available"
	sleep 2
done

cd ./Webcam-Face-Detect
python2.7 webcam.py haarcascade_frontalface_default.xml
