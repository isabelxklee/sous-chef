💫👩🏻‍🍳 Sous Chef 👩🏻‍🍳💫
========================

Sous Chef is a web app that allows you to create new recipes and track your cooking history.

Live demo: https://souschef-app.herokuapp.com

![Chef profile on Sous Chef](https://i.imgur.com/yUztOWu.png)

## Features

### Password Authentication
* Validate logged in users using sessions
* Authenticate the user's password with BCrypt, a Ruby gem that encrypts passwords

### CRUD Operations
* Validates inputs and displays error messages for all models
* Logged in users can create recipes
* They can write reviews for other users' recipes
* Browse all recipes by category
* Visit other users' cooking profiles

### ActiveRecord Associations
* Models have `has_many`, `belongs_to` and `has_many` through associations

### Other Features
* Global datetime conversion using conditional formatting and regex
* 100% custom CSS

![All recipes on Sous Chef](https://i.imgur.com/3Il5wwM.png)

## Domain Model
![Domain model](https://i.imgur.com/YVzmeaR.png)


## Tech Stack

* Ruby on Rails
* PostgreSQL
* HTML/CSS
* Active Record

## Tools

* [Faker](https://github.com/faker-ruby/faker): fake data generator
* [Date](https://github.com/ruby/date): easy way to handle date objects
* [CSS Theme](https://kognise.github.io/water.css/): classless CSS theme
* [BCrypt](https://github.com/codahale/bcrypt-ruby): password hashing function to securely store passwords


### ⭐️🍜 Thanks for visiting! 🍜⭐️
