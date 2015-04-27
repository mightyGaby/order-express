class Order < ActiveRecord::Base
  belongs_to(:party)
  belongs_to(:item)
  def to_s
    "pizza!"
  end
end
