FROM ruby:3.4.5-slim

WORKDIR /stale
COPY ./Gemfile ./Gemfile.lock /stale/
RUN bundle install -j $(nproc)

COPY .triage-policies.yml /stale/

ENTRYPOINT ['bundle', 'exec']
