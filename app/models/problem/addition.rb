module Problem
  class Addition < Problem::Base
    default_scope { addition }

    validates :x_value, inclusion: (1..30)
    validates :y_value, inclusion: (1..30)

    def readonly?
      false
    end
  end
end
