class Party < ActiveRecord::Base
  has_many(:items, through: :orders)
  
  def to_s
    "fun people!"
  end
end
