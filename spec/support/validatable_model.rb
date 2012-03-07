module ActiveModelValidators::Model
  extend ActiveSupport::Concern

  include ActiveModel::Validations

  included do
    attr_accessor :attributes
  end

  module ClassMethods
    def attributes(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do
          @attributes[attribute]
        end

        define_method(:"#{attribute}=") do |value|
          @attributes[attribute] = value
        end
      end
    end
  end

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end
