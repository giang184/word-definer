class Word
  attr_reader :id
  attr_accessor :name
  @@words = {}
  @@total_rows = 0

  def initialize(name, id) 
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.id)
  end

  def self.search(name)
    @@words.select{|key, value| value.name.downcase.include? name.downcase}
  end

  def self.sort
    temp = @@words.sort_by { |key, val| val.name.downcase }
    temp_hash = {}
    temp.each { |element|
      temp_hash[element[0]] = element[1]
    }
    temp_hash
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end