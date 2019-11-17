module API::V1
  class CollectionsController < ApplicationController
    def index
      render json: Collection.all, serializer_each: serializer, root: false
    end

    def create
      collection = Collection.create!(collection_params)
      render json: collection, serializer: serializer, status: :created, root: false
    end

    def show
      collection = Collection.find(params[:id])
      render json: collection, serializer: serializer, root: false
    end

    def update
      collection = Collection.find(params[:id])
      if collection.update(collection_params)
        render json: collection, serializer: serializer, root: false
      else
        render json, status: 500
      end
    end

    def destroy
      collection = Collection.find(params[:id])
      collection.destroy!
    end

    private

    def collection_params
      params.require(:collection).permit(
        :title, :description, :thumb_image_url
      )
    end

    def serializer
      API::V1::CollectionSerializer
    end
  end
end
