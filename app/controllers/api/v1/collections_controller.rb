module API::V1
  class CollectionsController < ApplicationController
    before_action :authorize_request, except: %i[index show]

    def index
      collection = Collection.all
      if params[:user_id]
        collection = collection.where(user_id: params[:user_id])
      end
      render json: collection, serializer_each: serializer, root: false, adapter: :attributes
    end

    def create
      collection = Collection.create!(collection_params.merge(:user_id => @current_user.id))
      if(collection.id)
        Trending.create!(
          zdaily: 0, 
          previous_daily_total: 0, 
          daily_total: 0, 
          zmonthly: 0, 
          previous_monthly_total: 0,
          monthly_total: 0,
          collection_id: collection.id
        )
      end
      render json: collection, serializer: serializer, status: :created, root: false, adapter: :attributes
    end

    def show
      collection = Collection.find(params[:id])
      trending = Trending.where(collection_id: collection.id).first
      trending.daily_total +=1
      trending.monthly_total +=1
      trending.save!
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
