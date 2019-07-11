module Problem
  class Division < Problem::Base
    default_scope { division }

    validates :x_value, inclusion: (0..99)
    validates :y_value, inclusion: (1..10)
    validate :even_divisibilty!
    validate :difficulty_level

    def readonly?
      false
    end

    private

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
