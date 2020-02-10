require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/visited' do
  @cities = City.visited
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"visited/index" )
end

get '/visited/new' do
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb(:"visited/new")
end

post '/visited' do
  visit = Visit.new(params)
  visit.save
  redirect to("/visited")
end

post '/visited/:id/delete' do
  Visit.destroy(params[:id])
  redirect to("/visited")
end
