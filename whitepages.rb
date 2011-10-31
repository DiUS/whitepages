require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'haml'
require 'json'

get '/', :provides => 'html' do
  contacts = JSON.parse mockData
  haml :index, :locals => { :contacts => contacts }
end

get '/search' do
  "searching for #{params[:term]}..."
end

get '/style.css' do
    scss :'/style'
end

def mockData
  data  = [
    {:name => 'Ren', :number => '0431 123 456',},
    {:name => 'Mitko', :number => '0430 123 456'},
    {:name => 'Stephen', :number => '0430 123 456'},
    {:name => 'Ken', :number => '0430 123 456'}
  ]
  data.each_with_index.map {|contact, index| contact[:avatar] = "images/dius#{index % 3 + 1}.png"}
  JSON.generate(data)
end
