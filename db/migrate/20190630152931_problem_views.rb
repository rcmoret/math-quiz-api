class ProblemViews < ActiveRecord::Migration[5.2]
  VIEW_NAME = 'problem_views'.freeze

  def up
    execute(drop_statement)
    execute(create_statement)
  end

  def down
    execute(drop_statement)
  end

  private

  def create_statement
    <<-SQL
      CREATE VIEW #{VIEW_NAME} AS
        SELECT p.*, o.name, o.symbol
          FROM problems p
          JOIN operators o on o.id = p.operator_id
    SQL
  end

  def drop_statement
    "DROP VIEW IF EXISTS #{VIEW_NAME}"
  end
end
