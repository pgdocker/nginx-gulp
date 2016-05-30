# Pull base image.
FROM nginx
MAINTAINER Jonas Jabari <jabarijonas@gmail.com>

# Install general Dependencies
## SASS, COMPASS UNZIP
# ruby is required for compass / sass
# unzip is required for unzipping application
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
      curl \
      bzip2 \
      git \
      build-essential \
      bison \
      libreadline6-dev \
      zlib1g-dev \
      libssl-dev \
      libyaml-dev \
      libxml2-dev \
      autoconf \
      libc6-dev \
      ncurses-dev \
      automake \
      libtool \
      unzip \
      ruby-full \
      rubygems \
    && rm -rf /var/lib/apt/lists/*

# Install sass/compass
RUN gem install sass
RUN gem install compass

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
      nodejs \
    && rm -rf /var/lib/apt/lists/*

## NPM, GULP and BOWER
# Global install gulp and bower
RUN npm install -g gulp bower \
      && echo '{ "allow_root": true }' > /root/.bowerrc

# Define working directory.
WORKDIR /workspace

ADD config/nginx.conf /etc/nginx/conf.d/default.conf
ADD script/entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["development"]
