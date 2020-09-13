FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /contentful_poc
WORKDIR /contentful_poc
COPY Gemfile /contentful_poc/Gemfile
COPY Gemfile.lock /contentful_poc/Gemfile.lock
RUN bundle install
COPY . /contentful_poc

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
