equire_relative( "../models/cities.rb" )
require_relative( "../models/continents.rb" )
require_relative( "../models/countries.rb" )
require_relative( "../models/sites.rb" )
require_relative( "../models/visits.rb" )

require("pry-byebug")

Visit.delete_all()
Site.delete_all()
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
  "name" => "France"
  "continent_id" => continent1.id
  })

  country1.save()

country2 = Country.new({
  "name" => "Kenya"
  "continent_id" => continent2.id
  })

  country2.save()

country3 = Country.new({
  "name" => "India"
  "continent_id" => continent3.id
  })

  country3.save()
