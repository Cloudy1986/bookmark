require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require './lib/comment'
require './lib/user'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = Bookmark.find(id: params['id'])
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params['comment'], bookmark_id: params['id'])
    redirect '/bookmarks'
  end

  get '/sign-up' do
    erb :'users/new'
  end

  post '/sign-up' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end

  get '/log-in' do
    erb :'users/log_in'
  end

  run! if app_file == $0
end
