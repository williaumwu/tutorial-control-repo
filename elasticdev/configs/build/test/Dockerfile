FROM python:2.7-onbuild
MAINTAINER elasticdev <info@elasticdev.io>

#############################################
RUN echo "Running tests assuming /usr/src/app"

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl && \
    ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
RUN apt-get update --fix-missing
ADD run.sh /usr/bin/run.sh

# execute the tests
RUN ["/usr/bin/run.sh"]
