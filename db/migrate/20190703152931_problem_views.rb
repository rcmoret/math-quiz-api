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
      SELECT p.id AS id,
             p.x_value,
             p.y_value,
             o.name,
             o.symbol,
             (SELECT count(a.id)
              FROM attempts a
              WHERE a.problem_id = p.id
              AND a.success = 't') AS successful_attempts,
             (SELECT count(a.id)
              FROM attempts a
              WHERE a.problem_id = p.id) AS total_attempts
          FROM problems p
          JOIN operators o on o.id = p.operator_id
    SQL
  end

  def drop_statement
    "DROP VIEW IF EXISTS #{VIEW_NAME}"
  end
end
