FROM ruby:2.7.3 as development

ARG BUNDLE_RUBYGEMS__PKG__GITHUB__COM
ARG BUNDLE_GEMS__CONTRIBSYS__COM
ARG COMMIT_SHA

RUN useradd --create-home -s /bin/bash YOUR_REPO_NAME && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y jq && \
    apt-get install -y awscli

RUN mkdir $HOME/.ssh

COPY Gemfile /app/
COPY Gemfile.lock /app/
COPY start.sh /app/
COPY retrieve-secrets.sh /app/
RUN chmod +x /app/start.sh /app/retrieve-secrets.sh
WORKDIR /app/
RUN gem install bundler -v '2.3.8'

RUN set -a && \
      bundle install --jobs 2

RUN apt-get remove -y gcc gcc-8

COPY . /app/
RUN chown -R YOUR_REPO_NAME:YOUR_REPO_NAME /app/
USER YOUR_REPO_NAME

FROM development as production

RUN set -a && \
        bundle config set without 'development test innovate' && \
        bundle install --jobs 4

EXPOSE 3000
