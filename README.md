# NutritionalCalculator
## TDD con Ruby

La gema nutritional_calculator nos permitirá realizar diversos cálculos nutricionales con alimentos. Es capaz de leer la información de los alimentos a través de un fichero además de permitirnos guardar dichos alimentos en una lista.

##### author: Cristian Abrante Dorta
##### email: alu0100945850@ull.edu.es

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

ESta gema permite a los usuarios calcular el valor nutricional actual (KCal) de un alimento concreto. Para hacer esto, creamos un objeto `NutritionalCalculator::Food` al que debemos especificarle los gramos de proteínas, glúcidos y lípidos que tiene. Además, la clase cuenta con un método `get_nutritional_value()` que nos permite tener acceso a este valor nutricional.
Por otra parte, contamos con la clase  `NutritionalCalculator::FoodGroup` que además de los atributos de la clase anterior(herencia) también nos permite almacenar el grupo al que pertenece el alimento.

Finalmente, contaremos con una clase que simula a una lista enlazada en la que almacenamos los alimentos `NutritionalCalculator::LinkedList`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alu0100945850/nutritional_calculator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
