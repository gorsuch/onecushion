require 'rubygems'
require 'rack_errorpage'

require 'cushion'

use Rack::ErrorPage, './public/500.html'
run Sinatra::Application