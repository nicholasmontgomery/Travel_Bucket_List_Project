require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/visited_controller')
require_relative('controllers/wishlist_controller')

get '/' do
  erb( :index )
end
