class Guest < ActiveRecord::Base
  belongs_to (:party)
  has_many (:requests)
  has_one (:order)
  def to_s
    "hungry ol chap"
  end
end
