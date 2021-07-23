class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition.word_id())
  end

  def self.all
    @@definitions.values
  end

end