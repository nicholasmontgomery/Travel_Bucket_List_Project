require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/cities' do # index
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @visits = Visit.all
  erb ( :"cities/index" )
end

get '/cities/new' do # new
  @cities = City.all
  @countries = Country.all
  erb(:"cities/new")
  # redirect to("/cities")
end

post '/cities' do #create
  @city = City.new(params)
  @city.save
  redirect to("/cities")
end

get '/cities/:id' do
  @city = City.find( params['id'])
  @visits = @city.visits
  @country = Country.all
  erb(:"cities/show")
end

post '/cities/:id/delete' do #delete
  City.delete(params[:id])
  redirect to("/cities")
end

get '/cities/:id/edit' do
  @city = City.find( params[:id] )
  @countries = Country.all
  erb(:"cities/edit")
end

post '/cities/:id' do
  City.new( params ).update
  redirect to '/cities'
end



# delete_all post

# edit get form with pre-populated info

# update post - fires when submit is clicked in edit
