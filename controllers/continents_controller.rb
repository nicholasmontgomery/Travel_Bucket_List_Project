require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/continents' do
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"continents/index" )
end

get '/continents/new' do
  erb(:"continents/new")
end

post '/continents' do
  @continent = Continent.new(params)
  @continent.save
  redirect to("/continents")
end

post '/continents/:id/delete' do
  Continent.destroy(params[:id])
  redirect to("/continents")
end
