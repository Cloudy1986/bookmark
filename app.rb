require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/bookmark'
require './lib/comment'
require './lib/user'

class BookmarkManager < Sinatra::Base
  configure :development, :test do
    register Sinatra::Reloader
    register Sinatra::Flash
    enable :sessions, :method_override
  end

  def must_be_logged_in
    if !session[:user_id]
      redirect '/'
    end
  end

  get '/' do
    erb :'homepage'
  end

  get '/bookmarks' do
    must_be_logged_in
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    must_be_logged_in
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
    must_be_logged_in
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    must_be_logged_in
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

  post '/log-in' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect '/bookmarks'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/log-in'
    end
  end

  post '/log-in/destroy' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect '/'
  end

  run! if app_file == $0
end
