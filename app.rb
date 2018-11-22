require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base

get '/' do
  @bookmarks = Bookmark.all
  erb(:list)
end

get '/add-bookmark' do
  erb(:add_bookmark)
end

post '/add-bookmark' do
  Bookmark.create(url: params[:url], title: params[:title])
  redirect '/'
end

  run! if app_file == $0
end
