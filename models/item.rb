class Item < ActiveRecord::Base
  has_many(:requests)
  has_many(:orders, through: :requests)
  def to_s
    "pizza!"
  end
end
