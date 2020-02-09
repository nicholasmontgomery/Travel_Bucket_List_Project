require_relative('../db/sql_runner')

class Country

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @continent_id = options['continent_id']
  end

  def save()
  sql = "INSERT INTO countries
  (
    name,
    continent_id
    ) VALUES (
      $1, $2
      )
      RETURNING id"
      values = [@name, @continent_id]
    country = SqlRunner.run(sql, values).first
    @id = country['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM countries;"
    SqlRunner.run(sql)
  end

end
