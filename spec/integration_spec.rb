require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new division', {:type => :feature}) do
  it('allows user to enter text for division name and view page') do
    visit('/')
    click_link('Add New Division')
    fill_in('name', :with => 'Human Resources')
    click_button('Add Division')
    click_link('Return Home')
    click_link('View All Divisions')
    click_link('Human Resources')
    expect(page).to have_content('Human Resources')
  end
end

describe('add a new employee', {:type => :feature}) do
  it('allows user to view employees of a given division, and add new ones') do
    test_division = Division.new({:name => "Panda Wrangling", :id => nil})
    test_division.save()
    visit("/")
    click_on("View All Divisions")
    click_on("Panda Wrangling")
    click_on("Add an employee")
    fill_in("employee_name", :with => "Ling-ling")
    click_on("Add this employee")
    visit("/")
    click_link("View All Divisions")
    click_link('Panda Wrangling')
    expect(page).to have_content("Ling-ling")
  end
end
