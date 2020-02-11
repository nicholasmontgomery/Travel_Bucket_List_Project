require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/countries' do #index
  @cities = City.all
  @continents = Continent.all
  @countries = Country.all
  @visits = Visit.all
  erb ( :"countries/index" )
end

get '/countries/new' do #new
  @continents = Continent.all
  erb(:"countries/new")
end

post '/countries' do #create
  @country = Country.new(params)
  @country.save
  redirect to("/countries")
end

get '/countries/:id' do
  @country = Country.find( params['id'])
  @cities = @country.city()
  erb(:"countries/show")
end

post '/continents/:id/delete' do #delete
  Country.delete(params[:id])
  redirect to("/countries")
end

# delete all

# edit

# update
