FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y ruby ruby-dev
CMD git clone https://github.com/bigbadblo/slack-bot.git
WORKDIR /app/slack-bot
RUN gem install bundle
RUN bundle
RUN rackup -D config.ru
WORKDIR /app
CMD node index.js alexa
