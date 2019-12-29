
require 'sinatra'

def resolve_url name
  "http://#{name}.hesamian.com"
end

get '/' do
  erb :index, :layout => :layout, :locals => {
    :pairs => [
      { 'url' => resolve_url('hooman'), 'name' => "Hooman Hesamian"},
      { 'url' => resolve_url('amir'), 'name' => "Amir Hesamian"}
    ]
  }
end

get '/:name' do
  redirect resolve_url params['name']
end