FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential default-mysql-client

ENV RAILS_ENV=development

ENV app_path /rails_app
RUN mkdir ${app_path}
WORKDIR ${app_path}

COPY ./Gemfile ${app_path}/Gemfile
COPY ./Gemfile.lock ${app_path}/Gemfile.lock

RUN bundle install
COPY . ${app_path}

# Node.js and NVM installation
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
  && . $HOME/.nvm/nvm.sh \
  && nvm install 20.9.0 \
  && nvm use 20.9.0 \
  && nvm alias default 20.9.0

# Yarn installation from the official repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

COPY ./start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
