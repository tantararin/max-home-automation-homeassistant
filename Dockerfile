FROM jlesage/baseimage-gui:debian-10

# Install max-home-automation..
COPY sources.list.d/* /etc/apt/sources.list.d/
RUN apt-get update && apt-get install -y \
    libpython3.7-dev \
    apt-utils \
    max-home-automation && \

# cleanup
  apt-get upgrade -y --force-yes -qq && \
  apt-get purge --auto-remove -y && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# Set the name of the application.
ENV APP_NAME="MAX! Home Automation"
    KEEP_APP_RUNNING=1
# Copy the start script.
COPY startapp.sh /startapp.sh
