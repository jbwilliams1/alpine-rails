FROM alpine:3.2 

MAINTAINER CenturyLink Labs <innovationslab@ctl.io>

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler yaml
ENV DEV_PACKAGES zlib-dev libgcrypt libxml2-dev libxslt-dev tzdata sqlite-dev nodejs 

RUN echo 'gem: --no-document' >> /.gemrc

RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN gem install bundler --no-document 

EXPOSE 3000
 
