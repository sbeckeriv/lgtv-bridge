FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y ruby ruby-dev
RUN git clone https://github.com/bigbadblo/slack-bot.git /app/slack-bot && cd /app/slack-bot && gem install bundle && bundle
RUN chmod +x start.sh
CMD ./start.sh
