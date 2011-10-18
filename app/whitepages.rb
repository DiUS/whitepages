require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'haml'

get '/', :provides => 'html' do
  haml :index
end

get '/search' do
  "searching for #{params[:term]}..."
end

get '/style.css' do
    scss :'/style'
end
