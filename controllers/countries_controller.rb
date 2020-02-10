require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/countries' do
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"countries/index" )
end

get '/countries/new' do
  erb(:"countries/new")
end

post '/countries' do
  @country = Country.new(params)
  @country.save
  redirect to("/countries")
end

post '/continents/:id/delete' do
  Country.destroy(params[:id])
  redirect to("/countries")
end
