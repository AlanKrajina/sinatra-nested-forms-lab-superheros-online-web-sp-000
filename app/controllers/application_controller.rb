require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :first
  end
  
  post '/teams' do
  @team = Team.new(params[:team])       

  params[:team][:heroes].each do |details|    
    Hero.new(details)                          
  end

  @heroes = Hero.all                            

  erb :team

  end

end
