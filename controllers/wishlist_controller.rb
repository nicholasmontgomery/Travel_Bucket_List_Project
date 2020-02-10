require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/wishlist' do
  @cities = City.not_visited
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"wishlist/index" )
end

get '/wishlist/new' do
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb(:"wishlist/new")
end

post '/wishlist' do
  visit = Visit.new(params)
  visit.save
  redirect to("/wishlist")
end

post '/wishlist/:id/delete' do
  Visit.destroy(params[:id])
  redirect to("/wishlist")
end
