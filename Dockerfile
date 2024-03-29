FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential default-mysql-client

ENV RAILS_ENV=production

ENV app_path /rails_app
RUN mkdir ${app_path}
WORKDIR ${app_path}

COPY ./Gemfile ${app_path}/Gemfile
COPY ./Gemfile.lock ${app_path}/Gemfile.lock

RUN bundle install
COPY . ${app_path}

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

COPY ./start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
