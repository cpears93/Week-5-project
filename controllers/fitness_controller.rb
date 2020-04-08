require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/fitness.rb' )
also_reload( '../models/*' )

get '/fitness' do
  @fitness = Fitness.all()
  erb (:"fitness_class/index")
end

get '/fitness/:id' do
  @fitness = Fitness.find(params['id'].to_i)
  erb (:"fitness_class/show")
end
