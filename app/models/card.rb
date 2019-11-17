class Card < ActiveRecord::Base
  belongs_to :collection, optional: true
end
