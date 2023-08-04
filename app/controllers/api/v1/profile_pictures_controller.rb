# app/controllers/api/v1/profile_pictures_controller.rb

module Api
  module V1
    class ProfilePicturesController < ApplicationController
      def upload
        if params[:profile_picture].present?
          # Assuming you have a User model with a `profile_picture` attribute
          current_user.update(profile_picture: params[:profile_picture])
          render json: { profile_picture_url: current_user.profile_picture_url }, status: :ok
        else
          render json: { error: 'No profile picture provided' }, status: :unprocessable_entity
        end
      end
    end
  end
end
