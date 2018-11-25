require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base
enable :sessions, :method_override


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

delete '/:id' do
  p params
  Bookmark.delete(id: params[:id])
  # connection = PG.connect(dbname: 'bookmark_manager_test')
  # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
  redirect '/'
end



  run! if app_file == $0
end
