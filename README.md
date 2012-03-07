# ActiveModel Validators [![Build Status](https://secure.travis-ci.org/jcf/active_model_validators.png?branch=master)](http://travis-ci.org/jcf/active_model_validators)

A suite of validators for ActiveModel objects.

---

### Validators

- **validates_as_email** uses the [Mail](https://github.com/mikel/mail)
  gem to parse and validate email addresses.

## Supported Ruby versions

**Ruby 1.8 is not supported and will not work**

The library should work with **MRI**, **JRuby**, and **Rubinius**

## Installation

You can install via RubyGems

``` sh
gem install active_model_validators
```

And then require the gem in your application.

``` ruby
require 'active_model_validators'
```

If you're using Bundler to manage your gem dependencies you can add the
library to your Gemfile.

``` ruby
gem 'active_model_validators'
```

## Example

``` ruby
require 'active_model'
require 'active_model_validators'

class Person
  include ActiveModel::Serialization
  include ActiveModel::Validations

  attr_accessor :attributes

  validates_as_email :email

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def email
    attributes[:email]
  end

  def email=(address)
    attributes[:email] = address
  end
end

james = Person.new(email: 'james@logi.cl')
james.valid? # => true

james.email = 'invalid'
james.valid?         # => false
james.errors[:email] # => ["is invalid"]
```

## TODO

- Add UK postcode validator
- Add US Zip code validator
- Add IBAN number validator
- Modularise each validator and share a common base validator before v1.0.
