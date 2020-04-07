require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/bookings.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Bookings.all()
  ern ( :"bookings/index")
end

get 'bookings/:id' do
  @bookings = Bookings.find(params['id'].to_i)
  erb (:"bookings/show")
end
