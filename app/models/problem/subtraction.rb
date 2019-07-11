module Problem
  class Subtraction < Problem::Base
    default_scope { subtraction }

    X_RANGE = (1..30)
    Y_RANGE = X_RANGE
    validates :x_value, inclusion: X_RANGE
    validates :y_value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :x_value }

    def readonly?
      false
    end
  end
end

