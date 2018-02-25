class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    all.limit(5)
  end

  def self.dinghy
    where("length < ?", 20)
  end

  def self.ship
    where("length >= ?", 20)
  end

  def self.last_three_alphabetically
    all.sort_by(:name).limit(2)
  end

  def self.without_a_captain
    where("captain_id = ?", nil)
  end

  def self.sailboats
    self.all.find_all{|boat|boat.classifications.include?("sailboat")}
  end

  def self.with_three_classifications
    self.all.find_all{|boat|boat.classifications.count == 3}
  end

end
