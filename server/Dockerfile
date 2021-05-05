FROM ruby:3

WORKDIR /rails-server

COPY Gemfile /rails-server/Gemfile
COPY Gemfile.lock /rails-server/Gemfile.lock
RUN gem install graphql && bundle install

COPY . /rails-server
