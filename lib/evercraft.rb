class Character

  ALIGNMENTS = [:good, :neutral, :evil]

  attr_accessor :name
  attr_reader :alignment

  def initialize
    @alignment = :neutral
  end

  def alignment= alignment
    raise "Invalid alignment" unless ALIGNMENTS.include? alignment
    @alignment = alignment
  end

end
