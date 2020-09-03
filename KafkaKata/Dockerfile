# FROM quay.io/fundingcircle/alpine-ruby-builder:2.7

# COPY . .

# RUN gem install bundler
# RUN bundle install --jobs=4

FROM quay.io/fundingcircle/alpine-ruby-builder:2.7

RUN apk add build-base
RUN gem install --no-document rainbow:3.0.0 rouge:3.3.0

COPY Gemfile ./
RUN bundle install --jobs=4

COPY . .