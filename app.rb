require 'sinatra/base'
require './lib/Bookmarks.rb'
require './database_connection_setup'

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

  get '/:id/edit' do
    # @bookmark_id = params[:id]
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/:id' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("UPDATE bookmarks SET url = '#{params[:url]}', title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/')
  end


    run! if app_file == $0
end
