require( 'sinatra')
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/customers.rb' )
require_relative( '../models/fitness.rb' )
require_relative( '../models/instructors.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customer = Customer.all
  erb(:"customers/new")
end

get '/customers/new' do
  @customer = Customer.all
  erb(:"customers/new")
end

post '.customers' do
  customers = Customers.new(params)
  customers.save
  redirect to("/customers")
end

post '/customers/:id/delete' do
  Customers.destroy(params[:id])
  redirect to("/customers")
end
