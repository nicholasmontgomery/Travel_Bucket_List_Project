require_relative('../db/sql_runner')

class Continent

  attr_reader :id
  attr_accessor :name, :visited

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO continents
    (
      name,
      visited
      ) VALUES (
        $1, $2
        )
        RETURNING id"
        values = [@name, @visited]
    continent = SqlRunner.run(sql, values).first
    @id = continent['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM continents"
    continents = SqlRunner.run(sql)
    result = continents.map{ |continent| Continent.new(continent)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM continents;"
    SqlRunner.run(sql)
  end

end
