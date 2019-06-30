module Problem
  class View < ActiveRecord::Base
    self.table_name = :problem_views

    def read_only?
      true
    end
  end
end
