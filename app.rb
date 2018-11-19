require 'sinatra/base'

class Bookmarks < Sinatra::Base

get '/' do
  "Hello Bookmarks World"
end

  run! if app_file == $0
end
