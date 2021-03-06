require_relative('../db/sql_runner')

class City

  attr_reader :id
  attr_accessor :name, :visited, :country_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @visited = options['visited']
    @country_id = options['country_id']
  end

  def save()
  sql = "INSERT INTO cities
  (
    name,
    visited,
    country_id
    ) VALUES (
      $1, $2, $3
      )
      RETURNING id"
      values = [@name, @visited, @country_id]
  city = SqlRunner.run(sql, values).first
  @id = city['id'].to_i
end

def update()
  sql = "UPDATE cities
  SET
  (
    name,
    visited,
    country_id
  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@name, @visited, @country_id, @id]
  SqlRunner.run( sql, values )
end

def country()
  sql = "SELECT * FROM countries WHERE id = $1"
  values = [@country_id]
  results = SqlRunner.run(sql, values)
  city_country = results[0]
  country = Country.new(city_country)
  return country
end

def visits()
  sql = "SELECT * FROM visits WHERE city_id = $1"
  values = [@id]
  visits = SqlRunner.run(sql, values)
  result = visits.map{ |visit| Visit.new(visit)}
  return result
end

def self.delete(id)
  sql = "DELETE FROM cities
  WHERE id = $1"
  values = [id]
  SqlRunner.run( sql, values )
end

def self.visited()
  sql = "SELECT * FROM cities WHERE visited = true"
  cities = SqlRunner.run(sql)
  result = cities.map{ |city| City.new(city)}
  return result
end

def self.not_visited()
  sql = "SELECT * FROM cities WHERE visited = false"
  cities = SqlRunner.run(sql)
  result = cities.map{ |city| City.new(city)}
  return result
end


def self.all()
  sql = "SELECT * FROM cities"
  cities = SqlRunner.run(sql)
  result = cities.map{ |city| City.new(city)}
  return result
end

def self.delete_all()
      sql = "DELETE FROM cities;"
      SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM cities
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return City.new( results.first )
  end

end
