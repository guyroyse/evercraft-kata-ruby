class Character

  ALIGNMENTS = [:good, :neutral, :evil]

  attr_accessor :name
  attr_reader :alignment, :experience_points

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
    @experience_points = 0
    @damage = 0

  end

  def alignment= alignment
    raise "Invalid alignment" unless ALIGNMENTS.include? alignment
    @alignment = alignment
  end

  def level
    @experience_points / 1000 + 1
  end

  def armor_class
    10 + dexterity.modifier
  end

  def hit_points
    hit_points_per_level * level
  end

  def current_hit_points
    hit_points - @damage
  end

  def alive?
    current_hit_points > 0
  end

  def dead?
    !alive?
  end

  def attack_modifier
    strength.modifier + level / 2
  end

  def attack defender, roll
    hit = roll + attack_modifier >= defender.armor_class
    if hit
      defender.damage calculate_damage(roll)
      @experience_points += 10
    end
    hit
  end

  def damage points
    @damage += points
  end

  private

  def hit_points_per_level
    [5 + constitution.modifier, 1].max
  end

  def calculate_damage roll
    total_damage = 0
    total_damage = attack_damage
    total_damage += attack_damage if is_critical(roll)
    [1, total_damage].max
  end
  
  def attack_damage
    1 + strength.modifier
  end

  def is_critical roll
    roll == 20
  end
  
end

