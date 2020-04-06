require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/fitness.rb' )
also_reload( '../models/*' )

get '/fitness' do
  @fitness_class = Fitness.all()
  ern ( :"fitness/index")
end

get 'fitness/:id' do
  @fitness_class = Fitness.find(params['id'].to_i)
  erb (:"fitness/show")
end
