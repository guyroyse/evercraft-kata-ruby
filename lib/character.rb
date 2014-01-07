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

  def attack defender, roll
    hit = roll >= defender.armor_class
    defender.damage if hit
    defender.damage if is_critical(roll)
    hit
  end

  def damage
    @hit_points -= 1
  end

  def alive?
    @hit_points > 0
  end

  def dead?
    !alive?
  end

  private
  
  def is_critical roll
    roll == 20
  end
  
end

