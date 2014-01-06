class Character

  attr_accessor :name, :alignment

  def initialize
    @alignment = :neutral
  end

  def alignment= alignment
    raise "Invalid alignment" unless [:good, :evil, :neutral].include? alignment
    @alignment = alignment
  end

end
