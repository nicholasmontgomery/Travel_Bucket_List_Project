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

  def country()
    sql = "SELECT * FROM countries WHERE continent_id = $1"
    values = [@id]
    countries = SqlRunner.run(sql, values)
    result = countries.map{ |country| Country.new(country)}
    return result
  end

  def update()
    sql = "UPDATE continents
    SET
    (
      name,
      visited
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @visited, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM continents
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM continents
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Continent.new( results.first )
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

  def self.get_route(name)
    sql = "SELECT * FROM continents
    WHERE name = $1"
    values = [name]
    result = SqlRunner.run( sql, values )[0]
    id = result['id']
    return "/continents/#{id}"
  end
end
