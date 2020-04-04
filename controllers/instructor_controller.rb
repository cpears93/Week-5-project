require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/instructors.rb' )
also_reload( '../models/*' )

get '/instructor' do
  @instructor = Instructor.all()
  ern ( :"instructor/index")
end

get 'insructor/:id' do
  @instructor = Instructor.find(params['id'].to_i)
  erb (:"instructor/show")
end
