module Problem
  class Division < Problem::Base
    default_scope { division }

    X_RANGE = (0..99)
    Y_RANGE = (1..10)
    validates :x_value, inclusion: X_RANGE
    validates :y_value, inclusion: Y_RANGE
    validate :divisibilty_by_zero
    validate :even_divisibilty!
    validate :difficulty_level

    def readonly?
      false
    end

    private

    def divisibilty_by_zero
      return unless y_value.zero?

      errors.add(:divisibilty, 'y value cannot be 0')
    end

    def difficulty_level
      return if x_value / y_value <= 10

      errors.add(:difficulty, 'Quotient must be 10 or less')
    end

    def even_divisibilty!
      return if (x_value % y_value).zero?

      errors.add(:values, 'Must be evenly divisible')
    end
  end
end
