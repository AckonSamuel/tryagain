FROM ruby:3.1.2-slim-bullseye AS app

WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl libpq-dev nodejs yarn postgresql-client git graphviz\
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean \
  && useradd --create-home ruby \
  && chown ruby:ruby -R /app

ENV GIT_AUTHOR_NAME="Samuel Ackon"
ENV GIT_AUTHOR_EMAIL="ackons433@gmail.com"
ENV GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
ENV GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
USER ruby

COPY --chown=ruby:ruby bin/ ./bin
RUN ls -la bin
RUN chmod 0755 bin/*

ARG RAILS_ENV="production"
ENV RAILS_ENV="${RAILS_ENV}" \
    PATH="${PATH}:/home/ruby/local/bin" \
    USER="ruby" \
    DATABASE_URL="postgres://postgres:postgres@db:5432/app"

# COPY --chown=ruby:ruby --from=assets /usr/local/bundle /usr/local/bundle
# COPY --chown=ruby:ruby --from=assets /app/public /public
COPY --chown=ruby:ruby . .

RUN chmod +x docker-entrypoint-web.sh
RUN mkdir -p tmp/pids
RUN bundle install


ENTRYPOINT ["./docker-entrypoint-web.sh"]

EXPOSE 8000

CMD ["rails", "s", "-b", "0.0.0.0"]



