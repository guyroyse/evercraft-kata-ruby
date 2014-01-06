class Character

  ALIGNMENTS = [:good, :neutral, :evil]

  attr_accessor :name
  attr_reader :alignment, :armor_class, :hit_points

  def initialize
    @alignment = :neutral
    @armor_class = 10
    @hit_points = 5
  end

  def alignment= alignment
    raise "Invalid alignment" unless ALIGNMENTS.include? alignment
    @alignment = alignment
  end

end
