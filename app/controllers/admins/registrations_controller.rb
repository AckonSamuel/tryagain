# frozen_string_literal: true

module Admins
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
  
      def create
        admin = Admin.create(admin_params)
        if admin.valid? && admin.save
          admin.send_confirmation_instructions unless admin.confirmed?
          render json: admin,
                 status: 201
          return
        end
        render json: admin.errors,
               status: 400
      end
  
      private
  
      def admin_params
        params.require(:admin).permit(
          :first_name,
          :other_name,
          :last_name,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
  