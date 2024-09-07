class Yacht

  SCORE_CATEGORY = {
      'ones' => 1,
      'twos' => 2,
    'threes' => 3,
     'fours' => 4,
     'fives' => 5,
     'sixes' => 6,
  }

  private

  private_constant :SCORE_CATEGORY

  def initialize(dice_rolls, category)
    @dice_rolls = dice_rolls
    @category = category
  end

  def numbers_rolled
    dice_rolls.uniq
  end

  def quantity(number)
    dice_rolls.count { |d| d == number }
  end

  def full_house
    return 0 unless numbers_rolled.size == 2

    numbers_rolled.each do |number|
      return dice_rolls.sum if quantity(number) == 2
    end
    0
  end

  def four_of_a_kind
    four_of_a_kind = 0
    numbers_rolled.each do |number|
      four_of_a_kind = number if quantity(number) >= 4
    end
    four_of_a_kind * 4
  end

  def little_straight
    dice_rolls.sort == [1, 2, 3, 4, 5] ? 30 : 0
  end

  def big_straight
    dice_rolls.sort == [2, 3, 4, 5, 6] ? 30 : 0
  end

  def choice
    dice_rolls.sum
  end

  def yacht
    dice_rolls.uniq.size == 1 ? 50 : 0
  end

  def dice_number_category?
    SCORE_CATEGORY[category].is_a? Integer
  end

  def score_numeric_category
    dice_rolls.select { |roll| roll == SCORE_CATEGORY[category] }.sum
  end

  public

  attr_reader :dice_rolls, :category

  def score
    dice_number_category? and score_numeric_category or send(category.gsub(' ', '_'))
  end

end
