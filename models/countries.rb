require_relative('../db/sql_runner')

class Country

  attr_reader :id
  attr_accessor :name, :visited

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @visited = options['visited']
    @continent_id = options['continent_id']
  end

  def save()
  sql = "INSERT INTO countries
  (
    name,
    visited,
    continent_id
    ) VALUES (
      $1, $2, $3
      )
      RETURNING id"
      values = [@name, @visited, @continent_id]
    country = SqlRunner.run(sql, values).first
    @id = country['id'].to_i
  end

  def update()
    sql = "UPDATE countries
    SET
    (
      name,
      visited,
      continent_id
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @visited, @continent_id]
    SqlRunner.run( sql, values )
  end

  def continent()
    sql = "SELECT * FROM continents WHERE id = $1"
    values = [@continent_id]
    results = SqlRunner.run(sql, values)
    country_continent = results[0]
    continent = Continent.new(country_continent)
    return continent
  end

  def city
    sql = "SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    result = cities.map{ |city| City.new(city)}
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Country.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM countries"
    countries = SqlRunner.run(sql)
    result = countries.map{ |country| Country.new(country)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM countries;"
    SqlRunner.run(sql)
  end

end
