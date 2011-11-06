require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'haml'
require 'json'

get '/', :provides => 'html' do
  contacts = JSON.parse mock_data
  haml :index, :locals => { :contacts => contacts }
end

def mock_data
  data  = search_contacts
  data.each_with_index.map {|contact, index| contact[:avatar] = "images/dius#{index % 3 + 1}.png"}
  JSON.generate(data)
end

get '/search' do
  content_type :json
  contacts = search_contacts params[:keyword]
  contacts.to_json
end

get '/style.css' do
    scss :'/style'
end

def search_contacts(keyword = '')
  contacts = [
    {:name => 'Ren Shao', :number => '0431 123 456',},
    {:name => 'Mitko', :number => '0430 123 456'},
    {:name => 'Stephen', :number => '0430 123 456'},
    {:name => 'Ken', :number => '0430 123 456'}
  ]

  unless keyword.empty?
    contacts.delete_at 3
  end

  contacts
end