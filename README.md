# Contentful POC

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    * 2.5.8 
* System dependencies
    * if using 
        * docker - [install docker](https://docs.docker.com/engine/install/)
        * rvm - install [rvm](https://rvm.io/rvm/install) and [postgresql](https://www.postgresql.org/docs/9.3/tutorial-install.html)
* Configuration

* How to run the test suite
    
    `modify space_id and access_token in docker.test.env` 
    ##### docker
        docker-compose run web rspec
    ##### rvm
        bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    ##### docker
        1. docker-compose build
        2. docker-compose up
    **Note** you might need to change ownership of the folder, to do so please run 
    
    `sudo chown -R $USER:$USER .`
    ##### rvm
        1. bundle install
        2. rails s