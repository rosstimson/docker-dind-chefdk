# Docker in Docker with ChefDK Dockerfile
#
# https://github.com/rosstimson/dind-chefdk
#
# AUTHOR:   Ross Timson <ross@rosstimson.com>
# LICENSE:  WTFPL - http://wtfpl.net
#

# Pull base image
# This is an official ubuntu:14.04 base image with extras to enable
# Docker to run inside Docker, this requires Docker to be run in
# privileged mode.
FROM jpetazzo/dind
MAINTAINER Ross Timson <ross@rosstimson.com>

ENV DEBIAN_FRONTEND noninteractive

# Download and install ChefDK.
RUN cd /tmp ;\
    wget -O chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.2.0-2_amd64.deb ;\
    dpkg -i chefdk.deb ;\
    rm -f /tmp/chefdk.deb

# Make Chef DK the primary Ruby/Chef development environment.
RUN echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc

CMD ["chef"]
