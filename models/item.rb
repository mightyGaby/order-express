#MENU ITEM

class Item < ActiveRecord::Base
  has_many(:parties, through: :orders)
  def to_s
    "pizza!"
  end
end
