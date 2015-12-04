import cv2
import sys
import os
import time

pipeFile = "/foreign-data/faces"

def toString(a):
    return str(a)

def joinWithCommas(a):
    return ','.join(map(toString, a))

def formatFaces(f):
    return ';'.join(map(joinWithCommas, f)) + '\n'

cascPath = sys.argv[1]
faceCascade = cv2.CascadeClassifier(cascPath)

video_capture = cv2.VideoCapture('/usr/src/FaceDetect/video.sdp')

count = 0
while True:
    video_capture = cv2.VideoCapture('/usr/src/FaceDetect/video.sdp')
    if not video_capture:
        time.sleep(0.1)
        continue
    while True:
        # Capture frame-by-frame
        ret, frame = video_capture.read()
        if not ret:
            video_capture.release()
            time.sleep(0.1)
            break

        count += 1
        if (count % 10) ==0 and len(frame) > 0:
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            faces = faceCascade.detectMultiScale(
                gray,
                scaleFactor=1.1,
                minNeighbors=5,
                minSize=(80, 80),
                flags=cv2.cv.CV_HAAR_SCALE_IMAGE
            )
            if len(faces) > 0:
                openPipe = open(pipeFile, 'w')
                openPipe.write(formatFaces(faces))
                openPipe.close()

        time.sleep(0.001)
