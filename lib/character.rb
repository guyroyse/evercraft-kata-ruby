class Character

  ALIGNMENTS = [:good, :neutral, :evil]

  attr_accessor :name
  attr_reader :alignment, :hit_points

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

  def armor_class
    10 + dexterity.modifier
  end

  def base_damage
    1 + strength.modifier
  end

  def attack defender, roll
    hit = roll + strength.modifier >= defender.armor_class
    defender.damage attack_damage(roll) if hit
    hit
  end

  def damage points
    @hit_points -= points
  end

  def alive?
    @hit_points > 0
  end

  def dead?
    !alive?
  end

  private

  def attack_damage roll
    total_damage = 0
    total_damage = base_damage
    total_damage += base_damage if is_critical(roll)
    [1, total_damage].max
  end
  
  def is_critical roll
    roll == 20
  end
  
end

