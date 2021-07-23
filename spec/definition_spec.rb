require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("soccer", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same text as another definition") do
      def1 = Definition.new("test", @word.id, nil)
      def2 = Definition.new("test", @word.id, nil)
      expect(def1).to(eq(def2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      def2 = Definition.new("game of kick", @word.id, nil)
      def2.save()
      expect(Definition.all).to(eq([def1, def2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      def2 = Definition.new("game of kick", @word.id, nil)
      def2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      expect(Definition.all).to(eq([def1]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      def2 = Definition.new("game of kick", @word.id, nil)
      def2.save()
      expect(Definition.find(def2.id)).to(eq(def2))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      def1.update("game of kick", @word.id)
      expect(def1.name).to(eq("game of kick"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      def1 = Definition.new("ball", @word.id, nil)
      def1.save()
      def2 = Definition.new("game of kick", @word.id, nil)
      def2.save()
      def1.delete()
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('.find_by_word') do
    it("finds definition for a word") do
      word1 = Word.new('football', nil)
      word1.save()
      def1 = Definition.new("game of kick", @word.id, nil)
      def1.save()
      def2 = Definition.new("game of run and throw", word1.id, nil)
      def2.save()
      expect(Definition.find_by_word(word1.id)).to(eq([def2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      def1 = Definition.new("game of kick", @word.id, nil)
      def1.save()
      expect(def1.word()).to(eq(@word))
    end
  end
end
