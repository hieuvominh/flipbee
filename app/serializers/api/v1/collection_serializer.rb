module API::V1
  class CollectionSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :thumb_image_url, :cards

    def cards
      object.cards
    end
  end
end
