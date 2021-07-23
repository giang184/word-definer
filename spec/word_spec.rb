require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('two', nil)
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it("compares two words") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('one', nil)
      word2.save()
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all word") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('one', nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

end