# encoding: utf-8

require 'benchmark'

require 'active_support/concern'
require 'active_support/core_ext/module/delegation'

require 'active_model/naming'
require 'active_model/validator'
require 'active_model/validations'
require 'active_model/translation'

require 'active_model_validators/version'

# Require all the validators
require 'active_model_validators/validator'
require 'active_model/validations/email_validator'
