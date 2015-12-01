import cv2
import sys
import os

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
with open(pipeFile, 'w') as openPipe:
    while True:
        # Capture frame-by-frame
        ret, frame = video_capture.read()
        if ret and len(frame) > 0:
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            faces = faceCascade.detectMultiScale(
                gray,
                scaleFactor=1.1,
                minNeighbors=5,
                minSize=(30, 30),
                flags=cv2.cv.CV_HAAR_SCALE_IMAGE
            )
            if len(faces) > 0:
                openPipe.write(formatFaces(faces))

# When everything is done, release the capture
video_capture.release()
