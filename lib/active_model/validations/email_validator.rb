# encoding: utf-8
require 'mail'

module ActiveModel
  module Validations
    # EmailValidator will validate the format of an email using the awesome
    # Mail gem.
    class EmailValidator < EachValidator
      class Validator
        include ActiveModelValidators::Validator

        attr_reader :email, :tree

        def validate
          @email = Mail::Address.new(value)
          @tree  = email.__send__(:tree)

          super
        rescue Mail::Field::ParseError
          add_error
        end

        private

        def domain_and_address_present?
          email.domain && email.address == value
        end

        def domain_has_more_than_one_atom?
          tree.domain.dot_atom_text.elements.length > 1
        end

        def valid?
          !!(domain_and_address_present? && domain_has_more_than_one_atom?)
        end
      end

      def validate_each(record, attribute, value)
        Validator.new(record, attribute, value, options).validate
      end
    end

    module HelperMethods
      def validates_as_email(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
