class Collection < ActiveRecord::Base
  has_many :cards
  has_one :trendings
  belongs_to :user
end
