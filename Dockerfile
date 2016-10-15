FROM alpine:3.2
MAINTAINER Anthony Scotti <anthony.m.scotti@gmail.com>

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add curl bash build-base libffi-dev

# Install ruby and ruby-bundler
RUN apk add ruby ruby-dev ruby-io-console ruby-bundler

# Install Java
RUN apk add openjdk7-jre

# Install NodeJS
RUN apk add nodejs

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# Preinstall jekyll and s3_website
WORKDIR /tmp
COPY Gemfile /tmp/ 
COPY Gemfile.lock /tmp/ 
RUN bundle install