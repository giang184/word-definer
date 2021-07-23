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

describe('visits a word page', {:type => :feature}) do
  it('should visit a word page when clicked on a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'bye')
    click_on('Go!')
    click_on('bye')
    expect(page).to have_content('Word: bye')
  end
end

describe('update a word', {:type => :feature}) do
  it('should update a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'good')
    click_on('Go!')
    click_on('good')
    click_on('Edit word')
    fill_in('name', :with => 'bad')
    click_on('Update')
    expect(page).to have_content('bad')
  end
end

describe('sort the word list', {:type => :feature}) do
  it('should sort the word list') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'hi')
    click_on('Go!')
    click_on('View Sorted List')
    expect(page).to have_content('Words sorted by alphabetical order')
  end
end