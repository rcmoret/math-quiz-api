class Operator < ActiveRecord::Base
  ADDITION = { name: 'addition', symbol: '+' }.freeze
  SUBTRACTION = { name: 'subtraction', symbol: '-' }.freeze
  MULTIPLICATION = { name: 'multiplication', symbol: 'x' }.freeze
  DIVISION = { name: 'division', symbol: '÷' }.freeze
  VALID_OPERATORS = {
    addition: ADDITION,
    subtraction: SUBTRACTION,
    multiplication: MULTIPLICATION,
    division: DIVISION
  }.freeze

  VALID_NAMES = VALID_OPERATORS.values.map { |operator| operator[:name] }.freeze
  VALID_SYMBOLS = VALID_OPERATORS.values.map { |operator| operator[:symbol] }.freeze

  validates :name, inclusion: { in: VALID_NAMES }
  validates :symbol, inclusion: { in: VALID_SYMBOLS }

  def self.for(name)
    find_or_create_by(VALID_OPERATORS.fetch(name.to_sym))
  end
end
