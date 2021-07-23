require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('visits home page', {:type => :feature}) do
  it('should visit the home page') do
    visit('/')
    expect(page).to have_content('Your Own Dictionary')
  end
end

describe('visits home page', {:type => :feature}) do
  it('should visit the home page') do
    visit('/words')
    expect(page).to have_content('Your Own Dictionary')
  end
end

describe('visits a word page', {:type => :feature}) do
  it('should visit a word page when clicked on a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'local')
    click_on('Go!')
    expect(page).to have_content('local')
  end
end