FROM ubuntu:14.04

# Ubuntu sides with libav, I side with ffmpeg.
#RUN echo "deb http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu trusty main" >> /etc/apt/sources.list \
#	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1DB8ADC1CFCA9579


RUN apt-get update \
	&& apt-get install -y -q \
		wget \
		curl \
		build-essential \
		cmake \
		python2.7 \
		python2.7-dev \
		libavformat-dev \
		libavcodec-dev \
		libavfilter-dev \
		libswscale-dev \
		libjpeg-dev \
		libpng-dev \
		libtiff-dev \
		libjasper-dev \
		zlib1g-dev \
		libopenexr-dev \
		libxine-dev \
		libeigen3-dev \
		libtbb-dev \
		unzip

RUN wget 'https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg' \
	&& /bin/sh setuptools-0.6c11-py2.7.egg \
	&& rm -f setuptools-0.6c11-py2.7.egg

RUN curl 'https://bootstrap.pypa.io/get-pip.py' | python2.7
RUN pip install numpy

COPY build_opencv.sh /build_opencv.sh
RUN /bin/sh /build_opencv.sh \
	&& rm -rf /build_opencv.sh

RUN mkdir -p /usr/src/FaceDetect
WORKDIR /usr/src/FaceDetect
RUN curl -sL https://github.com/shantnu/Webcam-Face-Detect/archive/master.tar.gz \
	| tar xz -C /usr/src/FaceDetect

CMD python webcam.py haarcascade_frontalface_default.xml

