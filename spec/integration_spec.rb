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
