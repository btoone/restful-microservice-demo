# Acme Web Tracker

Application demoing a RESTful set of microservices using Sinatra and Faraday.

## Installation

Install gems

    bundle install

Install foreman

    gem install foreman

## Usage

Run the services (sinatra apps) using foreman

    foreman start

Use IRB to interact with AWTracker or execute `main.rb`

    ruby main.rb

## Tests

Minitest is the test framework so specs can be ran by running the files directly
or using Rake.

    rake spec

To run the specs for each service change in their respective directories and run
the same way.

    cd product_app
    rake spec
