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
    expect(page).to have_content('Words and their definitions sorted by alphabetical order')
  end
end

describe('delete a word', {:type => :feature}) do
  it('should delete a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'good')
    click_on('Go!')
    click_on('good')
    click_on('Edit word')
    click_on('Delete word')
    expect(page).to_not have_content('good')
  end
end

describe('add a definition', {:type => :feature}) do
  it('should add a definition') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'swimming')
    click_on('Go!')
    click_on('swimming')
    fill_in('definition_name', :with => 'you paddle with your arms')
    click_on('Add')
    expect(page).to have_content('you paddle with your arms')
  end
end

describe('update a definition', {:type => :feature}) do
  it('should update a definition') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'jogging')
    click_on('Go!')
    click_on('jogging')
    fill_in('definition_name', :with => 'run slowly')
    click_on('Add')
    click_on('run slowly')
    fill_in('name', :with => 'run slowly with your legs')
    click_on('Update')
    expect(page).to have_content('run slowly with your legs')
  end
end

describe('delete a definition', {:type => :feature}) do
  it('should delete a definition') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'greetings')
    click_on('Go!')
    click_on('greetings')
    fill_in('definition_name', :with => 'hello to someone')
    click_on('Add')
    click_on('hello to someone')
    click_on('Delete definition')
    expect(page).to_not have_content('hello to someone')
  end
end
