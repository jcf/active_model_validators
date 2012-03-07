module ActiveModelValidators
  # This module provides the foundation for a pattern that instantiates a
  # Validator object for each attribute that needs to be validated.
  #
  #     class SomeValidator < EachValidator
  #       class Validator
  #         include ActiveModelValidators::Validator
  #
  #         private
  #
  #         def valid?
  #           value == 'the right answer'
  #         end
  #       end
  #
  #       def validate_each(record, attribute, value)
  #         Validator.new(record, attribute, value, options).validate!
  #       end
  #     end
  #
  module Validator
    attr_reader :record, :attribute, :value, :options

    delegate :errors, to: :record, prefix: false

    def initialize(record, attribute, value, options)
      @record    = record
      @attribute = attribute
      @value     = value
      @options   = options
    end

    def validate!
      return if value_allowed?
      add_error unless valid?
    end

    private

    def value_allowed?
      (options[:allow_blank] && value.blank?) ||
        (options[:allow_nil] && value.nil?)
    end

    def valid?
      raise NotImplementedError, 'override this method'
    end

    def add_error
      if message = options[:message]
        errors[attribute] << message
      else
        errors.add(attribute, :invalid)
      end
    end
  end
end
