require_relative( "../models/continents.rb" )
require_relative( "../models/countries.rb" )
require_relative( "../models/cities.rb" )
require_relative( "../models/sights.rb" )
require_relative( "../models/visits.rb" )

require("pry-byebug")

Visit.delete_all()
Sight.delete_all()
City.delete_all()
Country.delete_all()
Continent.delete_all()

continent1 = Continent.new({
  "name" => "Europe"
  })

  continent1.save()

continent2 = Continent.new({
  "name" => "Africa"
  })

  continent2.save()

continent3 = Continent.new({
  "name" => "Asia"
  })

  continent3.save()

country1 = Country.new({
  "name" => "France",
  "continent_id" => continent1.id
  })

  country1.save()

country2 = Country.new({
  "name" => "Kenya",
  "continent_id" => continent2.id
  })

  country2.save()

country3 = Country.new({
  "name" => "India",
  "continent_id" => continent3.id
  })

  country3.save()

city1 = City.new({
  "name" => "Paris",
  "country_id" => country1.id
  })

  city1.save()

city2 = City.new({
  "name" => "Nairobi",
  "country_id" => country2.id
  })

  city2.save()

city3 = City.new({
  "name" => "New Delhi",
  "country_id" => country3.id
  })

  city3.save()


sight1 = Sight.new({
  "name" => "Louvre Museum",
  "city_id" => city1.id
  })

  sight1.save()

sight2 = Sight.new({
  "name" => "Nairobi National Park",
  "city_id" => city2.id
  })

  sight2.save()

sight3 = Sight.new({
  "name" => "Red Fort",
  "city_id" => city3.id
  })

  city3.save()

visit1 = Visit.new({
  "city_id" => city1.id,
  "sight_id" => sight1.id,
  "visit_date" => "22.08.17",
  "url" => "/louvre.jpg"
  })

  visit1.save()

visit2 = Visit.new({
  "city_id" => city2.id,
  "sight_id" => sight2.id,
  "visit_date" => "15.05.18",
  "url" => "/nairobi_national_park.jpg"
  })

  visit2.save()

visit3 = Visit.new({
  "city_id" => city3.id,
  "sight_id" => sight3.id,
  "visit_date" => "03.10.19",
  "url" => "/red_fort.jpg"
  })

  visit3.save()
