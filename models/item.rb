class Item < ActiveRecord::Base
  has_many(:requests)
  has_many(:ordrs, through: :requests)
  def to_s
    "pizza!"
  end
end
