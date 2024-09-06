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

  def initialize(dice_rolls, category)
    @dice_rolls = dice_rolls
    @category = category
  end

  def score_numeric_category
    dice_rolls.select { |roll| roll == CATEGORY[category] }.sum
  end

  def full_house

  end

  def four_of_a_kind
    require 'pry-byebug'
    binding.pry

    numbers_rolled = dice_rolls.uniq

    case numbers_rolled.size
    when 1
      4 * numbers_rolled.first
    when 2
      # check if either number is 4 or more dice
      # 
    else
      0
    end

    # determine which roll is 4 or more
    #
    
  end

  def little_straight

  end

  def big_straight

  end

  def choice
    # TODO: do this work in the hash
    dice_rolls.sum
  end

  def yacht
    dice_rolls.uniq.size == 1 ? 50 : 0
  end

  public

  attr_reader :dice_rolls, :category

  def score
    if CATEGORY[category].is_a? Integer
      score_numeric_category
    else
      send(CATEGORY[category])
    end
  end

end
