require_relative('../db/sql_runner')

class Sight

  attr_reader :id
  attr_accessor :name, :city_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @city_id = options['city_id']
  end

  def save()
  sql = "INSERT INTO sights
  (
    name,
    city_id
    ) VALUES (
      $1, $2
      )
      RETURNING id"
      values = [@name, @city_id]
  sight = SqlRunner.run(sql, values).first
  @id = sight['id'].to_i
end

def self.delete_all()
      sql = "DELETE FROM sights;"
      SqlRunner.run(sql)
  end

end
