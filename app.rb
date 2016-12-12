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
  erb(:success)
end

get('/divisions/new') do
  erb(:division_form)
end

patch('/divisions') do
  @division = Division.find(params.fetch("id").to_i())
  name = params.fetch("name")
  @division.update({:name => name})
  erb(:success)
end

get('/division/:id') do
  @division = Division.find(params.fetch("id").to_i)
  @employees = Employee.where(division_id: @division.id).order(name: :desc)
  erb(:division)
end

# post('/divisions/:id')

delete('/division/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division.delete()
  erb(:success)
end

post('/division/:id/employee_form') do
  @division = Division.find(params.fetch('division_id').to_i())
  erb(:employee_form)
end

post('/new_employee') do
  @division = Division.find(params.fetch('division_id').to_i)
  new_name = params.fetch('employee_name')
  new_employee = Employee.new({:name => new_name, :division_id => @division.id()})
  new_employee.save()
  erb(:success)
end
