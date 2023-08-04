class Api::V1::RestaurantsController < ApplicationController
              before_action :set_restaurant, only: [:show, :destroy, :update]
              before_action  :authenticate_user

              def index
                @restaurants = Restaurant.all
              end

              def show

              end

              def create
                @restaurant = Restaurant.new(restaurant_params)

                if @restaurant.save
                  render json: { message: 'Restaurant created successfully', restaurant: @restaurant }, status: :created
                else
                  render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
                end
              end

              def update
                if @restaurant.update(restaurant_params)
                  render json: { message: 'Restaurant updated successfully', restaurant: @restaurant }, status: :ok
                else
                  render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
                end
              end

              def destroy
                if @restaurant.destroy
                  render json: { message: 'Restaurant deleted successfully' }, status: :ok
                else
                  render json: { error: 'Failed to delete the restaurant' }, status: :unprocessable_entity
                end

              end
              private
              def authenticate_user
                # Extract the JWT token from the request headers
                token = request.headers['Authorization']&.split(' ')&.last



                unless token && decode_token(token)
                  render json: { error: 'Authentication token missing or invalid' }, status: :unauthorized
                end
              end

              def decode_token(token)
                begin
                  JWT.decode(token, Rails.application.secrets.secret_key_base).first
                rescue JWT::DecodeError
                  nil
                end
              end
              def set_restaurant
                @restaurant = Restaurant.find(params[:id])
              end
              def restaurant_params
                params.require(:restaurant).permit(:name, :description, :rating)
              end
end
