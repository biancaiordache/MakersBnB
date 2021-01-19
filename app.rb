require "sinatra/base"

class MyApp < Sinatra::Base
  get '/' do
    "Hello from MyApp!"
  end
end