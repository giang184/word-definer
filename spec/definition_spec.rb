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

end
