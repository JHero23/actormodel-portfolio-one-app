require 'sinatra/base'

require './app'

map('/') { run WebApp }
