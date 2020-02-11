require_relative('../db/sql_runner')

class Visit

  attr_reader :id
  attr_accessor :visit_date, :url, :comment, :city_id

  def initialize(options)
    @id = options['id'].to_i
    @visit_date = options['visit_date']
    @url = options['url']
    @comment = options['comment']
    @city_id = options['city_id']
  end

  def save()
  sql = "INSERT INTO visits
  (
    visit_date,
    url,
    comment,
    city_id
    ) VALUES (
      $1, $2, $3, $4
      )
      RETURNING id"
      values = [@visit_date, @url, @comment, @city_id]
      visit = SqlRunner.run(sql, values).first
      @id = visit['id'].to_i
    end

  # def sight()
  #   sql = "SELECT * FROM sights WHERE id = $1"
  #   values= [@sight_id]
  #   results = SqlRunner.run(sql, values)
  #   visit_sight = results[0]
  #   sight = Sight.new(visit_sight)
  #   return sight
  # end

  def city()
    sql = "SELECT * FROM cities WHERE id = $1"
    values= [@city_id]
    results = SqlRunner.run(sql, values)
    visit_city = results[0]
    city = City.new(visit_city)
    return city
  end

  def self.find( id )
    sql = "SELECT * FROM visits
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Visit.new( results.first )
  end

  def self.delete(id)
    sql = "DELETE FROM visits
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM visits"
    visits = SqlRunner.run(sql)
    result = visits.map{ |visit| Visit.new(visit)}
    return result
  end

def self.delete_all()
      sql = "DELETE FROM visits;"
      SqlRunner.run(sql)
  end

end
