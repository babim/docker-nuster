FROM babim/centosbase

# Configuration variables.
ENV SOFT		nuster
ENV NUSTER_VERSION	3.2.3.19

# download option
RUN yum install -y wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20Nuster%20install/${SOFT}_install.sh | bash

# Expose default HTTP connector port.
EXPOSE 80 443 8080

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs.
VOLUME ["/etc/nuster/"]

ENTRYPOINT ["/start.sh"]
CMD ["nuster", "-f", "/etc/nuster/nuster.cfg"]