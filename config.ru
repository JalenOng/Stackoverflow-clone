# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application


environment = Sprockets::Environment.new
environment.append_path 'app/assets/javascripts'
environment.append_path 'lib/assets/javascripts'
environment.append_path 'vendor/assets/jquery'