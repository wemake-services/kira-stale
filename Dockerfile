FROM ruby:3.4.6-slim

RUN apt-get update && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y \
    build-essential \
    libz-dev \
  # Cleaning cache:
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Deps:
WORKDIR /stale
COPY ./Gemfile ./Gemfile.lock /stale/
RUN bundle install

# Project files:
COPY .triage-policies.yml /stale/

ENTRYPOINT ["bundle", "exec"]
