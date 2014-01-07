class Character

  ALIGNMENTS = [:good, :neutral, :evil]

  attr_accessor :name
  attr_reader :alignment, :armor_class, :hit_points

  def self.ability *abilities
    @@abilities = abilities
    abilities.each do |ability|
      define_method ability do
        instance_variable_get "@#{ability}".to_sym
      end
    end
  end

  ability :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma
  
  def initialize

    @@abilities.each do |ability|
      instance_variable_set "@#{ability}".to_sym, Ability.new
    end 
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

