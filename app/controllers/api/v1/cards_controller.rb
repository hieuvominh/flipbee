# frozen_string_literal: true
module API::V1
  class CardsController < ApplicationController
    before_action :authorize_request, except: %i[index show]

    def index
      card = Card.all
      if params[:user_id]
        card = card.where(user_id: params[:user_id])
      end
      render json: card, serializer_each: serializer, root: false, adapter: :attributes
    end

    def create
      card = Card.create!(card_params.merge(:user_id => @current_user.id))
      render json: card, serializer: serializer, status: :created, root: false, adapter: :attributes
    end

    def show
      card = Card.find(params[:id])
      render json: card, serializer: serializer, root: false, adapter: :attributes
    end

    def update
      card = Card.find(params[:id])
      if card.update(card_params)
        render json: card, serializer: serializer, root: false, adapter: :attributes
      else
        render json, status: 500
      end
    end

    def destroy
      card = Card.find(params[:id])
      card.destroy!
    end

    private

    # def card_params
    #   params.require(:card).permit(
    #     :image_front_card, :image_back_card,
    #     :description, :collection_id,
    #     :text_front_card, :text_back_card
    #   )
    # end

    def card_params
      params.permit(
        :image_front_card, :image_back_card,
        :description, :collection_id,
        :text_front_card, :text_back_card, :user_id
      )
    end

    def serializer
      API::V1::CardSerializer
    end
  end
end