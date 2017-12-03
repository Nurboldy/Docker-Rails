FROM ruby:2.4.2

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    mysql-client \
    && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD rm -f tmp/pids/server.pid && rails server -b 0.0.0.0