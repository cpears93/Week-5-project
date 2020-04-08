require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/bookings.rb' )
require_relative( '../models/fitness.rb' )
require_relative( '../models/customers.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb ( :"bookings/index")
end

get '/bookings/new' do
  @customers = Customer.all
  @fitness = Fitness.all
  erb(:"bookings/new")
end

post '/bookings' do
  bookings = Booking.new(params)
  bookings.save
  redirect to("/bookings")
end
