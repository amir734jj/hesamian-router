require 'sinatra'
require "json"
require 'rest-client'

def resolve_website_url name
  "http://#{name}.hesamian.com"
end

resume = {
  "amir" => {
    'url' => resolve_website_url('hooman'),
    'name' => 'Hooman Hesamian',
    'email' => 'mailto:hooman@hesamian.com',
    'github' => 'https://github.com/hooman734/',
    'linkedin' => 'https://www.linkedin.com/in/hesamyan/',
    'resume' => 'resume/hooman',
    'pdf' => 'https://docs.google.com/document/d/1WRdXjE4SV2XGeFJrxuVcg1RmHmaa01Vgey465b8jXPM/export?format=pdf',
    'filename' => 'seyedhooman-hesamyan.pdf'
  },
  "hooman" => {
    'url' => resolve_website_url('amir'),
    'name' => 'Amir Hesamian',
    'email' => 'mailto:amir@hesamian.com',
    'github' => 'https://github.com/amir734jj/',
    'linkedin' => 'https://www.linkedin.com/in/hesamian/',
    'resume' => '/resume/amir',
    'pdf' => 'https://docs.google.com/document/d/1O99oMXhvu4vYd09WLvC9G2OWB3W3iNWJzYOVHBpVftI/export?format=pdf',
    'filename' => 'seyedamirhossein-hesamian.pdf'
  }
}

get '/' do
  erb :index, :layout => :layout, :locals => {
    :pairs => resume.values
  }
end

get '/resume/:name' do |name|
  content_type 'application/octet-stream'
  headers["Content-Disposition"] = "attachment;filename=#{@resume[name]["filename"]}"
  RestClient.get(resume[name]["pdf"])
end

get '/:name' do
  redirect resolve_website_url params['name']
end