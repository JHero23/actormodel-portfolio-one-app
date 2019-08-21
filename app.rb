require 'sinatra/base'
require 'sinatra/multi_route'
require 'sinatra/flash'
require './asset-handler'

class WebApp < Sinatra::Base
    use AssetHandler

    def set_title
        @title ||= "Actor-Model Name"
    end

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
        @title = "Actor"
        erb :actor
    end

    get '/contact' do
        @title = "Contact"
        erb :contact
    end

    get '/model' do
        @title = "Model"
        erb :model
    end

    get '/about' do
        @title = "About"
        erb :about
    end

    not_found do
        "LINK IS NOT FOUND GO BACK <a href='/home'>HOME</a>"
    end

    post '/contact' do
        flash[:notice] = "We'll keep in touch"
        redirect to('/')
    end
end
