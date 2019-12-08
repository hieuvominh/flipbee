class Card < ActiveRecord::Base
  belongs_to :collection, optional: true
  belongs_to :user
end
