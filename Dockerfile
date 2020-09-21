FROM debian:stretch

ARG DEBIAN_FRONTEND=noninteractive

# add backports
RUN apt-get update \
&& apt-get -y install --no-install-recommends --no-install-suggests \
	software-properties-common apt-utils \
&& apt-add-repository -y "deb http://deb.debian.org/debian stretch-backports main contrib non-free" \
&& apt-add-repository -y contrib \
&& apt-add-repository -y non-free \
&& apt-get -y clean

# install build basics
RUN apt-get update \
&& apt-get -y install \
	build-essential \
	fakeroot \
	devscripts \
	eatmydata \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /work
COPY run.sh /usr/local/bin
CMD ["/usr/local/bin/run.sh"]