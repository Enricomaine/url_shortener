# URL shortener

This is a URL shortener project developed in Ruby on Rails, created by [Enrico Maine](https://github.com/Enricomaine).

## Features
- Shortens long URLs into shorter, easier-to-share links with automatic redirection
- Responsive and simple web interface
- Implementation of link validity after 24 hours
- Automatic cleaning of expired URLs for database optimization

## Technologies
- Ruby 3.4.4
- Rails 8.0.2
- PostgreSQL
- HTML, CSS
- Rake + Cron
- Docker

## How to run locally

1. Clone this repository or download the zip
2. Enter in the repository `cd url_shortener`
3. Install dependencies `bundle install`
4. Setup database `db:setup`
5. Run server `rails server`
