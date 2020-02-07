FROM ruby:2.5.5
RUN apt-get update && apt-get install -y mariadb-client
COPY ./docker/app/docker-entrypoint.sh /
RUN mkdir /app
WORKDIR /app
RUN gem install bundler -v 2.1.4
ENTRYPOINT ["/docker-entrypoint.sh"]
