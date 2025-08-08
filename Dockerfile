FROM ruby:3.4.5-slim

RUN apt-get update && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y \
    build-essential \
    libz-dev \
  # Cleaning cache:
  && apt-get clean -y && rm -rf /var/lib/apt/lists/*

WORKDIR /stale
COPY ./Gemfile ./Gemfile.lock /stale/
RUN bundle install

COPY .triage-policies.yml /stale/

ENTRYPOINT ['bundle', 'exec']
