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

def self.delete_all()
      sql = "DELETE FROM visits;"
      SqlRunner.run(sql)
  end

end
