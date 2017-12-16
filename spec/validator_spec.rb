# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Evnt::Validator do
  it 'should have a validates function' do
    validation = Evnt::Validator.validates('string', presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  # Type:
  # The type validation should check the correct variable type.
  #################################################################

  # Datetime

  it 'should accept a date value with type: datetime' do
    validation = Evnt::Validator.validates(DateTime.now, type: :datetime)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: datetime' do
    validation = Evnt::Validator.validates(nil, type: :datetime)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a not string date value with type: datetime' do
    validation = Evnt::Validator.validates('Sambuca', type: :datetime)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should not accept a integer date value with type: datetime' do
    validation = Evnt::Validator.validates(1234, type: :datetime)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # Date

  it 'should accept a date value with type: date' do
    validation = Evnt::Validator.validates(Date.today, type: :date)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: date' do
    validation = Evnt::Validator.validates(nil, type: :date)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a not string date value with type: date' do
    validation = Evnt::Validator.validates('Sambuca', type: :date)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should not accept a integer date value with type: date' do
    validation = Evnt::Validator.validates(1234, type: :date)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # String

  it 'should accept a string value with type: string' do
    validation = Evnt::Validator.validates('hello', type: :string)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: string' do
    validation = Evnt::Validator.validates(nil, type: :string)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a integer value with type: string' do
    validation = Evnt::Validator.validates(4, type: :string)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # Integer

  it 'should accept a integer value with type: integer' do
    validation = Evnt::Validator.validates(4, type: :integer)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: integer' do
    validation = Evnt::Validator.validates(nil, type: :integer)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a string value with type: integer' do
    validation = Evnt::Validator.validates('hello', type: :integer)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should not accept a float value with type: integer' do
    validation = Evnt::Validator.validates(3.14, type: :integer)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # Float

  it 'should accept a float value with type: float' do
    validation = Evnt::Validator.validates(3.15, type: :float)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: float' do
    validation = Evnt::Validator.validates(nil, type: :float)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a string value with type: float' do
    validation = Evnt::Validator.validates('hello', type: :float)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # Symbol

  it 'should accept a symbol value with type: symbol' do
    validation = Evnt::Validator.validates(:hello, type: :symbol)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a nil value with type: symbol' do
    validation = Evnt::Validator.validates(nil, type: :symbol)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept a string value with type: symbol' do
    validation = Evnt::Validator.validates('hello', type: :symbol)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should not accept a integer value with type: symbol' do
    validation = Evnt::Validator.validates(5, type: :symbol)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  # Presence:
  # The presence validation permit to check that a value is
  # not nil. Every other value that is not nil should be accepted.
  #################################################################

  it 'should not accept a nil value with presence: true' do
    validation = Evnt::Validator.validates(nil, presence: true)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should accept a not nil value with presence: true' do
    validation = Evnt::Validator.validates('foo', presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept an empty array value with presence: true' do
    validation = Evnt::Validator.validates([], presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept an empty hash value with presence: true' do
    validation = Evnt::Validator.validates({}, presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a false boolean value with presence: true' do
    validation = Evnt::Validator.validates(false, presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should accept a true boolean value with presence: true' do
    validation = Evnt::Validator.validates(true, presence: true)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept an empty string value with presence: false' do
    validation = Evnt::Validator.validates('', presence: false)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

  it 'should accept a nil value with presence: false' do
    validation = Evnt::Validator.validates(nil, presence: false)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  # Blank:
  # The blank validation check a string is not empty.
  #################################################################

  it 'should accept a long string value with blank: false' do
    validation = Evnt::Validator.validates('helloworld', blank: false)
    expect(validation).not_to be nil
    expect(validation).to be true
  end

  it 'should not accept an empty string value with blank: false' do
    validation = Evnt::Validator.validates('', blank: false)
    expect(validation).not_to be nil
    expect(validation).to be false
  end

end
