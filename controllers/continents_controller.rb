require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/sights.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/continents' do #index / is all the instance variables below needed?
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @sights = Sight.all
  @visits = Visit.all
  erb ( :"continents/index" )
end

get '/continents/new' do #new
  erb(:"continents/new")
end

get '/continents/:id' do
  @continent = Continent.find( params['id'])
  @countries = @continent.country()
  erb(:"continents/show")
end

post '/continents' do #create
  @continent = Continent.new(params)
  @continent.save
  redirect to("/continents")
end

post '/continents/:id/delete' do #delete
  Continent.destroy(params[:id])
  redirect to("/continents")
end

#delete_all

#edit

#update
