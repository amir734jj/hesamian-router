require 'sinatra'
require "json"

def resolve_url name
  "http://#{name}.hesamian.com"
end

get '/' do
  erb :index, :layout => :layout, :locals => {
    :pairs => [
      {
        'url' => resolve_url('hooman'),
        'name' => 'Hooman Hesamian',
        'email' => 'mailto:hooman@hesamian.com',
        'github' => 'https://github.com/hooman734/',
        'linkedin' => 'https://www.linkedin.com/in/hesamyan/',
        'resume' => 'https://docs.google.com/document/d/1WRdXjE4SV2XGeFJrxuVcg1RmHmaa01Vgey465b8jXPM/export?format=pdf'
      },
      {
        'url' => resolve_url('amir'),
        'name' => 'Amir Hesamian',
        'email' => 'mailto:amir@hesamian.com',
        'github' => 'https://github.com/amir734jj/',
        'linkedin' => 'https://www.linkedin.com/in/hesamian/',
        'resume' => 'https://docs.google.com/document/d/1O99oMXhvu4vYd09WLvC9G2OWB3W3iNWJzYOVHBpVftI/export?format=pdf'
      }
    ]
  }
end

get '/:name' do
  redirect resolve_url params['name']
end