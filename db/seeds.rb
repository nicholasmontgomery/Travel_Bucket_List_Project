require_relative( "../models/continents.rb" )
require_relative( "../models/countries.rb" )
require_relative( "../models/cities.rb" )
require_relative( "../models/sights.rb" )
require_relative( "../models/visits.rb" )

require("pry-byebug")

# Visit.delete_all()
City.delete_all()
Country.delete_all()
Continent.delete_all()

continent1 = Continent.new({
  "name" => "Europe",
  "visited" =>  true
  })

  continent1.save()

continent2 = Continent.new({
  "name" => "Africa",
  "visited" =>  true
  })

  continent2.save()

continent3 = Continent.new({
  "name" => "Asia",
  "visited" =>  true
  })

  continent3.save()

continent4 = Continent.new({
  "name" => "South America",
  "visited" =>  false
  })

  continent4.save()

continent5 = Continent.new({
  "name" => "Antartica",
  "visited" =>  false
  })

  continent5.save()

country1 = Country.new({
  "name" => "France",
  "visited" =>  true,
  "continent_id" => continent1.id
  })

  country1.save()

country2 = Country.new({
  "name" => "Kenya",
  "visited" =>  true,
  "continent_id" => continent2.id
  })

  country2.save()

country3 = Country.new({
  "name" => "India",
  "visited" =>  true,
  "continent_id" => continent3.id
  })

  country3.save()

city1 = City.new({
  "name" => "Paris",
  "visited" => true,
  "country_id" => country1.id
  })

  city1.save()

city2 = City.new({
  "name" => "Nairobi",
  "visited" => true,
  "country_id" => country2.id
  })

  city2.save()

city3 = City.new({
  "name" => "New Delhi",
  "visited" => true,
  "country_id" => country3.id
  })

  city3.save()

  city4 = City.new({
    "name" => "Lyon",
    "visited" => false,
    "country_id" => country1.id
    })

    city4.save()

  city5 = City.new({
    "name" => "Goa",
    "visited" => false,
    "country_id" => country3.id
    })

    city5.save()
#
# visit1 = Visit.new({
#   "visit_date" => "22.08.17",
#   "url" => "/louvre.jpg",
#   "city_id" => city1.id
#   })
#
#   visit1.save()
#
# visit2 = Visit.new({
#   "visit_date" => "15.05.18",
#   "url" => "/nairobi_national_park.jpg",
#   "city_id" => city2.id
#   })
#
#   visit2.save()
#
# visit3 = Visit.new({
#   "visit_date" => "03.10.19",
#   "url" => "/red_fort.jpg",
#   "city_id" => city3.id
#   })
#
#   visit3.save()

  binding.pry
  nil
