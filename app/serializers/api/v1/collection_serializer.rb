module API::V1
  class CollectionSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :thumb_image_url, :cards, :user_id

    def cards
      object.cards
    end
  end
end
