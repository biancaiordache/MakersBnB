require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/listing'
require_relative './lib/user'
require_relative './database_connection_setup.rb'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'MakersBnB'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/spaces')
  end

  get '/spaces' do
    @user = User.find(id: session[:user_id])
    @listings = Listing.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Listing.create(name: params[:name], description: params[:description])
    redirect '/spaces'
  end

  run! if app_file == $0
end
