# README

The goal of Rails Engine was to use Rails and ActiveRecord to build a JSON API which will expose SalesEngine data. We were able to build out single responsibility controllers to provide a well-designed and versioned API. We also used complex ActiveRecord queries to pull out data for our user.

* Ruby version: 2.3.1
* Rails version: 5.0.0.1
* To use:
 1. git clone https://github.com/annadolan/rails_engine.git
 2. bundle Install
 3. rake db:create db:migrate
 4. rake load_csv:all (loads all csv data)

* Running Test suite:
 1. rspec

Contributors [Anthony Ciccone](https://github.com/antciccone) and [Anna Dolan](https://github.com/annadolan)
