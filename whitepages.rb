require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'haml'

get '/', :provides => 'html' do
  contacts = [
    {:name => 'Ren', :number => '0431 123 456'},
    {:name => 'Mitko', :number => '0430 123 456'},
    {:name => 'Stephen', :number => '0430 123 456'},
    {:name => 'Ken', :number => '0430 123 456'}
  ]
  contacts.each_with_index.map {|contact, index| contact[:avatar] = "images/dius#{index % 3 + 1}.png"}

  haml :index, :locals => { :contacts => contacts }
end

get '/search' do
  "searching for #{params[:term]}..."
end

get '/style.css' do
    scss :'/style'
end
