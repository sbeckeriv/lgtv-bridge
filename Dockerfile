FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update && apt-get -y install software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get -y install ruby2.2 ruby2.2-dev
RUN git clone https://github.com/bigbadblo/slack-bot.git /app/slack-bot && cd /app/slack-bot && gem install bundle && bundle
RUN chmod +x start.sh
CMD ./start.sh
