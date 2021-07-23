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

describe('add a word', {:type => :feature}) do
  it('should add a word and return to homepage') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'local')
    click_on('Go!')
    expect(page).to have_content('local')
  end
end

describe('visits a word page', {:type => :feature}) do
  it('should visit a word page when clicked on a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'hello')
    click_on('Go!')
    click_on('hello')
    expect(page).to have_content('Word: hello')
  end
end