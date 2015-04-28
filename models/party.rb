class Party < ActiveRecord::Base
  has_many :items, :through => :orders
  has_many :orders  


  def to_s
    "fun people!"
  end
end
