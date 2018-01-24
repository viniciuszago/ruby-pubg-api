# PubgApi
This is a simple ruby wrapper for https://pubgtracker.com/site-api

## Installation

Add to `Gemfile`

```ruby
gem 'pubg-api'
```

## Configuration

The following configuration need to be setup to your code.

```ruby
Pubg.configure do |c|
  c.trn_api_key = 'trn_api_key'
end
```

If you are using rails, you can create a file in `config/initializers`.

## Usage Examples

**Retrieve a player status by nickname.**

```ruby
Pubg::Player.find('playername')
```
Open [here](https://github.com/viniciuszago/ruby-pubg-api/blob/master/spec/fixtures/player/player_data.json) an example of response for this request.

**This will get all the stats for the current season.**
**You may get more data by using filters. season, mode, region**

```ruby
Pubg::Player.find('playername', {
                                  mode: 'solo',
                                  season: '2018-01',
                                  region: 'sa'
                                })
```


----------


**Matches status for a given player account**

```ruby
Pubg::Matches.find('account.9e915505fad245f696944e4b108986fa')
```
Open [here](https://github.com/viniciuszago/ruby-pubg-api/blob/master/spec/fixtures/matches/all_matches.json) an example of response for this request.

## Running the tests

Spec files are located under `/spec` directory. You can run them using `rspec` command.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/viniciuszago/ruby-pubg-api/blob/master/LICENSE.md) file for details

