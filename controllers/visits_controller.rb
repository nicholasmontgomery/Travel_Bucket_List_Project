require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/cities.rb' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries.rb' )
require_relative( '../models/visits.rb' )
also_reload( '../models/*' )

get '/visits' do
  @visits = Visit.all
  erb ( :"visits/index" )
end

get '/visits/new' do #new
  @visits = Visit.all
  erb(:"visits/new")
end

post '/visits' do #create
  @visit = Visit.new(params)
  @visit.save
  redirect to("/visits")
end

get '/visits/:id' do
  @visit = Visit.find( params['id'])
  erb(:"visits/show")
end

post '/visits/:id/delete' do #delete
  Visit.delete(params[:id])
  redirect to("/visits")
end
