# frozen_string_literal: true
module API::V1
  class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    def index
      @user = User.all
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
      end
    end

    def show
      @user = User.find(params[:id])
      render json: @user, serializer: serializer, root: false, adapter: :attributes
    end

    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy!
    end

    private

    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
      params.permit(
        :username, :email, :password, :password_confirmation
      )
    end

    def serializer
      API::V1::UserSerializer
    end
  end
end