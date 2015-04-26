class Request < ActiveRecord::Base
  belongs_to (:guest)
  belongs_to (:item)
  belongs_to (:order)
  def to_s
    "fun people!"
  end
end
