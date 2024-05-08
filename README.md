# DockerでRails7 + postgre環境を構築する

1から環境を構築した手順

1. Dockerfile,docker-compose.yml,Gemfile,Gemfile.lockを作成、以下の通り追記。
```Dockerfile
FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
```

```docker-compose.yml
version: '3'
services:
  db:
    image: postgres
    container_name: db
    environment:
      POSTGRES_HOST_AUTH_METHOD: 'trust' 
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```

```Gemfile
source 'https://rubygems.org'
gem 'rails', '<version>'
```

Gemfile.lockは新規作成する。

2. docker-compose run web rails new . --force --database=postgresqlを実行

3. bundle install
pgでエラー落ちする。
libpq-devをapt installして解決。

4. docker run bluemine-web-1 rails db:create