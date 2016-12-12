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

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

post('/divisions') do
  name = params.fetch("name")
  division = Division.new({:name => name, :id => nil})
  division.save()
  erb(:division_success)
end

get('/divisions/new') do
  erb(:division_form)
end

patch('/divisions') do
  @division = Division.find(params.fetch("id").to_i())
  name = params.fetch("name")
  @division.update({:name => name})
  erb(:division_success)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i)
  erb(:division)
end

delete('/division/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division.delete()
  erb(:division_success)
end
