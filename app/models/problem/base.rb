module Problem
  class Base < ActiveRecord::Base
    self.table_name = :problems
    belongs_to :operator
    has_many :attempts,
             class_name: 'Attempt',
             foreign_key: :problem_id

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
      attempts.create(success: false)
    end

    def log_success!
      attempts.create(success: true)
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
