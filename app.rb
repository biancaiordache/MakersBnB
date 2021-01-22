require 'sinatra/base'
#require 'pg'
#require './lib/contact'

class MakersBnB < Sinatra::Base
  get '/' do
    "Testing"
  end

  get '/spaces' do
    erb :listing
  end

  #get '/spaces' do

  #end
end
