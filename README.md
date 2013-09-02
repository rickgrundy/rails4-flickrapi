# Rails4-FlickrAPI Demo App
A simple example of a Rails4 app which talks to Flickr's REST API.

## Development Requirements
* Ruby 1.9
* Bundler (gem install bundler)

## Finding the app on Heroku
http://rails4-flickrapi.herokuapp.com/

## Running the app locally (no database required)
```
echo "FLICKR_API_KEY=my-personal-key" >> .env
echo "FLICKR_API_SECRET=my-personal-secret" >> .env
bundle install
bundle exec foreman start
```

## Running the unit tests 
```
bundle exec rake spec
```

## Running the acceptance tests
```
bundle exec rake acceptance
```