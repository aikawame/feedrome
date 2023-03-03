FROM ruby:3.1-alpine

WORKDIR /opt/project

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=1
ENV TZ=Asia/Tokyo

COPY Gemfile Gemfile.lock ./

RUN apk add --no-cache --virtual .build-deps \
      gcc \
      g++ \
      make  \
 && apk add --no-cache \
      mysql-dev \
      tzdata \
 && bundle install -j4 \
 && bundle clean --force \
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete \
 && apk del .build-deps

COPY . .
