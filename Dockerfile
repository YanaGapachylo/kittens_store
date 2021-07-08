FROM ruby:2.4.9-alpine AS BUILD
RUN apk add --no-cache \
              postgresql-dev    \
              build-base

COPY . /app
WORKDIR /app

RUN bundle install

FROM ruby:2.4.9-alpine
RUN apk add --no-cache \
            postgresql-client

COPY --from=BUILD /usr/local/bundle /usr/local/bundle
COPY . /app
WORKDIR /app


