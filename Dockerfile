FROM chilijung/docker-opencv

RUN mkdir -p /usr/src/FaceDetect
WORKDIR /usr/src/FaceDetect
RUN curl -sL https://github.com/shantnu/Webcam-Face-Detect/archive/master.tar.gz \
	| tar xz -C /usr/src/FaceDetect FaceDetect.tar.gz

CMD python webcam.py haarcascade_frontalface_default.xml

