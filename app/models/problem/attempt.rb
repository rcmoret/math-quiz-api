module Problem
  class Attempt < ActiveRecord::Base
    self.table_name = :attempts

    belongs_to :problem,
               class_name: 'Base',
               foreign_key: :problem_id,
               required: true

  end
end
