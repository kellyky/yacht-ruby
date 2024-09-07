class Yacht

  CATEGORY = {
               'ones' => 1,
               'twos' => 2,
             'threes' => 3,
              'fours' => 4,
              'fives' => 5,
              'sixes' => 6,
         'full house' => :full_house,
     'four of a kind' => :four_of_a_kind,
    'little straight' => :little_straight,
       'big straight' => :big_straight,
             'choice' => :choice,
              'yacht' => :yacht,
  }

  private

  private_constant :CATEGORY

  def initialize(dice_rolls, category)
    @dice_rolls = dice_rolls
    @category = category
    @numbers_rolled = dice_rolls.uniq
  end

  def score_numeric_category
    dice_rolls.select { |roll| roll == CATEGORY[category] }.sum
  end

  def full_house
    return 0 unless numbers_rolled.size == 2

    numbers_rolled.each do |number|
      quantity = dice_rolls.count { |d| d == number }
      return dice_rolls.sum if quantity == 2
    end
    0
  end

  def four_of_a_kind
    four_of_a_kind = 0
    numbers_rolled.each do |number|
      quantity = dice_rolls.count { |d| d == number }
      four_of_a_kind = number if quantity >= 4
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

  public

  attr_reader :dice_rolls, :category, :numbers_rolled

  def score
    if CATEGORY[category].is_a? Integer
      score_numeric_category
    else
      send(CATEGORY[category])
    end
  end

end
