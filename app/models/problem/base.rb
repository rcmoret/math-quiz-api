module Problem
  class Base < ActiveRecord::Base
    self.table_name = :problems
    belongs_to :operator

    scope :multiplication, -> { joins(:operator).merge(Operator.for(:multiplication)) }
  end
end
