require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"cities/index" )
end

get '/cities/new' do
  erb(:"cities/new")
end

post '/cities' do
  @city = City.new(params)
  @city.save
  redirect to("/cities")
end

post '/cities/:id/delete' do
  City.destroy(params[:id])
  redirect to("/cities")
end
