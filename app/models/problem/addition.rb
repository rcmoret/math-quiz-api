module Problem
  class Addition < Problem::Base
    default_scope { addition }

    X_RANGE = (1..30)
    Y_RANGE = (1..30)
    validates :x_value, inclusion: X_RANGE
    validates :y_value, inclusion: Y_RANGE

    def readonly?
      false
    end
  end
end
