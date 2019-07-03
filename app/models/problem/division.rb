module Problem
  class Division < Problem::Base
    default_scope { division }

    validates :x_value, inclusion: (0..99)
    validates :y_value, inclusion: (1..10)
    validate :even_divisibilty!

    def readonly?
      false
    end

    private

    def even_divisibilty!
      return if y_value.zero?
      return if (x_value % y_value).zero?
      errors.add(:values, 'Must be evenly divisible')
    end
  end
end
