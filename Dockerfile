FROM ruby:2.7.2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs libpq-dev postgresql-client postgresql-client yarn
RUN mkdir /usr/src/recode
WORKDIR /usr/src/recode
ADD . /usr/src/recode
RUN gem install bundler --no-doc
RUN bundle install
RUN yarn