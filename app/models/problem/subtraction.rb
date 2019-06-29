module Problem
  class Subtraction < Problem::Base
    default_scope { subtraction }

    validates :x_value, inclusion: (1..30)
    validates :y_value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :x_value }

    def readonly?
      false
    end
  end
end

