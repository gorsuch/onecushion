require 'rubygems'
require 'rack_errorpage'
require 'rack_bugzscout'

require 'cushion'

use Rack::ErrorPage, './public/500.html'
use Rack::BugzScout, "https://styledbits.fogbugz.com/scoutsubmit.asp", "Michael Gorsuch", "inbox", "undecided"
run Sinatra::Application