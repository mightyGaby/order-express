class Ordr < ActiveRecord::Base
  belongs_to(:party)
  belongs_to(:guest)
  has_many(:requests)
  has_many(:items, through: :requests)
  def to_s
    "pizza!"
  end
end
