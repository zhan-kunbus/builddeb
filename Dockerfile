FROM debian:stretch

ARG DEBIAN_FRONTEND=noninteractive

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