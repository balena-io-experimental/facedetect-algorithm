#!/bin/bash

while [ ! -p /foreign-data/faces ]; do
	echo "Waiting for output pipe to be available"
	sleep 2
done

cd ./Webcam-Face-Detect
python2.7 webcam.py haarcascade_frontalface_default.xml
