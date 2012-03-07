# ActiveModel Validators [![Build Status](https://secure.travis-ci.org/jcf/active_model_validators.png?branch=master)](http://travis-ci.org/jcf/active_model_validators)

A suite of validators for ActiveModel objects.

---

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

class Animal
  include ActiveModel::Serialization
  include ActiveModel::Validations

  attr_accessor :attributes

  validates_as_email :email

  def initialize(attributes = {})
    self.attributes = attributes
  end
end
```

## TODO

- Add UK postcode validator
- Add US Zip code validator
- Add IBAN number validator
- Modularise each validator and share a common base validator before v1.0.
