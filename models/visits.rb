require_relative('../db/sql_runner')

class Visit

  attr_reader :id
  attr_accessor :visit_date, :url, :sight_id, :city_id

  def initialize(options)
    @id = options['id'].to_i
    @visit_date = options['visit_date']
    @url = options['url']
    @sight_id = options['sight_id']
    @city_id = options['city_id']

  end

  def save()
  sql = "INSERT INTO visits
  (
    visit_date,
    url,
    sight_id,
    city_id
    ) VALUES (
      $1, $2, $3, $4
      )
      RETURNING id"
      values = [@visit_date, @url, @sight_id, @city_id]
  visit = SqlRunner.run(sql, values).first
  @id = visit['id'].to_i
end

  def sight()
    sql = "SELECT * FROM sights WHERE id = $1"
    values= [@sight_id]
    results = SqlRunner.run(sql, values)
    visit_sight = results[0]
    sight = Sight.new(visit_sight)
    return sight
  end

  def city()
    sql = "SELECT * FROM cities WHERE id = $1"
    values= [@city_id]
    results = SqlRunner.run(sql, values)
    visit_city = results[0]
    city = City.new(visit_city)
    return city
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map{ |student| Student.new(student)}
    return result
  end

def self.delete_all()
      sql = "DELETE FROM visits;"
      SqlRunner.run(sql)
  end

end
