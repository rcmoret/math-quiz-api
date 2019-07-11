module Problem
  class Multiplication < Problem::Base
    default_scope { multiplication }

    X_RANGE = (1..10)
    Y_RANGE = (1..10)
    validates :x_value, inclusion: X_RANGE
    validates :y_value, inclusion: Y_RANGE

    def readonly?
      false
    end
  end
end

