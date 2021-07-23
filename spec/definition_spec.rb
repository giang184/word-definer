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

end
