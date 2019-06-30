module Problem
  class Base < ActiveRecord::Base
    self.table_name = :problems
    belongs_to :operator

    validates_uniqueness_of :operator_id, scope: %i[x_value y_value]

    scope :addition, -> { where(operator: Operator.for(:addition)) }
    scope :subtraction, -> { where(operator: Operator.for(:subtraction)) }
    scope :multiplication, -> { where(operator: Operator.for(:multiplication)) }
    scope :division, -> { where(operator: Operator.for(:division)) }

    def as_subclass
      subclass.find(id)
    end

    def readonly?
      true
    end

    def log_failure!
      update(attempts: (attempts + 1))
    end

    def log_success!
      update(attempts: (attempts + 1), correct_answers: (correct_answers + 1))
    end

    private

    def subclass
      case operator
      when Operator.for(:addition)
        Addition
      when Operator.for(:division)
        Division
      when Operator.for(:multiplication)
        Multiplication
      when Operator.for(:subtraction)
        Subtraction
      end
    end

  end
end
