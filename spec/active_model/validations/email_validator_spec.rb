require 'spec_helper'

describe ActiveModel::Validations::EmailValidator do
  class Person
    include ActiveModelValidators::Model

    attributes :email
    validates :email, email: true
  end

  class PersonWithHelperMethod
    include ActiveModelValidators::Model

    attributes :email
    validates_as_email :email
  end

  context 'when using validates email: true' do
    subject { Person.new }

    it { should allow_value('james@logi.cl').for(:email) }
    it { should allow_value('1@127.0.0.1').for(:email) }
    it { should allow_value('$@$.com').for(:email) }
    it { should allow_value('$@$.int').for(:email) }

    it { should_not allow_value('@example.com').for(:email) }
    it { should_not allow_value('example.com').for(:email) }
    it { should_not allow_value('$@$.').for(:email) }
  end

  context 'when using validates_as_email' do
    subject { PersonWithHelperMethod.new }

    it { should allow_value('james@logi.cl').for(:email) }
    it { should_not allow_value('@example.com').for(:email) }
  end
end
