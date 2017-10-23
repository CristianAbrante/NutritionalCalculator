# NutritionalCalculator
## Práctica 6 de LPP (TTD con Ruby)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/nutritional_calculator`. To experiment with that code, run `bin/console` for an interactive prompt.

### author: Cristian Abrante Dorta
### email: alu0100945850@ull.edu.es

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nutritional_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nutritional_calculator

## Usage

This gem allows users to calculate the current nutritional value (KCal) of a certain Food. For doing this, when we create a `NutritionalCalculator::Food` object we specify the amount of proteins, carbohydrate and lipids of this food. And the class has a method called `get_nutritional_value()` which calculates the amount of KCals of the food.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nutritional_calculator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
