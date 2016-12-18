require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb (:'index')
  end

  get '/posts/new' do
    erb (:'new')
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb (:'edit')
  end

  post '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

  post '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb (:'show')
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb (:'show')
  end

  post '/posts' do
    Post.create(name: params[:post][:name], content: params[:post][:content])
    @posts = Post.all
    erb (:'index')
  end

  get '/' do

  end
end
