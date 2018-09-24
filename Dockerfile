FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y zlib1g-dev libssl-dev libreadline-dev libgdbm-dev openssl
RUN apt remove ruby
RUN mkdir RUBY
RUN cd RUBY && wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz && tar xvfz ruby-2.3.0.tar.gz && cd ruby-2.3.0 && ./configure && make && make install
RUN export PATH=$PATH:~/RUBY/ruby-2.3.0 && git clone https://github.com/bigbadblo/slack-bot.git /app/slack-bot && cd /app/slack-bot && gem install bundle && bundle
RUN chmod +x start.sh
CMD ./start.sh
