FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y ruby ruby-dev
RUN gem install bundle
CMD git clone https://github.com/bigbadblo/slack-bot.git
CMD cd slack-mathbot
RUN bundle
RUN rackup -D config.ru
CMD node index.js alexa
