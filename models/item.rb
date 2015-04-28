#MENU ITEM

class Item < ActiveRecord::Base
  has_many(:orders)
  has_many(:parties, through: :orders)

  def price
    self.cents/100
  end

  def price=(new_price)
    self.cents=new_price*100
  end

  def to_s
    "pizza!"
  end
end
