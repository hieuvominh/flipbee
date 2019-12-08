module API::V1
  class CollectionsController < ApplicationController
    before_action :authorize_request, except: %i[index show]

    def index
      render json: Collection.all, serializer_each: serializer, root: false, adapter: :attributes
    end

    def create
      collection = Collection.create!(collection_params.merge(:user_id => @current_user.id))
      render json: collection, serializer: serializer, status: :created, root: false, adapter: :attributes
    end

    def show
      collection = Collection.find(params[:id])
      render json: collection, root: false, serializer: serializer, adapter: :attributes
    end

    def update
      collection = Collection.find(params[:id])
      if collection.update(collection_params)
        render json: collection, serializer: serializer, root: false, adapter: :attributes
      else
        render json, status: 500
      end
    end

    def destroy
      collection = Collection.find(params[:id])
      collection.destroy!
      cards = Card.where(collection_id: params[:id])
      cards.update_all(collection_id: nil)
    end

    private

    def collection_params
      params.permit(
        :title, :description, :thumb_image_url, :user_id
      )
    end

    def serializer
      # API::V1::CollectionSerializer
    end
  end
end
