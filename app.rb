require 'sinatra'
require 'sinatra/multi_route'
require 'sinatra/reloader' if development?

def active?(path="/")
    (request.path==path || request.path==path+'/') ? ("active") : (nil)
end

get '/' do
    erb :index
end

get '/home' do
    redirect to('/')
end

get '/actor' do
    erb :actor
end

get '/contact' do
    erb :contact
end

get '/model' do
    erb :model
end

get '/about' do
    erb :about
end

not_found do
    "LINK IS NOT FOUND GO BACK <a href='/home'>HOME</a>"
end

post '/contact' do
    redirect to('/')
end
