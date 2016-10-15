FROM alpine:3.2
MAINTAINER Anthony Scotti <anthony.m.scotti@gmail.com>

# Add Edge and Community repositories
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add curl ca-certificates bash build-base libffi-dev

# Install ruby and ruby-bundler
RUN apk add ruby ruby-dev ruby-io-console ruby-bundler

# Install Java 7
RUN apk add openjdk7-jre-base@community java-cacerts
RUN rm /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts
RUN ln -s /etc/ssl/certs/java/cacerts /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts

# Install NodeJS
RUN apk add nodejs

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# Preinstall jekyll and s3_website
WORKDIR /tmp
COPY Gemfile /tmp/ 
COPY Gemfile.lock /tmp/ 
RUN bundle install