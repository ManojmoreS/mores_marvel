# MoresMarvel

Welcome to `MoresMarvel!`, A simple Ruby client which helps you interact with [Marvel API](https://developer.marvel.com/docs).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mores_marvel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mores_marvel

    require 'mores_marvel'

    # initialize the MoresMarvel client
    @client = MoresMarvel::Client.new(
      {
        public_key: 'GET_YOUR_KEY',
        private_key: 'GET_YOUR_KEY',
        base_uri: 'http://ADDYOURENDPOINT.marvel.com'
      }
    )
You will need to set your API key, know more about [apikey](https://developer.marvel.com/documentation/getting_started) here.

## Usage

MoresMarvel Ruby client will allow to make following calls to Marvel API's all 6 resources.
`characters, comics, creators, events, series, stories`
#### Example :
###### `GET /v1/public/characters`
###### `GET /v1/public/characters/{id}`
###### `GET /v1/public/characters/{id}/comics`
```ruby
@client.fetch_all('characters')
@client.fetch_by_id('characters', '000')

# supports filters specified by Marvel API.
filters = {
  offset: 00
  limit: 00
  orderBy: 'name' or 'modified'
  modifiedSince: ''
  nameStartsWith: ''
  name: ''
}
@client.fetch_all('characters', filters)
@client.fetch_by_id('characters', '000', filters)

resource_params = {
  primary_model: ''
  id: 00
  secondary_model: ''
}
eg: `GET /v1/public/primary_model/{id}/secondary_model`
@client.fetch_filtered_by(resource_params, filters)
```
*Note: Marvel API by default return 20 records and max limit should be less than 100*


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/username/mores_marvel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MoresMarvel project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/username/mores_marvel/blob/master/CODE_OF_CONDUCT.md).

## Road Map
- [x] Support GET for all 6 resources.
- [x] Support filters specified in Marvel API.
- [ ] Support pagination get requests.
- [x] Better Error Handling
