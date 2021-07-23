require 'rspec'
require 'word'
require 'definition'

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
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

  describe('.find') do
    it("finds a song by id") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('one', nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word1 = Word.new('one', nil)
      word1.save()
      word1.update('two')
      expect(word1.name).to(eq("two"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('two', nil)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#sort') do
    it("sort by name") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('two', nil)
      word2.save()
      word3 = Word.new('three', nil)
      word3.save()
      word4 = Word.new('four', nil)
      word4.save()
      expect(Word.sort().values[0]).to(eq(word4))
      expect(Word.sort().values[1]).to(eq(word1))
      expect(Word.sort().values[2]).to(eq(word3))
      expect(Word.sort().values[3]).to(eq(word2))
    end
  end

  describe('#search') do
    it("search by name") do
      word1 = Word.new('one', nil)
      word1.save()
      word2 = Word.new('two', nil)
      word2.save()
      temp = {word2.id=>word2}
      expect(Word.search('two')).to(eq(temp))
    end
  end

  describe('#definitions') do
    it("returns an word's definitions") do
      word1 = Word.new('one', nil)
      word1.save()
      def1 = Definition.new("the first counting number", word1.id, nil)
      def1.save()
      def2 = Definition.new("the loneliest number", word1.id, nil)
      def2.save()
      expect(word1.definitions()).to(eq([def1, def2]))
    end
  end
end