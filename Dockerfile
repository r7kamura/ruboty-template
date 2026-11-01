FROM ruby:3.4-slim

WORKDIR /app

ENV BUNDLE_WITHOUT=development:test \
    RUBOTY_ENV=production

COPY Gemfile Gemfile.lock ./
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential libssl-dev \
  && bundle install \
  && apt-get purge -y build-essential libssl-dev libssl-dev \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

COPY . .

CMD ["bundle", "exec", "ruboty"]
