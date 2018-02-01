[![Build Status](https://travis-ci.org/matheusvetor/stringify_date.svg?branch=master)](https://travis-ci.org/matheusvetor/stringify_date)

# StringifyDate

This gem provides a _string and _string= to date and datetime attributes.

## Installation

Add this line to your application's Gemfile:

    gem 'stringify_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stringify_date

## Usage

For example, we create a Product model which has an date validity column
and we want to handle it by using a String object instead:

```ruby
class Product < ActiveRecord::Base
  # the format will be used to format date and datetime as string
  stringify :validity, format: '%d/%m/%Y'

end
```

Now each Product object will also have attributes called ```validity_string``` and ```validity_string=```
to use date and datetime as string.

So

```ruby
product = Product.new validity: Date.new(2001,2,3)
```

We can use now ```_string```

```ruby
product.validity_string # => '03/02/2001'
```


## Contributing

1. Fork it ( https://github.com/matheusvetor/stringify_date/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
