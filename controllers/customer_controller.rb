require( 'sinatra')
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/customers.rb' )
require_relative( '../models/fitness.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all
  erb(:"customers/index")
end

get '/customers/new' do
  @customers = Customer.all
  erb(:"customers/new")
end

post '/customers' do
  customers = Customer.new(params)
  customers.save
  redirect to("/customers")
end

post '/customers/:id/delete' do
  Customer.destroy(params[:id])
  redirect to("/customers")
end
