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
end
