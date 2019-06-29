module Problem
  class Multiplication < Problem::Base
    default_scope { multiplication }

    validates :x_value, inclusion: (1..10)
    validates :y_value, inclusion: (1..10)

    def readonly?
      false
    end
  end
end

