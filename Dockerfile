FROM pcarranzav/opencv

RUN apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository ppa:mc3man/trusty-media \
	&& apt-get update \
	&& apt-get install -y ffmpeg libxine1

RUN mkdir -p /usr/src/FaceDetect
WORKDIR /usr/src/FaceDetect
COPY ./ /usr/src/FaceDetect/
RUN chmod +x start.sh
CMD bash /usr/src/FaceDetect/start.sh
