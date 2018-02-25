class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    self.all[0..4]
  end

  def self.dinghy
    where("length" < ?, 20)
  end

  def self.ship
    where("length" >= ?, 20)
  end

  def self.last_three_alphabetically
    self.all.sort_by(:name)[0-2]
  end

  def self.without_a_captain
    self.find_all(|ship|ship.captain == nil)
end
