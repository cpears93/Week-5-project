require( 'sinatra')
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/x.rb' )
require_relative( '../models/y.rb' )
require_relative( '../models/z.rb' )
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
  redirect to("/bitings")
end
