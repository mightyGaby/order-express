class Party < ActiveRecord::Base
  has_many (:guests)
  has_many (:orders)
  def to_s
    "fun people!"
  end
end
