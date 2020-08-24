FROM ruby:2.6-alpine

RUN apk --update --no-cache add build-base sqlite-dev libffi-dev git tzdata

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler && bundle install
