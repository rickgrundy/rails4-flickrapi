# Rails4-FlickrAPI Demo App
A simple example of a Rails4 app which talks to Flickr's REST API.

## Development Requirements
* Ruby 1.9
* Bundler (gem install bundler)

## Running the unit tests 
```
bundle install
bundle exec rspec
```

## Running the acceptance tests
```
bundle exec rspec acceptance
```

## Running the app locally (no database required)
```
echo "FLICKR_API_KEY=my-personal-key" >> .env
echo "FLICKR_API_SECRET=my-personal-secret" >> .env
bundle exec foreman start
```

## Finding the app on Heroku
http://rails4-flickrapi.herokuapp.com/