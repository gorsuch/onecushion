require 'rubygems'
require 'rack_errorpage'
require 'rack_bugzscout'

require 'cushion'

use Rack::ErrorPage, './public/500.html'
use Rack::BugzScout, ENV['BUGZSCOUT_URL'] || 'https://foobar.fogbugz.com/scoutsubmit.asp', ENV['BUGZSCOUT_USER'] || 'John Doe', ENV['BUGZSCOUT_PROJECT'] || 'inbox', ENV['BUGZSCOUT_AREA'] || 'undecided'
run Sinatra::Application