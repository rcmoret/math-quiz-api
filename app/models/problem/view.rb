module Problem
  class View < ActiveRecord::Base
    self.table_name = :problem_views
    self.primary_key = :id

    def read_only?
      true
    end
  end
end
