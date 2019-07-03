module Problem
  class View < ActiveRecord::Base
    self.table_name = :problem_views
    self.primary_key = :id

    def to_hash
      attributes.symbolize_keys
    end

    def read_only?
      true
    end
  end
end
