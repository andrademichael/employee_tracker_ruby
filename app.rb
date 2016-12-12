require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/division.rb')
require('./lib/employee.rb')
require('pg')
require('pry')

get('/') do
  erb(:index)
end
