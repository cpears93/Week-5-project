require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')
require_relative('controllers/fitness_controller')

get '/' do
  erb( :index )
end
