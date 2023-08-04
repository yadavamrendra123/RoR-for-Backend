
module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authenticate_user, except: [:login, :signup]

      def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = encode_token(user_id: user.id)
          render json: { token: token ,user: {
            email: user.email,
            id: user.id
          }}, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def signup
        user = User.new(user_params)

        if user.save
          token = encode_token(user_id: user.id)
          render json: { token: token }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # Other controller methods (if any)

      private

      def user_params
        params.require(:user).permit(:email, :password, :image)
      end

      def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end

      def authenticate_user

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
    end
  end
end
