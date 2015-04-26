class Request < ActiveRecord::Base
  belongs_to (:guest)
  belongs_to (:item)
  belongs_to (:ordr)
  def to_s
    "fun people!"
  end
end
