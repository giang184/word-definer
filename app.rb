require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get '/' do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/sort') do
  @sorted_words = Word.sort()
  erb(:sort)
end

post('/words') do
  word1 = Word.new(params[:word_name], nil)
  word1.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  redirect to('/words')
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

post('/words/search_result') do
  @search_words = Word.search(params[:search])
  erb(:search_result)
end

get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end