# frozen_string_literal: true

module Users
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
  
      def create
        user = user.create(user_params)
        if user.valid? && user.save
          user.send_confirmation_instructions unless user.confirmed?
          render json: user,
                 status: 201
          return
        end
        render json: user.errors,
               status: 400
      end
  
      private
  
      def user_params
        params.require(:user).permit(
          :user_name,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
  