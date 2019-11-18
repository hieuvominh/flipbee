module API::V1
  class CardSerializer < ActiveModel::Serializer
    attributes :id, :image_front_card, :image_back_card, :description, :collection_id, :text_front_card, :text_back_card
  end
end
