require 'sinatra'

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
        'linkedin' => 'https://www.linkedin.com/in/hesamyan/'
      },
      {
        'url' => resolve_url('amir'),
        'name' => 'Amir Hesamian',
        'email' => 'mailto:amir@hesamian.com',
        'github' => 'https://github.com/amir734jj/',
        'linkedin' => 'https://www.linkedin.com/in/hesamian/'
      }
    ]
  }
end

get '/:name' do
  redirect resolve_url params['name']
end