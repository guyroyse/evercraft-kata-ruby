class Ability

  attr_reader :score

  def initialize
    @score = 10
  end

  def score= score
    raise "Score must be between 1 and 20" unless score_in_range(score)
    @score = score
  end

  private

  def score_in_range score
    score < 21 && score > 0
  end

end
